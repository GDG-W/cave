import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:volunteerapp/src/routing/routing.dart';
import 'package:volunteerapp/src/shared/shared.dart';

class OnboardingHomeScreen extends StatelessWidget {
  const OnboardingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
              padding: EdgeInsets.only(left: Constants.horizontalMargin.w),
              child: SvgPicture.asset(
                'assets/icons/Logo.svg',
                semanticsLabel: 'Devfest Logo',
                width: 29.73.w,
                height: 16.41.h,
              ))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Constants.largeVerticalGutter.verticalSpace,
                  const HeaderText(
                    title: Text('Get attendees checked in faster than before'),
                    subtitle: Text(
                      'Hey rockstar volunteer, we have made attendees check in more convenient for you.',
                    ),
                  ),
                  SizedBox(height: (Constants.largeVerticalGutter * 3).h),
                  DevfestFilledButton(
                    onPressed: () {
                      context.goNamed(Devfest2024Routes.onboardingLogin.name);
                    },
                    title: const Text('Login'),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/images/onboarding_img1.png',
              semanticLabel: 'Onboarding Image',
            )
          ],
        ),
      ),
    );
  }
}
