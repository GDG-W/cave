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
                SliverList.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) => AgendaScheduleTile(
                    onTap: () {},
                  ),
                  separatorBuilder: (context, _) =>
                      Constants.smallVerticalGutter.verticalSpace,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: Constants.verticalGutter).h,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                                vertical: Constants.smallVerticalGutter)
                            .r,
                        child: const Center(
                          child: IconText(
                            Icons.arrow_forward,
                            'View All Schedules',
                            alignment: IconTextAlignment.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Constants.verticalGutter.verticalSpace),
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
                SliverList.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) => AgendaTalkTile(
                    onTap: () {},
                  ),
                  separatorBuilder: (context, _) =>
                      Constants.smallVerticalGutter.verticalSpace,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: Constants.verticalGutter).h,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                                vertical: Constants.smallVerticalGutter)
                            .r,
                        child: const Center(
                          child: IconText(
                            Icons.arrow_forward,
                            'View All Talks',
                            alignment: IconTextAlignment.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Constants.verticalGutter.verticalSpace),
              ],
            ),
            SliverMainAxisGroup(
              slivers: [
                const PinnedHeaderSliver(
                  child: HomeAgendaHeader(
                    title: Text('🥺 Sponsors'),
                  ),
                ),
                SliverList.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) => ConferenceSponsorTile(
                    linkOnTap: () {},
                  ),
                  separatorBuilder: (context, _) =>
                      Constants.smallVerticalGutter.verticalSpace,
                ),
                SliverToBoxAdapter(
                    child: Constants.verticalGutter.verticalSpace),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
