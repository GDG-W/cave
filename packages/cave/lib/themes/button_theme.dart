import 'package:cave/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  DevfestButtonTheme.light()
      : this._(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48))),
          backgroundColor: DevfestColors.grey10,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: DevfestColors.grey100,
          ),
          iconColor: DevfestColors.grey100,
        );

  DevfestButtonTheme.dark()
      : this._(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48))),
          backgroundColor: DevfestColors.primariesYellow100,
          textStyle: TextStyle(
            fontSize: 16.sp,
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

@immutable
class DevfestOutlinedButtonTheme
    extends ThemeExtension<DevfestOutlinedButtonTheme> {
  final OutlinedBorder shape;
  final Color outlineColor;
  final TextStyle textStyle;
  final Color iconColor;

  const DevfestOutlinedButtonTheme._({
    required this.shape,
    required this.outlineColor,
    required this.textStyle,
    required this.iconColor,
  });

  DevfestOutlinedButtonTheme.light()
      : this._(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: DevfestColors.grey10),
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          outlineColor: DevfestColors.grey10,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: DevfestColors.grey10,
          ),
          iconColor: DevfestColors.grey10,
        );

  DevfestOutlinedButtonTheme.dark()
      : this._(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: DevfestColors.grey100),
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          outlineColor: DevfestColors.grey100,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: DevfestColors.grey100,
          ),
          iconColor: DevfestColors.grey100,
        );

  @override
  DevfestOutlinedButtonTheme copyWith({
    OutlinedBorder? shape,
    Color? outlineColor,
    TextStyle? textStyle,
    Color? iconColor,
  }) {
    return DevfestOutlinedButtonTheme._(
      shape: shape ?? this.shape,
      outlineColor: outlineColor ?? this.outlineColor,
      textStyle: textStyle ?? this.textStyle,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  DevfestOutlinedButtonTheme lerp(
      covariant ThemeExtension<DevfestOutlinedButtonTheme>? other, double t) {
    if (other is! DevfestOutlinedButtonTheme) return this;

    return DevfestOutlinedButtonTheme._(
      shape: OutlinedBorder.lerp(shape, other.shape, t)!,
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }
}
