using build

** Provides a targeted environment for a pod. 
** Always provides access to the libs in HomeDir and WorkDirs, as a fail safe! (
** 
** Has to cater for 
**  - building a pod - fan build.fan
**  - running a pod - fan afEggbox
**  - compiling in F4
**  - running from F4
** 
** Does not cater for 
**  - running a script - fan appBuild.fan (should just take latest?)
** 
** Creates a targeted environment for a pod
const class FpmEnv : Env {
	private static const Log 	log := FpmEnv#.pod.log

	private const Str:PodFile	resolved
			const FpmConfig		fpmConfig
			const Str?			targetPod
			const Str:PodFile	podFiles	
	
	new make(|This|? in := null) : super.make() {
		in?.call(this)	// can't do field null comparison without an it-block ctor

		fpmConfig	= FpmConfig()
		podFiles	= Str:PodFile[:] 
		depends := null as PodDependencies
		error	:= null as Err

		try {
			args := Env.cur.vars["FPM_CMDLINE_ARGS"]
			if (args == null)
				log.warn("Env Var 'FPM_CMDLINE_ARGS' not found")
			else {
				results	  := findPodFiles(fpmConfig, args)
				targetPod  = (Str) 				results[0]
				podFiles  := (Str:PodFile) 		results[1]
				depends    = (PodDependencies)	results[2] 

				if (targetPod.endsWith(" 0"))
					targetPod += "+"

				allPodFiles	:= Str:PodFile[:]
				podRegex	:= ".+\\.pod".toRegex

				this.resolved = podFiles.dup
				// add pods in the the home and work dirs
				fpmConfig.podDirs .each {              (it).listFiles(podRegex).each { if (it.isDir.not && podFiles.containsKey(it.basename).not) podFiles[it.basename] = PodFile(it) } }
				fpmConfig.workDirs.each { (it + `lib/fan/`).listFiles(podRegex).each { if (it.isDir.not && podFiles.containsKey(it.basename).not) podFiles[it.basename] = PodFile(it) } }
				this.podFiles = podFiles
			}

		} catch (UnknownPodErr err) {
			// TODO: auto-download / install the pod dependency!
			// beware, also thrown by BuildPod on malformed dependency str
			error = err

		} catch (Err err)
			error = err

		try {
			log.debug(debug)
	
			if (depends != null && depends.unsatisfied.isEmpty.not) {
				output	:= "Could not satisfy the following constraints:\n"
				maxCon	:= depends.unsatisfied.reduce(0) |Int size, con| { size.max(con.podVersion.depend.toStr.size) } as Int
				depends.unsatisfied.each {
					output += "${it.podVersion.name}@${it.podVersion.version}".justr(maxCon + 2) + " -> ${it.depend}\n"
				}
				log.warn(output)
			}
			
			if (error != null)
				log.err(error.toStr)
			error?.trace
	
			if (podFiles.isEmpty)
				log.warn("Defaulting to PathEnv")

		} catch (Err err) {
			err.trace

		} finally {
			this.podFiles = this.podFiles != null ? this.podFiles : [:]
			this.resolved = this.resolved != null ? this.resolved : [:]
		}
	}
	
	**
	** Working directory is always first item in `path`.
	**
	override File workDir() {
		fpmConfig.workDirs.first
	}

	**
	** Temp directory is always under `workDir`.
	**
	override File tempDir() {
		fpmConfig.tempDir
	}
	
	override Str[] findAllPodNames() {
		podFiles.keys 
	}

	override File? findPodFile(Str podName) {
		podFiles.get(podName)?.file 
	}

	override File[] findAllFiles(Uri uri) {
		fpmConfig.workDirs.map { it + uri }.exclude |File f->Bool| { f.exists.not }
	}

	override File? findFile(Uri uri, Bool checked := true) {
		if (uri.isPathAbs) throw ArgErr("Uri must be rel: $uri")
		return fpmConfig.workDirs.eachWhile |dir| {
			f := dir.plus(uri, false)
			return f.exists ? f : null
		} ?: (checked ? throw UnresolvedErr(uri.toStr) : null)
	}

	Str debug() {
		str	:= "\n\n"
		str += "Fantom Pod Manager (FPM) Environment ${typeof.pod.version}\n"
		str += "\n"
		str += "Target Pod : ${targetPod}\n"
		str += fpmConfig.debug

		str += "\n"
		str += "Resolved ${resolved.size} pods:\n"
		
		maxNom := resolved.reduce(0) |Int size, podFile| { size.max(podFile.name.size) } as Int
		maxVer := resolved.reduce(0) |Int size, podFile| { size.max(podFile.version.toStr.size) }
		resolved.keys.sort.each |key| {
			podFile := resolved[key]
			str += podFile.name.justr(maxNom + 2) + " " + podFile.version.toStr.justl(maxVer) + " - " + podFile.file.osPath + "\n"
		}
		str += "\n"
		return str
	}
	
	internal static Str[] splitStr(Str? str) {
		if (str?.trimToNull == null)	return Str#.emptyList
		strings	 := Str[,]
		chars	 := Int[,]
		prev	 := (Int?) null
		inQuotes := false
		str.each |c| {
			if (c.isSpace && inQuotes.not) { 
				if (chars.isEmpty.not) {
					strings.add(Str.fromChars(chars))
					chars.clear
				}
			} else if (c == '"') {
				if (inQuotes.not)
					if (chars.isEmpty)
						inQuotes = true
					else
						chars.add(c)
				else {
					inQuotes = false
					strings.add(Str.fromChars(chars))
					chars.clear					
				}
				
			} else
				chars.add(c)

			prev = null
		}

		if (chars.isEmpty.not)
			strings.add(Str.fromChars(chars))

		return strings
	}
	
	private static Obj[] findPodFiles(FpmConfig fpmConfig, Str? cmdLineArgs) {
		// add F4 pod locations
		f4PodPaths	:= Env.cur.vars["F4PODENV_POD_LOCATIONS"]?.trimToNull?.split(File.pathSep.chars.first, true) ?: Str#.emptyList
		f4PodFiles	:= f4PodPaths.map { toFile(it) }

		podDepends	:= PodDependencies(fpmConfig, f4PodFiles)
		cmdArgs		:= splitStr(cmdLineArgs)
		buildPod	:= getBuildPod(cmdArgs.first)
		podName		:= null as Str
		
		if (buildPod != null) {
			podDepends.addPod(buildPod.podName) {
				// check the dependencies exist
				buildPod.depends.each {
					if (podDepends.podResolvers.resolve(Depend(it)).isEmpty)
						throw UnknownPodErr(ErrMsgs.env_couldNotResolvePod(it))
				}

				// this file shouldn't be read - it's just an id
				it.podVersions = [PodVersion(fpmConfig.workDirs.first + `${buildPod.podName}.pod`, Str:Str[
					"pod.name"		: buildPod.podName,
					"pod.version"	: buildPod.version.toStr,
					"pod.depends"	: buildPod.depends.join(";")
				])]
			}
			podName	= "${buildPod.podName} ${buildPod.version}"
		}
		
		if (podDepends.isEmpty) {
			podDepend := findPodDepend(cmdArgs.first)
			
			// given we're making a targeted environment, this is a fail safe / get out jail card 
			if (podDepend == null) {
				idx := cmdArgs.index("-fpmPod")
				if (idx != null)
					podDepend = findPodDepend(cmdArgs.getSafe(idx + 1))
			}
			
			if (podDepend != null) {
				podNode := podDepends.addPod(podDepend.name) {
					it.podVersions = podDepends.podResolvers.resolve(podDepend)
				}.pickLatestVersion
				
				if (podNode.podVersions.isEmpty)
					throw UnknownPodErr(ErrMsgs.env_couldNotResolvePod(podDepend.toStr))
				
				podName	= podDepend.toStr
			}
		}

		if (podDepends.isEmpty)
			log.warn("Could not parse pod from: ${cmdArgs.first}")
		
		podFiles := podDepends.satisfyDependencies.podFiles
		
		return [podName, podFiles, podDepends]
	}
	
	private static Depend? findPodDepend(Str? arg) {
		if (arg == null || arg.endsWith(".fan"))
			return null
		// TODO: check for version e.g. afIoc@3.0
		dependStr := (Str?) null
		if (arg.all { isAlphaNum })
			dependStr = arg

		if (dependStr == null && arg.all { isAlphaNum || equals(':') || equals('.') } && arg.contains("::"))
			dependStr = arg[0..<arg.index("::")]

		// double check valid pod names
		if (dependStr == null || dependStr.all { isAlphaNum }.not)
			return null
		
		dependStr += " 0+"

		return Depend(dependStr, true)
	}

	private static BuildPod? getBuildPod(Str? filePath) {
		try {
			if (filePath == null)
				return null
			file := filePath.startsWith("file:") ? File(filePath.toUri, false) : File.os(filePath)
			if (file.isDir || file.exists.not || file.ext != "fan")
				return null
			
			// use Plastic because the default pod name when running a script (e.g. 'build_0') is already taken == Err
			return PlasticCompiler().compileCode(file.readAllStr).types.find { it.fits(BuildPod#) }?.make
		} catch
			return null
	}
	
	private static File toFile(Str filePath) {
		file := filePath.startsWith("file:") ? File(filePath.toUri, false) : File.os(filePath)
		return file.normalize
	}
}
