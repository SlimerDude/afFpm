
internal class TestDependencyFile : Test {
	
	StubRepository? 	repository
	Satisfier?			satisfier

	override Void setup() {
		repository = StubRepository()
	}
	
	Void testFile() {
		FpmEnv#.pod.log.level = LogLevel.debug

		// Trace dependency file for afApp 0.2.0.225 - 17-May-2018 Thu 00:32:52 GMT/BST
		
		addDep("afBeanUtils 1.0.8", "sys 1.0")
		addDep("afBedSheet 1.5.2", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, wisp 1.0.66-1.0, util 1.0.68-1.0, inet 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1")
		addDep("afBedSheet 1.5.3", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, wisp 1.0.66-1.0, util 1.0.68-1.0, inet 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, webmod 1.0, xml 1.0")
		addDep("afBedSheet 1.5.4", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, wisp 1.0.66-1.0, util 1.0.68-1.0, inet 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1")
		addDep("afBedSheet 1.5.5", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, wisp 1.0.66-1.0, util 1.0.68-1.0, inet 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, webmod 1.0, xml 1.0")
		addDep("afBedSheet 1.5.6", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, wisp 1.0.66-1.0, util 1.0.68-1.0, inet 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1")
		addDep("afBedSheet 1.5.7", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, wisp 1.0.66-1.0, util 1.0.68-1.0, inet 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, webmod 1.0, xml 1.0")
		addDep("afBedSheet 1.5.8", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, wisp 1.0.66-1.0, util 1.0.68-1.0, inet 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1")
		addDep("afBedSheet 1.5.9", "sys 1.0.69-1.0, concurrent 1.0.69-1.0, web 1.0.69-1.0, wisp 1.0.69-1.0, util 1.0.69-1.0, inet 1.0.69-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, webmod 1.0, xml 1.0")
		addDep("afBedSheet 1.5.10", "sys 1.0.69-1.0, concurrent 1.0.69-1.0, web 1.0.69-1.0, wisp 1.0.69-1.0, util 1.0.69-1.0, inet 1.0.69-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1")
		addDep("afBedSheet 1.5.11", "sys 1.0.69-1.0, concurrent 1.0.69-1.0, web 1.0.69-1.0, wisp 1.0.69-1.0, util 1.0.69-1.0, inet 1.0.69-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, webmod 1.0, xml 1.0")
		addDep("afBounce 1.1.2", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, wisp 1.0.68-1.0, web 1.0.68-1.0, inet 1.0.68-1.0, xml 1.0.68-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.2-1.5, afButter 1.2.2-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.0-0.1")
		addDep("afBounce 1.1.3", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, wisp 1.0.68-1.0, web 1.0.68-1.0, inet 1.0.68-1.0, xml 1.0.68-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.2-1.5, afButter 1.2.2-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.0-0.1")
		addDep("afBounce 1.1.4", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, wisp 1.0.68-1.0, web 1.0.68-1.0, inet 1.0.68-1.0, xml 1.0.68-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.2-1.5, afButter 1.2.2-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.0-0.1")
		addDep("afBounce 1.1.5", "sys 1.0.69-1.0, concurrent 1.0.69-1.0, wisp 1.0.69-1.0, web 1.0.69-1.0, inet 1.0.69-1.0, xml 1.0.69-1.0, afConcurrent 1.0.18-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.6-1.5, afButter 1.2.6-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.2-0.1")
		addDep("afBounce 1.1.6", "sys 1.0.69-1.0, concurrent 1.0.69-1.0, wisp 1.0.69-1.0, web 1.0.69-1.0, inet 1.0.69-1.0, xml 1.0.69-1.0, afConcurrent 1.0.18-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.6-1.5, afButter 1.2.6-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.2-0.1")
		addDep("afBounce 1.1.7", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, wisp 1.0.70-1.0, web 1.0.70-1.0, inet 1.0.70-1.0, xml 1.0.70-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.10-1.5, afButter 1.2.8-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.2-0.1")
		addDep("afBounce 1.1.8", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, wisp 1.0.70-1.0, web 1.0.70-1.0, inet 1.0.70-1.0, xml 1.0.70-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.10-1.5, afButter 1.2.8-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.2-0.1")
		addDep("afBounce 1.1.9", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, wisp 1.0.70-1.0, web 1.0.70-1.0, inet 1.0.70-1.0, xml 1.0.70-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.10-1.5, afButter 1.2.9-1.2, afSizzle 1.0.2-1.0, afHtmlParser 0.1.2-0.1")
		addDep("afBson 1.1.0", "sys 1.0.69-1.0, inet 1.0.69-1.0, concurrent 1.0.69-1.0")
		addDep("afButter 1.2.2", "sys 1.0.68-1.0, inet 1.0.68-1.0, web 1.0.68-1.0, util 1.0.68-1.0")
		addDep("afButter 1.2.3", "sys 1.0.68-1.0, inet 1.0.68-1.0, web 1.0.68-1.0, util 1.0.68-1.0")
		addDep("afButter 1.2.4", "sys 1.0.68-1.0, inet 1.0.68-1.0, web 1.0.68-1.0, util 1.0.68-1.0")
		addDep("afButter 1.2.5", "sys 1.0.68-1.0, inet 1.0.68-1.0, web 1.0.68-1.0, util 1.0.68-1.0")
		addDep("afButter 1.2.6", "sys 1.0.69-1.0, inet 1.0.69-1.0, web 1.0.69-1.0, util 1.0.69-1.0")
		addDep("afButter 1.2.7", "sys 1.0.69-1.0, inet 1.0.69-1.0, web 1.0.69-1.0, util 1.0.69-1.0")
		addDep("afButter 1.2.8", "sys 1.0.69-1.0, inet 1.0.69-1.0, web 1.0.69-1.0, util 1.0.69-1.0")
		addDep("afButter 1.2.9", "sys 1.0.69-1.0, inet 1.0.69-1.0, web 1.0.69-1.0, util 1.0.69-1.0")
		addDep("afColdFeet 1.4.0", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afBedSheet 1.5.0-1.5")
		addDep("afConcurrent 1.0.12", "sys 1.0, concurrent 1.0")
		addDep("afConcurrent 1.0.14", "sys 1.0, concurrent 1.0")
		addDep("afConcurrent 1.0.15", "sys 1.0, concurrent 1.0")
		addDep("afConcurrent 1.0.16", "sys 1.0.67-1.0, concurrent 1.0.67-1.0")
		addDep("afConcurrent 1.0.17", "sys 1.0.67-1.0, concurrent 1.0.67-1.0")
		addDep("afConcurrent 1.0.18", "sys 1.0.67-1.0, concurrent 1.0.67-1.0")
		addDep("afConcurrent 1.0.19", "sys 1.0.67-1.0, concurrent 1.0.67-1.0")
		addDep("afConcurrent 1.0.20", "sys 1.0.69-1.0, concurrent 1.0.69-1.0")
		addDep("afDuvet 1.1.2", "sys 1.0.68-1.0, util 1.0.68-1.0, web 1.0.68-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5")
		addDep("afDuvet 1.1.3", "sys 1.0.68-1.0, util 1.0.68-1.0, web 1.0.68-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5, afBounce 1.1.0-1.1, afButter 1.2.0-1.2")
		addDep("afDuvet 1.1.4", "sys 1.0.68-1.0, util 1.0.68-1.0, web 1.0.68-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5")
		addDep("afDuvet 1.1.5", "sys 1.0.68-1.0, util 1.0.68-1.0, web 1.0.68-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5, afBounce 1.1.0-1.1, afButter 1.2.0-1.2")
		addDep("afDuvet 1.1.6", "sys 1.0.68-1.0, util 1.0.68-1.0, web 1.0.68-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5")
		addDep("afDuvet 1.1.7", "sys 1.0.68-1.0, util 1.0.68-1.0, web 1.0.68-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.9-1.5")
		addDep("afDuvet 1.1.8", "sys 1.0.69-1.0, util 1.0.69-1.0, web 1.0.69-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.4-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.10-1.5")
		addDep("afEfan 1.5.2", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, afPlastic 1.1.0-1.1")
		addDep("afEfanXtra 1.2.0", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, fandoc 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.12-1.0, afPlastic 1.1.0-1.1, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afEfan 1.5.0-1.5")
		addDep("afFancordion 1.1.2", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, compiler 1.0.68-1.0, fandoc 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afPlastic 1.1.0-1.1")
		addDep("afFancordion 1.1.3", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, compiler 1.0.68-1.0, fandoc 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afPlastic 1.1.0-1.1, afBounce 1.1.0-1.1, afSizzle 1.0.2-1.0")
		addDep("afFancordion 1.1.4", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, compiler 1.0.68-1.0, fandoc 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afPlastic 1.1.0-1.1")
		addDep("afFancordion 1.1.5", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, compiler 1.0.68-1.0, fandoc 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afPlastic 1.1.0-1.1, afBounce 1.1.0-1.1, afSizzle 1.0.2-1.0")
		addDep("afFancordionBootstrap 1.0.2", "sys 1.0.68-1.0, afFancordion 1.1.0-1.1, afBeanUtils 1.0.4-1.0")
		addDep("afFormBean 1.2.2", "sys 1.0.69-1.0, concurrent 1.0.69-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.12-1.0, afIoc 3.0.0-3.0")
		addDep("afGoogleAnalytics 0.1.6", "sys 1.0.68-1.0, util 1.0.68-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5, afDuvet 1.1.0-1.1")
		addDep("afGoogleAnalytics 0.1.7", "sys 1.0.68-1.0, util 1.0.68-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5, afDuvet 1.1.0-1.1")
		addDep("afGoogleAnalytics 0.1.8", "sys 1.0.68-1.0, util 1.0.68-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.0-1.5, afDuvet 1.1.0-1.1")
		addDep("afGoogleAnalytics 0.1.9", "sys 1.0.70-1.0, util 1.0.70-1.0, afIoc 3.0.6-3.0, afIocConfig 1.1.0-1.1, afBedSheet 1.5.10-1.5, afDuvet 1.1.0-1.1")
		addDep("afHtmlParser 0.1.0", "sys 1.0, xml 1.0, afPegger 0.1.0-0.1")
		addDep("afHtmlParser 0.1.1", "sys 1.0, xml 1.0, afPegger 0.1.0-0.1")
		addDep("afHtmlParser 0.1.2", "sys 1.0, xml 1.0, afPegger 0.1.0-0.1")
		addDep("afIoc 3.0.0", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, afBeanUtils 1.0.8-1.0")
		addDep("afIoc 3.0.2", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, afBeanUtils 1.0.8-1.0")
		addDep("afIoc 3.0.4", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, afBeanUtils 1.0.8-1.0")
		addDep("afIoc 3.0.5", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.14-1.0")
		addDep("afIoc 3.0.7", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, afBeanUtils 1.0.8-1.0")
		addDep("afIocConfig 1.1.1", "sys 1.0.68-1.0, afBeanUtils 1.0.8-1.0, afIoc 3.0.0-3.0")
		addDep("afIocEnv 1.1.0", "sys 1.0.68-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1")
		addDep("afJobby 0.0.1", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.6-3.0")
		addDep("afMongo 1.1.6", "sys 1.0.69-1.0, inet 1.0.69-1.0, util 1.0.69-1.0, concurrent 1.0.69-1.0, afConcurrent 1.0.18-1.0, afBson 1.1.0-1.1")
		addDep("afMongo 1.1.7", "sys 1.0.69-1.0, inet 1.0.69-1.0, util 1.0.69-1.0, concurrent 1.0.69-1.0, afConcurrent 1.0.18-1.0, afBson 1.1.0-1.1")
		addDep("afMorphia 1.2.2", "sys 1.0.69-1.0, concurrent 1.0.69-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.18-1.0, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afBson 1.1.0-1.1, afMongo 1.1.6-1.1")
		addDep("afPdf 0.0.1", "sys 1.0.70-1.0, graphics 1.0.70-1.0, inet 1.0.70-1.0, gfx 1.0.70-1.0, xml 1.0.70-1.0, afSizzle 1.0.4-1.0")
		addDep("afPegger 0.1.0", "sys 1.0, afBeanUtils 1.0.8-1.0, xml 1.0, concurrent 1.0")
		addDep("afPillow 1.1.4", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, afBeanUtils 1.0.6-1.0, afConcurrent 1.0.12-1.0, afPlastic 1.1.0-1.1, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afBedSheet 1.5.6-1.5, afEfanXtra 1.2.0-1.2")
		addDep("afPillow 1.1.5", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, web 1.0.68-1.0, afBeanUtils 1.0.6-1.0, afConcurrent 1.0.12-1.0, afPlastic 1.1.0-1.1, afIoc 3.0.0-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afBedSheet 1.5.6-1.5, afEfanXtra 1.2.0-1.2, afBounce 1.1.0-1.1, afButter 1.2.0-1.2")
		addDep("afPlastic 1.1.2", "sys 1.0.68-1.0, concurrent 1.0.68-1.0, compiler 1.0.68-1.0, compilerJava 1.0.68-1.0, afBeanUtils 1.0.8-1.0")
		addDep("afSizzle 1.0.2", "sys 1.0, xml 1.0")
		addDep("afSizzle 1.0.4", "sys 1.0, xml 1.0")
		addDep("afSleepSafe 1.0.2", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, afIoc 3.0.6-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afConcurrent 1.0.20-1.1, afBedSheet 1.5.10-1.5")
		addDep("afSleepSafe 1.0.3", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, afIoc 3.0.6-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afConcurrent 1.0.20-1.1, afBedSheet 1.5.10-1.5, afBounce 1.1.8-1.1, afButter 1.2.8-1.2")
		addDep("afSlim 1.2.0", "sys 1.0.68-1.0, afEfan 1.5.0-1.5, afPlastic 1.1.0-1.1, afPegger 0.1.0-0.1")
		addDep("ckit 1.0.70", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, graphics 1.0.70-1.0, dom 1.0.70-1.0")
		addDep("compiler 1.0.70", "sys 1.0")
		addDep("compilerJava 1.0.70", "sys 1.0, compiler 1.0")
		addDep("concurrent 1.0.70", "sys 1.0")
		addDep("afApp 0.2.0.225", "sys 1.0.70-1.0, util 1.0.70-1.0, dom 1.0.70-1.0, ckit 1.0.70-1.0, graphics 1.0.70-1.0, wisp 1.0.70-1.0, web 1.0.70-1.0, afDomain 0.2.0-1.0, afScanner 0.2.0-1.0, afEmails 0.2.0-1.0, afJobs 0.2.0-1.0, afPdf2 0.2.0-1.0, afIoc 3.0.6-3.0, afIocEnv 1.1.0-1.1, afIocConfig 1.1.0-1.1, afFormBean 1.2.2-1.2, afMongo 1.1.6-1.1, afMorphia 1.2.2-1.2, afBedSheet 1.5.11-1.5, afPillow 1.1.4-1.1, afEfanXtra 1.2.0-1.2, afDuvet 1.1.8-1.1, afColdFeet 1.4.0-1.4, afSleepSafe 1.0.2-1.0, afGoogleAnalytics 0.1.6-0.1, afButter 1.2.9-1.2, concurrent 1.0.70-1.0, afBounce 1.1.9-1.1")
		addDep("afDomain 0.2.0", "sys 1.0.70-1.0, concurrent 1.0.70-1.0, graphics 1.0.70-1.0, util 1.0.70-1.0, afBeanUtils 1.0.8-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.6-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afFormBean 1.2.2-1.2, afBson 1.1.0-1.1, afMongo 1.1.7-1.1, afMorphia 1.2.2-1.2, afButter 1.2.8-1.2, afFancordion 1.1.5-1.1, afFancordionBootstrap 1.0.2-1.0")
		addDep("afEmails 0.2.0", "sys 1.0.70-1.0, xml 1.0.70-1.0, util 1.0.70-1.0, web 1.0.70-1.0, afIoc 3.0.6-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afButter 1.2.8-1.2, afDomain 0.2.0-1.0, afEfanXtra 1.2.0-1.2, afSlim 1.2.0-1.2, afHtmlParser 0.1.2-0.1, afSizzle 1.0.4-1.0, afFancordion 1.1.4-1.1, afFancordionBootstrap 1.0.2-1.0")
		addDep("afJobs 0.2.0", "sys 1.0.70-1.0, fandoc 1.0.70-1.0, concurrent 1.0.70-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.6-3.0, afIocEnv 1.1.0-1.1, afIocConfig 1.1.0-1.1, afMorphia 1.2.2-1.2, afBedSheet 1.5.11-1.5, afDomain 0.2.0-1.0, afJobby 0.0.1-1.0")
		addDep("afPdf2 0.2.0", "sys 1.0.70-1.0, graphics 1.0.70-1.0, afIoc 3.0.6-3.0, afIocEnv 1.1.0-1.1, afIocConfig 1.1.0-1.1, afDomain 0.2.0-1.0, afPdf 0.0.1-1.0")
		addDep("afScanner 0.2.0", "sys 1.0.70-1.0, util 1.0.70-1.0, concurrent 1.0.70-1.0, afDomain 0.2.0-1.0, afConcurrent 1.0.20-1.0, afIoc 3.0.6-3.0, afIocConfig 1.1.0-1.1, afIocEnv 1.1.0-1.1, afButter 1.2.9-1.2")
		addDep("dom 1.0.70.2", "sys 1.0, concurrent 1.0, graphics 1.0, web 1.0")
		addDep("fandoc 1.0.70", "sys 1.0")
		addDep("gfx 1.0.70", "sys 1.0, concurrent 1.0")
		addDep("graphics 1.0.69.12", "sys 1.0")
		addDep("graphics 1.0.70", "sys 1.0, concurrent 1.0")
		addDep("graphics 1.0.70.13", "sys 1.0, concurrent 1.0")
		addDep("graphics 1.0.70.14", "sys 1.0, concurrent 1.0")
		addDep("inet 1.0.70", "sys 1.0, concurrent 1.0")
		addDep("sys 1.0.70", "")
		addDep("util 1.0.70", "sys 1.0, concurrent 1.0")
		addDep("web 1.0.70", "sys 1.0, concurrent 1.0, inet 1.0")
		addDep("webmod 1.0.70", "sys 1.0, inet 1.0, web 1.0, util 1.0")
		addDep("wisp 1.0.70", "sys 1.0, util 1.0, concurrent 1.0, inet 1.0, web 1.0")
		addDep("xml 1.0.70", "sys 1.0")
		satisfyDependencies("afApp 0.2.0.225")

		Utils.dumpEnv(satisfier.targetPod, satisfier.resolvedPods.vals, null) { echo(it) }
		
		// TODO check logs for these test numbers:

		// [afFpmV2] Resolving pods for cwApp 0.2.0.225
		// [afFpmV2] Found 104 versions of 49 different pods
		// [afFpmV2] Calculated 550,502,400 dependency pod permutations
		// [afFpmV2] Collapsed to    69,120 dependency group permutations
		// [afFpmV2] Stated problem space in 806ms
		// [afFpmV2] Solving...
		// [afFpmV2]           ...Done
		// [afFpmV2] Cached 1218 bad dependency groups
		// [afFpmV2] Found 8 solutions in 3sec
	}

	private Void addDep(Str dependency, Str? dependents := null) {
		repository.add(dependency, dependents)
	}
	
	private Void satisfyDependencies(Str pod) {		
		target := Depend(pod)
		satisfier = Satisfier(TargetPod(target), Resolver([repository]))
		satisfier.satisfyDependencies
	}
}
