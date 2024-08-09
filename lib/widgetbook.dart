import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' hide DeviceType;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'core/themes/theme_data.dart';
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  final designSize = const Size(430, 956);

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
              ),
            ),
          ],
          themeBuilder: (context, theme, child) {
            final isDark = theme.brightness == Brightness.dark;
            return ScreenUtilInit(
              designSize: designSize,
              minTextAdapt: true,
              useInheritedMediaQuery: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: theme.copyWith(extensions: [
                    isDark ? DevFestTheme.dark() : DevFestTheme.light()
                  ]),
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
