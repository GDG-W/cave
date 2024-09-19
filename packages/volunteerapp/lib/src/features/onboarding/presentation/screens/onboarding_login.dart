import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:volunteerapp/src/routing/routing.dart';
import 'package:volunteerapp/src/shared/shared.dart';

class OnboardingLoginScreen extends StatelessWidget {
  const OnboardingLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(Constants.horizontalMargin.w, 0.0,
              Constants.horizontalMargin.w, 78.h),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const HeaderText(
                          title: Text('Login 🤙🏾'),
                          subtitle: Text('Enter your details to continue!'),
                        ),
                        Constants.largeVerticalGutter.verticalSpace,
                        DevfestTextFormField(
                          title: 'Email Address',
                          hint: 'e.g senatorofthebu@gmail.com',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            if (EmailValidator.validate(value)) {
                              return 'Enter a valid email address';
                            }
                          },
                          onChanged: (value) {},
                        ),
                        DevfestTextFormField(
                          title: 'Password',
                          hint: 'Enter Password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                          },
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DevfestFilledButton(
                title: const Text('Continue'),
                onPressed: () {
                  context.goNamed(Devfest2024Routes.home.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
