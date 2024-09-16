import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../themes/themes.dart';

class DevfestFilledButton extends StatelessWidget {
  const DevfestFilledButton({
    super.key,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.backgroundGradient,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    double height = 72.0,
  }) : _height = height;

  const DevfestFilledButton.small({
    super.key,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.backgroundGradient,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
  }) : _height = 36;

  const DevfestFilledButton.medium({
    super.key,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.backgroundGradient,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
  }) : _height = 40;

  final Widget? title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onPressed;
  final double _height;

  static final _space = 8.horizontalSpace;

  @override
  Widget build(BuildContext context) {
    DevfestButtonTheme buttonTheme =
        DevfestTheme.of(context).buttonTheme ?? DevfestButtonTheme.light();

    buttonTheme = buttonTheme.copyWith(
      textStyle: switch (_height) {
        < 40 => DevfestTheme.of(context).textTheme?.bodyBody3Semibold, // small
        < 72 => DevfestTheme.of(context).textTheme?.bodyBody1Medium, // medium
        _ => null,
      }
          ?.copyWith(color: buttonTheme.textStyle.color),
    );
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        customBorder: buttonTheme.shape,
        child: AnimatedDefaultTextStyle(
          duration: Constants.kAnimationDur,
          style: buttonTheme.textStyle.merge(titleStyle),
          child: IconTheme(
            data: IconThemeData(
              color: buttonTheme.iconColor,
              size: switch (_height) {
                < 40 => 20,
                _ => 24,
              },
            ),
            child: AnimatedContainer(
              duration: Constants.kAnimationDur,
              height: _height.h,
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: buttonTheme.shape,
                color: backgroundGradient != null
                    ? null
                    : backgroundColor ?? buttonTheme.backgroundColor,
                gradient: backgroundGradient,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: switch ((prefixIcon, title, suffixIcon)) {
                  (final prefix?, null, null) => [prefix],
                  (null, final title?, null) => [title],
                  (null, null, final suffix?) => [suffix],
                  (final prefix?, final title?, null) => [
                      prefix,
                      _space,
                      title
                    ],
                  (final prefix?, null, final suffix?) => [
                      prefix,
                      _space,
                      suffix
                    ],
                  (null, final title?, final suffix?) => [
                      title,
                      _space,
                      suffix
                    ],
                  (final prefix?, final title?, final suffix?) => [
                      prefix,
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: _space.width!),
                        child: title,
                      ),
                      suffix
                    ],
                  _ => [],
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DevfestOutlinedButton extends StatelessWidget {
  const DevfestOutlinedButton({
    super.key,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
  });

  final Widget? title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onPressed;

  static final _space = 8.horizontalSpace;

  @override
  Widget build(BuildContext context) {
    final outlinedButtonTheme = DevfestTheme.of(context).outlinedButtonTheme ??
        DevfestOutlinedButtonTheme.light();
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        customBorder: outlinedButtonTheme.shape,
        child: AnimatedDefaultTextStyle(
          duration: Constants.kAnimationDur,
          style: outlinedButtonTheme.textStyle,
          child: IconTheme(
            data: IconThemeData(color: outlinedButtonTheme.iconColor),
            child: AnimatedContainer(
              duration: Constants.kAnimationDur,
              height: 72.h,
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: outlinedButtonTheme.shape.copyWith(
                    side: BorderSide(color: outlinedButtonTheme.outlineColor)),
                color: Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: switch ((prefixIcon, title, suffixIcon)) {
                  (final prefix?, null, null) => [prefix],
                  (null, final title?, null) => [title],
                  (null, null, final suffix?) => [suffix],
                  (final prefix?, final title?, null) => [
                      prefix,
                      _space,
                      title
                    ],
                  (final prefix?, null, final suffix?) => [
                      prefix,
                      _space,
                      suffix
                    ],
                  (null, final title?, final suffix?) => [
                      title,
                      _space,
                      suffix
                    ],
                  (final prefix?, final title?, final suffix?) => [
                      prefix,
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: _space.width!),
                        child: title,
                      ),
                      suffix
                    ],
                  _ => [],
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
