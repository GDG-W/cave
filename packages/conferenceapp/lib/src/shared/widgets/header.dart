import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  final Widget? title;
  final Widget? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null) ...[
          AnimatedDefaultTextStyle(
            style: DevfestTheme.of(context).textTheme!.headerH6!.semi,
            duration: Constants.kAnimationDur,
            child: title!,
          ),
          SizedBox(height: Constants.smallVerticalGutter.h),
        ],
        if (subtitle != null)
          AnimatedDefaultTextStyle(
            style: DevfestTheme.of(context)
                .textTheme!
                .bodyBody1Medium!
                .medium
                .copyWith(color: DevfestColors.grey40),
            duration: Constants.kAnimationDur,
            child: subtitle!,
          ),
      ],
    );
  }
}
