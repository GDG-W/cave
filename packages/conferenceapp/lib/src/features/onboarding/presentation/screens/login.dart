import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/routing/routing.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingLoginScreen extends StatelessWidget {
  const OnboardingLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const HeaderText(
                          title: Text('Welcome to DevFest Lagos 2024 🥳'),
                          subtitle: Text('Enter your details to continue!'),
                        ),
                        Constants.largeVerticalGutter.verticalSpace,
                        DevfestTextFormField(
                          title: 'Email Address',
                          hint: 'e.g senatorofthebu@gmail.com',
                          onChanged: (value) {},
                        ),
                        DevfestTextFormField(
                          title: 'Ticket ID',
                          hint: 'e.g 413-012-ABC',
                          onChanged: (value) {},
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Looking for your ticket ID? ',
                            style: DevfestTheme.of(context)
                                .textTheme
                                ?.bodyBody2Medium
                                ?.medium
                                .apply(
                                    color: DevfestColors
                                        .grey60.possibleDarkVariant),
                            children: [
                              TextSpan(
                                text: 'Click Here',
                                style: TextStyle(
                                        color: DevfestColors
                                            .grey10.possibleDarkVariant)
                                    .semi,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DevfestFilledButton(
                title: const Text('Next'),
                onPressed: () {
                  context.goNamed(Devfest2024Routes.dashboard.name);
                },
              ),
              DevfestFilledButton(
                title: const Text('Continue as Guest'),
                backgroundColor: Colors.transparent,
                titleStyle:
                    TextStyle(color: DevfestColors.grey10.possibleDarkVariant),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
