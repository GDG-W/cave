import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/speakers/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class SpeakersHomeScreen extends StatelessWidget {
  const SpeakersHomeScreen({super.key});

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
          const CheckInButton(),
          Constants.horizontalMargin.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
        child: CustomScrollView(
          slivers: [
            SliverAgendaHeader(
              title: const Text('🎤 Speakers'),
              subtitle: const Text(
                'Industry veterans ready to share knowledge with you on their experiences',
              ),
              onFilterSelected: () {},
              onEventDayChanged: (_) {},
            ),
            SliverList.separated(
              itemBuilder: (context, index) => SpeakerTile(
                onTap: () {},
              ),
              separatorBuilder: (context, index) =>
                  Constants.verticalGutter.verticalSpace,
              itemCount: 20,
            ),
            SliverToBoxAdapter(child: Constants.verticalGutter.verticalSpace),
          ],
        ),
      ),
    );
  }
}
