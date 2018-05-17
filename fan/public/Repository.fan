
const mixin Repository {

	abstract Str name()
	abstract Uri url()
	
	abstract Void		upload			(PodFile podFile)
	abstract File		download		(PodFile podFile)
	abstract Void		delete			(PodFile podFile)
	abstract Bool		isLocal			()
			 Bool		isRemote		() { !isLocal }
	
	abstract PodFile[]	resolveAll		()
	
	** Options are targeted at remote fanr repositories and may include:
	**  - 'maxPods (Int)' - the maximum number of pods to return. (defaults to 5).
	**  - 'noCore (Bool)' - do not bother querying for core pods.
	**  - 'log (Log)' - query results will be logged to this.
	abstract PodFile[]	resolve			(Depend depend, Str:Obj? options)
	
	@NoDoc override Str toStr() 			{ "$name - $url" }
	@NoDoc override Int hash() 				{ url.hash }
	@NoDoc override Bool equals(Obj? that)	{ (that as Repository)?.url == url }
}

