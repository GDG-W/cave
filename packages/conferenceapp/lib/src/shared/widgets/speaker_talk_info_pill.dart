import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

class SpeakersTalkInfoPill extends StatelessWidget {
  const SpeakersTalkInfoPill({
    super.key, required this.icon, required this.title
  });
  final IconData icon;
  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: DevfestColors.primariesYellow80),
      child: Wrap(
        spacing: 1,
        children: [
           Icon(icon),
          Text(
            title,
            style: DevfestTheme.of(context).textTheme?.bodyBody2Medium?.medium,
          ),
        ],
      ),
    );
  }
}
