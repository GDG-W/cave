import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key, this.onTap, this.color});

  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? Navigator.of(context).pop,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BackButton(onPressed: null, color: color),
          Text(
            'Go Back',
            style: DevfestTheme.of(context)
                .textTheme
                ?.bodyBody2Medium
                ?.medium
                .applyColor(color),
          )
        ],
      ),
    );
  }
}
