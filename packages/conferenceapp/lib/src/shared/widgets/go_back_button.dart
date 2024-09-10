import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? Navigator.of(context).pop,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BackButton(onPressed: null),
          Text(
            'Go Back',
            style: DevfestTheme.of(context).textTheme?.bodyBody2Medium?.medium,
          )
        ],
      ),
    );
  }
}
