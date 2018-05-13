
internal class SinglePodRepository : Repository {
	override Str		name
	override Uri		url
	override Bool		isLocal	:= true
	private	 File		file
	private	 PodFile[]	podFile
	
	new make(File file) {
		this.name		= file.name
		this.url		= file.normalize.uri
		this.file		= file
		
		metaProps		:= readMetaProps(file)
		podName			:= metaProps["pod.name"]
		podVersion		:= Version(metaProps["pod.version"], true)
		podDependsOn	:= metaProps["pod.depends"].split(';').map { Depend(it, true) }
		this.podFile	= [PodFile(podName, podVersion, podDependsOn, this.url, this)]
	}

	override Void		upload		(PodFile podFile)	{ throw UnsupportedErr() }
	override File		download	(PodFile podFile)	{ file }
	override Void		delete		(PodFile podFile)	{ file.delete }
	override PodFile[]	resolveAll	()					{ podFile }
	override PodFile[]	resolve		(Depend depend)		{ podFile.first.fits(depend) ? podFile : PodFile#.emptyList }
	
	private Str:Str readMetaProps(File file) {
		if (file.exists.not)
			throw IOErr("File not found: ${file.normalize.osPath}")

		zip	:= Zip.read(file.in)
		try {
			File? 		entry
			[Str:Str]?	metaProps
			while (metaProps == null && (entry = zip.readNext) != null) {
				if (entry.uri == `/meta.props`)
					metaProps = entry.readProps
			}
			if (metaProps == null)
				throw IOErr("Could not find `/meta.props` in pod file: ${file.normalize.osPath}")

			return metaProps

		} finally {
			zip.close
		}	
	}
}
