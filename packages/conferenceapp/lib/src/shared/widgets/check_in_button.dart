import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

class CheckInButton extends StatelessWidget {
  const CheckInButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 113.w,
      child: DevfestFilledButton.small(
        onPressed: onTap,
        prefixIcon: const Icon(IconsaxOutline.shield, size: 20),
        title: const Text(
          'Check-In',
        ),
        titleStyle: const TextStyle().semi,
      ),
    );
  }
}
