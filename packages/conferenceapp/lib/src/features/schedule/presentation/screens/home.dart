import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';

class ScheduleHomeScreen extends StatelessWidget {
  const ScheduleHomeScreen({super.key});

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
                title: const Text('📆 Schedule'),
                subtitle: const Text(
                  'Our schedule is packed with incredible content all for you!!',
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
