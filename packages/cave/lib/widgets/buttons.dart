import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../themes/themes.dart';

class DevfestFilledButton extends StatelessWidget {
  const DevfestFilledButton({
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
    final buttonTheme = DevFestTheme.of(context).buttonTheme ??
        const DevfestButtonTheme.light();
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        customBorder: buttonTheme.shape,
        child: AnimatedDefaultTextStyle(
          duration: Constants.kAnimationDur,
          style: buttonTheme.textStyle,
          child: IconTheme(
            data: IconThemeData(color: buttonTheme.iconColor),
            child: AnimatedContainer(
              duration: Constants.kAnimationDur,
              height: 72.h,
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: buttonTheme.shape,
                color: buttonTheme.backgroundColor,
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
    final outlinedButtonTheme = DevFestTheme.of(context).outlinedButtonTheme ??
        const DevfestOutlinedButtonTheme.light();
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
