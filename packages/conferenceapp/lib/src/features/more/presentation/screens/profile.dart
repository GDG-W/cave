import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/shared.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const GoBackButton(color: DevfestColors.grey100),
        leadingWidth: 120.w,
      ),
      body: Column(
        children: [
          SignedInUserHeaderTile(
            height: 300.h,
            margin: EdgeInsets.zero,
            borderRadius: BorderRadius.zero,
            gap: (Constants.verticalGutter * 2).verticalSpace,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                      horizontal: Constants.horizontalMargin)
                  .w
                  .add(
                    EdgeInsets.only(
                      top: Constants.verticalGutter.h,
                      bottom: MediaQuery.viewPaddingOf(context).bottom,
                    ),
                  ),
              child: Column(
                children: [
                  const _ProfileInfoTile(
                    title: '📧 Email Address',
                    info: 'samuelabada2@gmail.com',
                  ),
                  Constants.verticalGutter.verticalSpace,
                  const _ProfileInfoTile(
                    title: '🤹‍♀️ Area of Expertise',
                    info: 'Mobile Development',
                  ),
                  Constants.verticalGutter.verticalSpace,
                  const _ProfileInfoTile(
                    title: '😊 Level of Experience',
                    info: 'Senior',
                  ),
                  Constants.verticalGutter.verticalSpace,
                  const _ProfileInfoTile(
                    title: '😁 Number of Years of Experience',
                    info: '6+ Years',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  const _ProfileInfoTile({required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DevfestColors.primariesYellow90.possibleDarkVariant,
      borderRadius:
          const BorderRadius.all(Radius.circular(Constants.horizontalGutter)),
      child: Padding(
        padding: const EdgeInsets.all(Constants.verticalGutter).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style:
                  DevfestTheme.of(context).textTheme?.bodyBody2Semibold?.semi,
            ),
            Constants.smallVerticalGutter.verticalSpace,
            Text(
              info,
              style: DevfestTheme.of(context)
                  .textTheme
                  ?.bodyBody2Medium
                  ?.medium
                  .applyColor(DevfestColors.grey50.possibleDarkVariant),
            ),
          ],
        ),
      ),
    );
  }
}
