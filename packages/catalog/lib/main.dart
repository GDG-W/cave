import 'package:cave/cave.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        DeviceFrameAddon(
          devices: [
            DeviceInfo.genericPhone(
              platform: TargetPlatform.iOS,
              id: 'custom-device',
              name: 'Designer Frame',
              screenSize: const Size(430, 960),
            ),
            ...Devices.ios.all.where(
                (element) => element.identifier.type == DeviceType.phone),
            ...Devices.android.all.where(
                (element) => element.identifier.type == DeviceType.phone),
          ],
          initialDevice: Devices.ios.iPhone13ProMax,
        ),
        ThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(
                brightness: Brightness.light,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                  brightness: Brightness.light,
                ),
                useMaterial3: true,
                textTheme: const TextTheme(bodyMedium: TextStyle()),
                extensions: <ThemeExtension<dynamic>>[
                  DevFestThemeData.light(),
                ],
              ),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData(
                brightness: Brightness.dark,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                  brightness: Brightness.dark,
                ),
                useMaterial3: true,
                textTheme: const TextTheme(bodyMedium: TextStyle()),
                extensions: <ThemeExtension<dynamic>>[
                  DevFestThemeData.dark(),
                ],
              ),
            ),
          ],
          themeBuilder: (context, theme, child) {
            final isDark = theme.brightness == Brightness.dark ? true : false;
            return ScreenUtilInit(
              designSize: const Size(430, 956),
              minTextAdapt: true,
              useInheritedMediaQuery: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: theme.copyWith(
                    extensions: [
                      isDark
                          ? DevFestThemeData.dark()
                          : DevFestThemeData.light()
                    ],
                  ),
                  home: Material(child: child),
                );
              },
              child: child,
            );
          },
        )
      ],
    );
  }
}
