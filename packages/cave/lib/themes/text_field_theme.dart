import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'effects.dart';

@immutable
class DevfestTextFieldTheme extends ThemeExtension<DevfestTextFieldTheme> {
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final InputBorder errorBorder;
  final TextStyle errorStyle;
  final TextStyle hintStyle;
  final TextStyle style;

  const DevfestTextFieldTheme._({
    required this.border,
    required this.enabledBorder,
    required this.errorBorder,
    required this.focusedBorder,
    required this.errorStyle,
    required this.hintStyle,
    required this.style,
  });

  DevfestTextFieldTheme.light()
      : this._(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: DevfestColors.grey80, width: 1.4),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: DevfestColors.grey80, width: 1.4),
          ),
          focusedBorder: DecoratedInputBorder(
            shadow: const [
              AppEffectStyles.activeInputShadowEffect0,
            ],
            child: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide:
                  BorderSide(color: DevfestColors.primariesBlue80, width: 2),
            ),
          ),
          errorBorder: DecoratedInputBorder(
            shadow: const [
              AppEffectStyles.errorStateShadowEffect0,
            ],
            child: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide:
                  BorderSide(color: DevfestColors.primariesRed80, width: 2),
            ),
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: DevfestColors.grey60,
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: DevfestColors.grey10,
          ),
          errorStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: DevfestColors.error60,
          ),
        );

  DevfestTextFieldTheme.dark()
      : this._(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: DevfestColors.grey80, width: 1.4),
          ),
          enabledBorder: DecoratedInputBorder(
            shadow: const [
              AppEffectStyles.filledInputShadowEffect0,
            ],
            child: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: DevfestColors.grey70, width: 2),
            ),
          ),
          focusedBorder: DecoratedInputBorder(
            shadow: const [
              AppEffectStyles.activeInputShadowEffect0,
            ],
            child: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide:
                  BorderSide(color: DevfestColors.primariesBlue80, width: 2),
            ),
          ),
          errorBorder: DecoratedInputBorder(
            shadow: const [
              AppEffectStyles.errorStateShadowEffect0,
            ],
            child: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide:
                  BorderSide(color: DevfestColors.primariesRed80, width: 2),
            ),
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: DevfestColors.grey60,
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: DevfestColors.grey10,
          ),
          errorStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: DevfestColors.error60,
          ),
        );

  @override
  ThemeExtension<DevfestTextFieldTheme> copyWith({
    InputBorder? border,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
    InputBorder? errorBorder,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? style,
  }) {
    return DevfestTextFieldTheme._(
      border: border ?? this.border,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      hintStyle: hintStyle ?? this.hintStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      style: style ?? this.style,
    );
  }

  @override
  ThemeExtension<DevfestTextFieldTheme> lerp(
      covariant ThemeExtension<DevfestTextFieldTheme>? other, double t) {
    return this;
  }
}
