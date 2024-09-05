import 'package:cave/cave.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';

class DevfestTabButton extends StatelessWidget {
  const DevfestTabButton({
    super.key,
    this.title,
    this.onTap,
    this.selected = false,
  });

  final Widget? title;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    DevfestButtonTheme? buttonTheme = DevfestTheme.of(context).buttonTheme;

    if (!selected) {
      buttonTheme = buttonTheme?.copyWith(
        backgroundColor: DevfestColors.primariesYellow100.possibleDarkVariant,
      );
    }
    return DevfestTheme(
      data: DevfestTheme.of(context).copyWith(buttonTheme: buttonTheme),
      child: DevfestFilledButton.medium(
        title: title,
        titleStyle: !selected
            ? TextStyle(color: DevfestColors.grey60.possibleDarkVariant)
            : null,
        onPressed: onTap,
      ),
    );
  }
}
