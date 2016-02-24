using util

**
** Executes a pod / method, within the FPM environment.
** 
@NoDoc
class RunCmd : FpmCmd {
	
	@Arg
	Str[]?	args
	
	override Int go() {
		fanFile	:= Env.cur.os == "win32" ? `bin/fan.bat` : `bin/fan`
		cmds	:= Env.cur.args.rw
		fanCmd	:= (Env.cur.homeDir + fanFile).normalize.osPath
		cmds[0] = fanCmd
		log.info("Running " + cmds[1..-1].join(" "))
		
		// launch pods
		// FIXME remove @version
		// FIXME cater for BedSHeet
		// FIXME cater for Reflux
		// FIXME remove @version
		
		process := Process(cmds)
		process.mergeErr = false
		process.env["FPM_TARGET"] = cmds.getSafe(1) ?: ""
		return process.run.join
	}
	
	override Bool argsValid() { true }
}
