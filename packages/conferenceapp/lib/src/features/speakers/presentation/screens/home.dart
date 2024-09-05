import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class SpeakersHomeScreen extends StatelessWidget {
  const SpeakersHomeScreen({super.key});

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
                title: const Text('🎤 Speakers'),
                subtitle: const Text(
                  'Industry veterans ready to share knowledge with you on their experiences',
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
