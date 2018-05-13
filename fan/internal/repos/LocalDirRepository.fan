
internal class LocalDirRepository : Repository {
	override Str			name
	override Uri			url
	override Bool			isLocal		:= true
	private  File:PodFile?	fileCache	:= File:PodFile?[:]
	private  File			dir
	
	new make(Str name, File dir) {
		this.name	= name
		this.dir	= dir.normalize
		this.url	= this.dir.uri
		
		if (!dir.isDir)
			throw IOErr("Not a directory: ${this.dir.osPath}")
	}

	override Void upload(PodFile podFile) {
		newFile := download(podFile)
		podFile.file.copyTo(newFile, ["overwrite" : true])
	}

	override File download(PodFile podFile) {
		dir.plus(`${podFile.name}.pod`)
	}

	override Void delete(PodFile podFile) {
		download(podFile).delete
	}

	override PodFile[] resolveAll() {
		dir.listFiles(Regex.glob("*.pod")).map { getOrMake(it) }.exclude { it == null }
	}

	override PodFile[] resolve(Depend depend) {
		file 	:= dir.plus(`${depend.name}.pod`)
		podFile	:= getOrMake(file)

		if (podFile == null)
			return PodFile#.emptyList
		
		if (!podFile.fits(depend))
			return PodFile#.emptyList
		
		return [podFile]
	}

	private PodFile? getOrMake(File file) {
		fileCache.getOrAdd(file) |->PodFile| {
			metaProps		:= readMetaProps(file)
			podName			:= metaProps["pod.name"]
			podVersion		:= Version(metaProps["pod.version"], true)
			podDependsOn	:= metaProps["pod.depends"].split(';').map { Depend(it, true) }
			return PodFile(podName, podVersion, podDependsOn, file.uri, this)
		}
	}

	private [Str:Str]? readMetaProps(File file) {
		// pods may not exist, but they must be valid
		if (file.exists.not)
			return null		
		return FileUtils.readMetaProps(file)
	}
}
