import 'colors.dart';
import 'package:flutter/material.dart';

@immutable
class DevfestBottomNavTheme extends ThemeExtension<DevfestBottomNavTheme> {
  final TextStyle labelStyle;
  final Color selectedColor;
  final Color unselectedColor;
  final Color decoration;
  final Color borderColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color backgroundColor;

  const DevfestBottomNavTheme._({
    required this.labelStyle,
    required this.selectedColor,
    required this.unselectedColor,
    required this.decoration,
    required this.borderColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    required this.backgroundColor,
  });

  const DevfestBottomNavTheme.light()
      : this._(
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.27,
            fontFamily: 'Google Sans',
          ),
          selectedColor: DevfestColors.grey10,
          unselectedColor: DevfestColors.grey60,
          decoration: DevfestColors.primariesYellow90,
          borderColor: DevfestColors.grey70,
          selectedIconColor: DevfestColors.grey10,
          unselectedIconColor: DevfestColors.grey60,
          backgroundColor: DevfestColors.primariesYellow100,
        );

  const DevfestBottomNavTheme.dark()
      : this._(
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Google Sans',
            height: 1.27,
          ),
          selectedColor: DevfestColors.backgroundLight,
          unselectedColor: DevfestColors.grey60,
          decoration: DevfestColors.backgroundLight,
          borderColor: DevfestColors.grey50,
          selectedIconColor: DevfestColors.grey10,
          unselectedIconColor: DevfestColors.grey60,
          backgroundColor: DevfestColors.backgroundDark,
        );

  @override
  DevfestBottomNavTheme copyWith({
    TextStyle? labelStyle,
    Color? selectedColor,
    Color? unselectedColor,
    Color? decoration,
    Color? borderColor,
    Color? selectedIconColor,
    Color? unselectedIconColor,
    Color? backgroundColor,
  }) {
    return DevfestBottomNavTheme._(
      labelStyle: labelStyle ?? this.labelStyle,
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      decoration: decoration ?? this.decoration,
      borderColor: borderColor ?? this.borderColor,
      selectedIconColor: selectedIconColor ?? this.selectedIconColor,
      unselectedIconColor: unselectedIconColor ?? this.unselectedIconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  DevfestBottomNavTheme lerp(
      covariant ThemeExtension<DevfestBottomNavTheme>? other, double t) {
    if (other is! DevfestBottomNavTheme) return this;

    return DevfestBottomNavTheme._(
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
      decoration: Color.lerp(decoration, other.decoration, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      selectedIconColor:
          Color.lerp(selectedIconColor, other.selectedIconColor, t)!,
      unselectedIconColor:
          Color.lerp(unselectedIconColor, other.unselectedIconColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}
