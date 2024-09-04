import 'theme_data.dart';
import 'package:flutter/material.dart';

class DevfestTheme extends StatelessWidget {
  final DevFestThemeData data;
  final Widget child;

  const DevfestTheme({
    super.key,
    required this.data,
    required this.child,
  });

  static DevFestThemeData of(BuildContext context) =>
      Theme.of(context).extension<DevFestThemeData>()!;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeExtensions = Map<Object, ThemeExtension>.from(theme.extensions);

    themeExtensions[DevFestThemeData] = data;
    return Theme(
      data: theme.copyWith(extensions: themeExtensions.values),
      child: child,
    );
  }
}
