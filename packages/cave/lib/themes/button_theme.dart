import 'colors.dart';
import 'package:flutter/material.dart';

@immutable
class DevfestButtonTheme extends ThemeExtension<DevfestButtonTheme> {
  final ShapeBorder shape;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Color iconColor;

  const DevfestButtonTheme._({
    required this.shape,
    required this.backgroundColor,
    required this.textStyle,
    required this.iconColor,
  });

  const DevfestButtonTheme.light()
      : this._(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48))),
          backgroundColor: DevfestColors.grey10,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: DevfestColors.grey100,
          ),
          iconColor: DevfestColors.grey100,
        );

  const DevfestButtonTheme.dark()
      : this._(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48))),
          backgroundColor: DevfestColors.primariesYellow100,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: DevfestColors.grey10,
          ),
          iconColor: DevfestColors.grey10,
        );

  @override
  DevfestButtonTheme copyWith({
    ShapeBorder? shape,
    Color? backgroundColor,
    TextStyle? textStyle,
    Color? iconColor,
  }) {
    return DevfestButtonTheme._(
      shape: shape ?? this.shape,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  DevfestButtonTheme lerp(
      covariant ThemeExtension<DevfestButtonTheme>? other, double t) {
    if (other is! DevfestButtonTheme) return this;

    return DevfestButtonTheme._(
      shape: ShapeBorder.lerp(shape, other.shape, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }
}
