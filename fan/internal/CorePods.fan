
internal const class CorePods {
	private static const Str[] corePodNames := "docIntro docLang docFanr docTools docDomkit build compiler compilerDoc compilerJava compilerJs concurrent dom domkit email fandoc fanr fansh flux fluxText fwt gfx graphics icons inet obix sql syntax sys testCompiler testJava testNative testSys util web webfwt webmod wisp xml".split

	Bool isCorePod(Str podName) {
		corePodNames.any { it.equalsIgnoreCase(podName) }
	}
}

