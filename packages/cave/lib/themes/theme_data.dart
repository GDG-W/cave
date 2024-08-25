import 'package:flutter/material.dart';

import 'bottom_nav_theme.dart';
import 'button_theme.dart';
import 'colors.dart';
import 'text_field_theme.dart';
import 'typography.dart';

class DevFestTheme extends ThemeExtension<DevFestTheme> {
  /// Create and register new themes here
  final DevfestTextTheme? textTheme;
  final DevfestButtonTheme? buttonTheme;
  final DevfestBottomNavTheme? bottomNavTheme;
  final DevfestTextFieldTheme? textFieldTheme;
  final Color? backgroundColor;

  static DevFestTheme of(BuildContext context) =>
      Theme.of(context).extension<DevFestTheme>()!;

  const DevFestTheme({
    this.textTheme,
    this.backgroundColor,
    this.bottomNavTheme,
    this.buttonTheme,
    this.textFieldTheme,
  });

  DevFestTheme.light()
      : this(
          textTheme: const DevfestTextTheme.responsive(),
          backgroundColor: DevfestColors.backgroundLight,
          buttonTheme: const DevfestButtonTheme.light(),
          bottomNavTheme: const DevfestBottomNavTheme.light(),
          textFieldTheme: const DevfestTextFieldTheme.light(),
        );

  DevFestTheme.dark()
      : this(
          textTheme: const DevfestTextTheme.responsive(),
          backgroundColor: DevfestColors.backgroundDark,
          textFieldTheme: const DevfestTextFieldTheme.dark(),
          buttonTheme: const DevfestButtonTheme.dark(),
          bottomNavTheme: const DevfestBottomNavTheme.dark(),
        );

  @override
  DevFestTheme copyWith({
    DevfestTextTheme? textTheme,
    DevfestButtonTheme? buttonTheme,
    DevfestBottomNavTheme? bottomNavTheme,
  }) {
    return DevFestTheme(
      textTheme: textTheme ?? this.textTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      bottomNavTheme: bottomNavTheme ?? this.bottomNavTheme,
    );
  }

  @override
  DevFestTheme lerp(DevFestTheme? other, double t) {
    if (other is! DevFestTheme) return this;
    return DevFestTheme(
      textTheme: textTheme?.lerp(other.textTheme, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      buttonTheme: buttonTheme?.lerp(other.buttonTheme, t),
      bottomNavTheme: bottomNavTheme?.lerp(other.bottomNavTheme, t),
    );
  }
}
