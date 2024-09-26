import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/schedule/presentation/presentation.dart';
import 'package:devfest24/src/routing/routing.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScheduleHomeScreen extends StatelessWidget {
  const ScheduleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100.w,
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Constants.horizontalMargin.w),
              child: GdgLogo.normal(),
            ),
          ],
        ),
        actions: [
          const CheckInButton(isLoggedIn: true),
          Constants.horizontalMargin.horizontalSpace,
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.horizontalMargin)
                .w,
        child: CustomScrollView(
          slivers: [
            SliverAgendaHeader(
              title: const Text('📆 Schedule'),
              subtitle: const Text(
                'Our schedule is packed with incredible content all for you!!',
              ),
              onFilterSelected: () {},
              onEventDayChanged: (_) {},
            ),
            SliverList.separated(
              itemBuilder: (context, index) => ConferenceScheduleTile(
                type: index % 2 == 0
                    ? ScheduleTileType.breakout
                    : ScheduleTileType.session,
                onTap: () {
                  context.goNamed(Devfest2024Routes.scheduleDetails.name);
                },
              ),
              separatorBuilder: (context, index) =>
                  Constants.verticalGutter.verticalSpace,
              itemCount: 10,
            ),
            SliverToBoxAdapter(child: Constants.verticalGutter.verticalSpace),
          ],
        ),
      ),
    );
  }
}
