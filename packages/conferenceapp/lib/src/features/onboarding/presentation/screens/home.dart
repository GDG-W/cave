import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/routing/routing.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingHomeScreen extends StatelessWidget {
  const OnboardingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
        child: Column(
          children: [
            const HeaderText(
              title: Text('DevFest Lagos like you have never seen it before'),
              subtitle: Text(
                'We said we will see you again next year, here we are, we have missed you and prepared amazing things for you 🥺',
              ),
            ),
            SizedBox(height: (Constants.largeVerticalGutter * 3).h),
            DevfestFilledButton(
              onPressed: () {
                context.goNamed(Devfest2024Routes.onboardingLogin.name);
              },
              title: const Text('Let\'s Get This Bread Quickly'),
            )
          ],
        ),
      ),
    );
  }
}
