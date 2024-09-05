import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            const SliverToBoxAdapter(
              child: HeaderText(
                title: Text('🌤️ Good morning, Aise'),
                subtitle: Text(
                    'You start on the street, work till you are eleniyan.'),
              ),
            ),
            SliverToBoxAdapter(
              child: Constants.largeVerticalGutter.verticalSpace,
            ),
            SliverMainAxisGroup(
              slivers: [
                PinnedHeaderSliver(
                  child: HomeAgendaHeader(
                    title: const Text('📆 Schedule'),
                    onEventDayChanged: (day) {},
                    onFilterSelected: () {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.green,
                    height: 500,
                  ),
                ),
              ],
            ),
            SliverMainAxisGroup(
              slivers: [
                PinnedHeaderSliver(
                  child: HomeAgendaHeader(
                    title: const Text('🎤 Speakers'),
                    onEventDayChanged: (day) {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.pink,
                    height: 800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
