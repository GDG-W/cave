import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';

class OnboardingLoginScreen extends StatelessWidget {
  const OnboardingLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
        child: Column(
          children: [
            const HeaderText(
              title: Text('Welcome to DevFest Lagos 2024 🥳'),
              subtitle: Text('Enter your details to continue!'),
            ),
            SizedBox(height: Constants.largeVerticalGutter.h),
          ],
        ),
      ),
    );
  }
}
