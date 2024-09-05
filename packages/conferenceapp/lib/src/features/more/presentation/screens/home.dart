import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import '../widgets/devfest_version.dart';
import 'package:devfest24/src/routing/router.dart';
import 'package:devfest24/src/routing/routing.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreHomeScreen extends StatelessWidget {
  const MoreHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.horizontalMargin.w),
              child: Column(
                children: [
                  Container(
                    height: 188.h,
                    margin: const EdgeInsets.only(
                        top: Constants.smallVerticalGutter,
                        bottom: Constants.largeVerticalGutter),
                    decoration: const BoxDecoration(
                      gradient: DevfestColors.gradientGradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Constants.largeVerticalGutter),
                      ),
                    ),
                  ),
                  MoreSection(
                    title: const Text('GENERAL'),
                    options: [
                      MoreButton(
                        title: const Text('Profile'),
                        onTap: () {
                          context.goNamed(Devfest2024Routes.profile.name);
                        },
                      ),
                      MoreButton(
                        title: const Text('My QR Code'),
                        onTap: () {
                          context.goNamed(Devfest2024Routes.myQrCode.name);
                        },
                      ),
                      MoreButton(
                        title: const Text('Theme Settings'),
                        onTap: () {},
                      ),
                      MoreButton(
                        title: const Text('Venue Map'),
                        onTap: () {
                          context.goNamed(Devfest2024Routes.venueMap.name);
                        },
                      ),
                    ],
                  ),
                  MoreSection(
                    title: const Text('OTHERS'),
                    options: [
                      MoreButton(
                        title: const Text('About GDG Lagos'),
                        onTap: () {},
                      ),
                      MoreButton(
                        title: const Text('Contact Us'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: Constants.largeVerticalGutter),
            child: DevfestAppVersion(),
          ),
        ],
      ),
    );
  }
}

class MoreSection extends StatelessWidget {
  const MoreSection({super.key, required this.title, this.options = const []});

  final Widget title;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedDefaultTextStyle(
          style: DevfestTheme.of(context)
              .textTheme!
              .bodyBody4Medium!
              .medium
              .applyColor(DevfestColors.grey60.possibleDarkVariant),
          duration: Constants.kAnimationDur,
          child: title,
        ),
        Constants.smallVerticalGutter.verticalSpace,
        ...options,
      ],
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({super.key, this.icon, this.title, this.onTap});

  final Widget? icon;
  final Widget? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Constants.verticalGutter.h),
        child: Row(
          children: [
            if (icon != null) ...[
              icon!,
              Constants.smallVerticalGutter.horizontalSpace,
            ],
            if (title != null) ...[
              Expanded(child: title!),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 22,
                color: DevfestColors.grey60.possibleDarkVariant,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
