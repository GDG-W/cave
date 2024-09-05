import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class ReserveHomeScreen extends StatelessWidget {
  const ReserveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const CheckInButton(),
          Constants.horizontalMargin.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
        child: CustomScrollView(
          slivers: [
            PinnedHeaderSliver(
              child: AgendaHeader(
                title: const Text('💺 Reserve'),
                subtitle: const Text(
                  'We have a seat saved just for you in these  sessions!',
                ),
                onFilterSelected: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
