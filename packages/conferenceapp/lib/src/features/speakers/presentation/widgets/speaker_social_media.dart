import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

class SpeakerSocialMedia extends StatelessWidget {
  const SpeakerSocialMedia(
      {super.key, required this.icon, required this.onTap});
  final Widget icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          height: 48.h,
          width: 48.w,
          color: DevfestColors.primariesYellow80,
         
          //child: Center(child: Icon(icon,size:24 ,)),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
