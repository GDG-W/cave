import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:cave/cave.dart';
import 'package:devfest24/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConferenceApp extends ConsumerStatefulWidget {
  const ConferenceApp({super.key});

  @override
  ConsumerState<ConferenceApp> createState() => _ConferenceAppState();
}

class _ConferenceAppState extends ConsumerState<ConferenceApp> {
  final designSize = const Size(430, 956);

  @override
  void initState() {
    super.initState();
    Devfest2024Router.instance.initialiseRouter(ref);
  }

  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      child: ScreenUtilInit(
        designSize: designSize,
        minTextAdapt: true,
        builder: (_, child) {
          return MaterialApp.router(
            title: 'Devfest24 Conference App',
            routerConfig: Devfest2024Router.instance.router,
            builder: (context, child) => AccessibilityTools(
              minimumTapAreas: const MinimumTapAreas(mobile: 30, desktop: 44),
              checkFontOverflows: true,
              child: child,
            ),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.light,
                surface: DevFestThemeData.light().backgroundColor,
              ),
              scaffoldBackgroundColor: DevFestThemeData.light().backgroundColor,
              useMaterial3: true,
              textTheme: const TextTheme(
                displayMedium: TextStyle(color: DevfestColors.grey10),
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                color: DevFestThemeData.light().backgroundColor,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent,
                scrolledUnderElevation: 0,
              ),
              extensions: <ThemeExtension<dynamic>>[
                /// Use the below format for raw theme data
                /// DevFestTheme(textTheme: DevfestTextTheme()),
                DevFestThemeData.light(),
              ],
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
                surface: DevFestThemeData.dark().backgroundColor,
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                color: DevFestThemeData.dark().backgroundColor,
                surfaceTintColor: Colors.transparent,
                scrolledUnderElevation: 0,
              ),
              scaffoldBackgroundColor: DevFestThemeData.dark().backgroundColor,
              useMaterial3: true,
              textTheme: const TextTheme(
                displayMedium: TextStyle(color: DevfestColors.grey100),
              ),
              extensions: <ThemeExtension<dynamic>>[
                /// Use the below format for raw theme data
                /// DevFestTheme(textTheme: DevfestTextTheme()),
                DevFestThemeData.dark(),
              ],
            ),
          );
        },
      ),
    );
  }
}