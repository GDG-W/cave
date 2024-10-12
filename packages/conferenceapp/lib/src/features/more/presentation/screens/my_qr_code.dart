import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/dashboard/application/application.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyQrCodeScreen extends StatelessWidget {
  const MyQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GoBackButton(
          onTap: context.pop,
        ),
        leadingWidth: 120.w,
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.horizontalMargin)
                .w,
        child: Column(
          children: [
            HeaderText(
              title: const Text('🤳 Your QR Code'),
              titleStyle: TextStyle(
                fontSize: DevfestTheme.of(context)
                    .textTheme
                    ?.titleTitle1Semibold
                    ?.fontSize,
              ),
              subtitle: const Text(
                'Here is your QR Code you need to use to check in. Reach out to any volunteer to check you in',
              ),
              subtitleStyle: DevfestTheme.of(context)
                  .textTheme
                  ?.bodyBody2Medium
                  ?.medium
                  .applyColor(DevfestColors.grey50.possibleDarkVariant),
            ),
            const Spacer(),
            Consumer(
              builder: (context, ref, child) => QrImageView(
                  data: ref
                      .watch(userViewModelNotifier.select((vm) => vm.user.id)),
                  size: 296.w),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
