import 'package:flutter/material.dart';

import 'bottom_nav_theme.dart';
import 'button_theme.dart';
import 'colors.dart';
import 'text_field_theme.dart';
import 'typography.dart';

class DevFestThemeData extends ThemeExtension<DevFestThemeData> {
  /// Create and register new themes here
  final DevfestTextTheme? textTheme;
  final DevfestButtonTheme? buttonTheme;
  final DevfestOutlinedButtonTheme? outlinedButtonTheme;
  final DevfestBottomNavTheme? bottomNavTheme;
  final DevfestTextFieldTheme? textFieldTheme;
  final Color? backgroundColor;

  DevFestThemeData({
    this.textTheme,
    this.backgroundColor,
    this.bottomNavTheme,
    this.buttonTheme,
    this.outlinedButtonTheme,
    this.textFieldTheme,
  });

  DevFestThemeData.light()
      : this(
          textTheme: DevfestTextTheme.light(),
          backgroundColor: DevfestColors.primariesYellow100,
          buttonTheme: DevfestButtonTheme.light(),
          outlinedButtonTheme: DevfestOutlinedButtonTheme.light(),
          bottomNavTheme: DevfestBottomNavTheme.light(),
          textFieldTheme: DevfestTextFieldTheme.light(),
        );

  DevFestThemeData.dark()
      : this(
          textTheme: DevfestTextTheme.dark(),
          backgroundColor: DevfestColors.backgroundDark,
          textFieldTheme: DevfestTextFieldTheme.dark(),
          buttonTheme: DevfestButtonTheme.dark(),
          outlinedButtonTheme: DevfestOutlinedButtonTheme.dark(),
          bottomNavTheme: DevfestBottomNavTheme.dark(),
        );

  @override
  DevFestThemeData copyWith({
    DevfestTextTheme? textTheme,
    DevfestButtonTheme? buttonTheme,
    DevfestOutlinedButtonTheme? outlinedButtonTheme,
    DevfestBottomNavTheme? bottomNavTheme,
    DevfestTextFieldTheme? textFieldTheme,
  }) {
    return DevFestThemeData(
      textTheme: textTheme ?? this.textTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      outlinedButtonTheme: outlinedButtonTheme ?? this.outlinedButtonTheme,
      bottomNavTheme: bottomNavTheme ?? this.bottomNavTheme,
      textFieldTheme: textFieldTheme ?? this.textFieldTheme,
    );
  }

  @override
  DevFestThemeData lerp(DevFestThemeData? other, double t) {
    if (other is! DevFestThemeData) return this;
    return DevFestThemeData(
      textTheme: textTheme?.lerp(other.textTheme, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      buttonTheme: buttonTheme?.lerp(other.buttonTheme, t),
      outlinedButtonTheme:
          outlinedButtonTheme?.lerp(other.outlinedButtonTheme, t),
      bottomNavTheme: bottomNavTheme?.lerp(other.bottomNavTheme, t),
      textFieldTheme: textFieldTheme?.lerp(other.textFieldTheme, t),
    );
  }
}
