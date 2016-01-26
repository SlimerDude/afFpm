
internal class TestDependencySatisfaction : Test {
	
	PodDependencies? 	podDepends
	PodResolverCache?	podDependsCache

	override Void setup() {
		podDependsCache	= PodResolverCache()
		podDepends = PodDependencies(FpmConfig(), File#.emptyList) {
			it.podResolvers.resolvers = [podDependsCache]
		}
	}
	
	Void testEasyHappyPath() {
		// everyone depends on the same versions
		addDep("afBed 2.0", "afPlastic 1.2")
		addDep("afIoc 2.0", "afPlastic 1.2")
		addDep("afPlastic 1.2")
		
		satisfyDependencies("afBed 2.0, afIoc 2.0")
		
		verifyPodFiles("afIoc 2.0, afBed 2.0, afPlastic 1.2")
	}

	Void testPaths2() {
		addDep("afIoc 2.0", "afPlastic 1.0 - 2.0")
		addDep("afBed 2.0", "afPlastic 1.2")
		addDep("afPlastic 2.0")
		addDep("afPlastic 1.2")
		
		satisfyDependencies("afBed 2.0, afIoc 2.0")
		
		verifyPodFiles("afIoc 2.0, afBed 2.0, afPlastic 1.2")
	}
	
	Void testPaths3() {
		addDep("afIoc 2.0", "afPlastic 1.2")
		
		satisfyDependencies("afIoc 2.0")
		verify(podDepends.podFiles.isEmpty)
	}

	Void testPaths4() {
		addDep("afBed 2.0", "afPlastic 1.2")
		addDep("afIoc 2.0", "afPlastic 1.4 - 2.0")
		addDep("afPlastic 1.4")
		addDep("afPlastic 1.2")
		
		satisfyDependencies("afBed 2.0, afIoc 2.0")
		verify(podDepends.podFiles.isEmpty)
	}
	
	Void testPaths5() {
		addDep("afBed 2.0", "afIoc 3.0, afPlastic 1.4 - 2.0")
		addDep("afIoc 3.0", "afPlastic 3.0")
		addDep("afPlastic 2.0")
		addDep("afPlastic 3.0")
		
		satisfyDependencies("afBed 2.0, afIoc 3.0")
		verify(podDepends.podFiles.isEmpty)
	}

	Void testPaths6() {
		addDep("afBed 2.0", "afIoc 2.0 - 3.0, afPlastic 1.4")
		addDep("afIoc 2.0", "afPlastic 1.4")
		addDep("afIoc 3.0", "afPlastic 2.0")
		addDep("afPlastic 1.4")
		addDep("afPlastic 2.0")
		
		satisfyDependencies("afBed 2.0")

		verifyPodFiles("afBed 2.0, afIoc 2.0, afPlastic 1.4")
	}

	Void testPaths7() {
		// test filter out pods that can't be reached with current selection
		addDep("afBed 2.0", "afIoc 2.0-3.0")
		addDep("afIoc 2.0")
		addDep("afIoc 3.0", "afPlastic 2.0")
		
		satisfyDependencies("afBed 2.0")

		verifyPodFiles("afBed 2.0, afIoc 2.0")
	}

	Void testPaths8() {
		// same as above but with more potential for NPEs
		addDep("afBed 2.0", "afIoc 2.0-3.0")
		addDep("afIoc 3.0")
		addDep("afIoc 2.0", "afPlastic 2.0")
		
		satisfyDependencies("afBed 2.0")

		verifyPodFiles("afBed 2.0, afIoc 3.0")
	}
	
	private Void satisfyDependencies(Str pods) {
		pods.split(',').map { Depend(it) }.each |Depend d| {
			podDepends.addPod(d.name) {
				it.podVersions = podDepends.podResolvers.resolve(d)
			}
		}
		podDepends.satisfyDependencies
	}

	private Void verifyPodFiles(Str pods) {
		expected := pods.split(',').map { Depend(it) }
		actual 	 := podDepends.podFiles.vals.map { Depend("$it.name $it.version") }
		common	 := expected.intersection(actual)
		all		 := expected.union(actual)
		diff	 := all.removeAll(common)
		if (diff.isEmpty.not) {
			expected = expected.removeAll(common).insertAll(0, common)
			actual   = actual  .removeAll(common).insertAll(0, common)
			verifyEq(expected, actual)
		}
	}
	
	// dependents
	private Void addDep(Str dependency, Str? dependents := null) {
		podDependsCache.cache[Depend(dependency)] = PodVersion.makeForTesting {
			it.name 	= Depend(dependency).name
			it.version	= Depend(dependency).version
			it.depends	= dependents?.split(',')?.map { Depend(it) } ?: Depend#.emptyList 
			it.url		= ``
		}
	}
}

internal class PodResolverCache : PodResolver {
	Depend:PodVersion	cache	:= Depend:PodVersion[:]
	
	override PodVersion[] resolve(Depend dependency) {
		cache.findAll |podVersion, depend| {
			depend.name == dependency.name && dependency.match(depend.version)
		}.vals
	}
	override PodVersion[] resolveAll() {
		cache.vals
	}
}