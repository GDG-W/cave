import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:volunteerapp/src/routing/routing.dart';
import 'package:volunteerapp/src/shared/shared.dart';

class OnboardingLoginScreen extends StatelessWidget {
  const OnboardingLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: SvgPicture.asset(
          'images/logo.svg',
          package: 'cave',
          width: 16,
          height: 29,
          semanticsLabel: 'Acme Logo',
        ),
      ),
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
                          title: Text('Login 🤙🏾'),
                          subtitle: Text('Enter your details to continue!'),
                        ),
                        (Constants.largeVerticalGutter +
                                Constants.verticalGutter)
                            .verticalSpace,
                        DevfestTextFormField(
                          title: 'Email Address',
                          hint: 'e.g senatorofthebu@gmail.com',
                          onChanged: (value) {},
                        ),
                        Constants.verticalGutter.verticalSpace,
                        DevfestTextFormField(
                          title: 'Password',
                          hint: 'Enter Password',
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
