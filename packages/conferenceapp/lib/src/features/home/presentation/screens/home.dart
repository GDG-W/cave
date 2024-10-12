import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/dashboard/application/application.dart';
import 'package:devfest24/src/features/dashboard/model/model.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/widgets.dart';
import 'package:collection/collection.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  EventDay _day = EventDay.one;

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
          CheckInButton(
            isLoggedIn: ref.watch(
                userViewModelNotifier.select((vm) => vm.user.id.isNotEmpty)),
          ),
          Constants.horizontalMargin.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              ref
                  .read(userViewModelNotifier.notifier)
                  .fetchUserProfile(refresh: true),
              ref
                  .read(sponsorsViewModelNotifier.notifier)
                  .fetchSponsors(refresh: true),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: HeaderText(
                  title: Text(
                      '🌤️ Good morning, ${ref.watch(userViewModelNotifier.select((value) => value.user.fullName.split(' ').first))}'),
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
                      eventDay: _day,
                      onEventDayChanged: (day) {
                        setState(() {
                          _day = day;
                        });
                      },
                    ),
                  ),
                  [
                    ProviderScope(
                      overrides: [
                        _agendaSessionsProvider.overrideWithValue(ref
                            .watch(dayOneSessionsProvider)
                            .where((session) => session.categories.isEmpty)
                            .toList()
                            .safeSublist(2)),
                      ],
                      child: _AgendaSessions(),
                    ),
                    ProviderScope(
                      overrides: [
                        _agendaSessionsProvider.overrideWithValue(ref
                            .watch(dayTwoSessionsProvider)
                            .where((session) => session.categories.isEmpty)
                            .toList()
                            .safeSublist(2)),
                      ],
                      child: _AgendaSessions(),
                    ),
                  ].elementAt(_day.index),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: Constants.verticalGutter)
                              .h,
                      child: InkWell(
                        onTap: () {
                          DefaultTabController.of(context).index = 1;
                        },
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
                      eventDay: _day,
                      onEventDayChanged: (day) {
                        setState(() {
                          _day = day;
                        });
                      },
                    ),
                  ),
                  [
                    ProviderScope(
                      overrides: [
                        _speakersProvider.overrideWithValue(
                            ref.watch(dayOneSpeakersProvider).safeSublist(2))
                      ],
                      child: _Speakers(),
                    ),
                    ProviderScope(
                      overrides: [
                        _speakersProvider.overrideWithValue(
                            ref.watch(dayTwoSpeakersProvider).safeSublist(2))
                      ],
                      child: _Speakers(),
                    ),
                  ].elementAt(_day.index),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: Constants.verticalGutter)
                              .h,
                      child: InkWell(
                        onTap: () {
                          DefaultTabController.of(context).index = 2;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                                  vertical: Constants.smallVerticalGutter)
                              .r,
                          child: const Center(
                            child: IconText(
                              Icons.arrow_forward,
                              'View All Speakers',
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
                    itemCount: ref.watch(sponsorsProvider).length,
                    itemBuilder: (context, index) => ConferenceSponsorTile(
                      sponsor: ref.watch(sponsorsProvider)[index],
                      linkOnTap: () {
                        launchWebUrl(ref.read(sponsorsProvider)[index].website);
                      },
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
      ),
    );
  }
}

final _agendaSessionsProvider = Provider.autoDispose<List<SessionDto>>((ref) {
  throw UnimplementedError();
});

class _AgendaSessions extends ConsumerWidget {
  const _AgendaSessions();

  @override
  Widget build(BuildContext context, ref) {
    final sessions = ref.watch(_agendaSessionsProvider);
    return SliverList.separated(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        final agenda = ref
            .watch(agendasViewModelNotifier)
            .agendas
            .firstWhere((agenda) => session.periodId == agenda.id);
        return AgendaScheduleTile(
          session: session,
          start: agenda.start!,
          onTap: () {},
        );
      },
      separatorBuilder: (context, _) =>
          Constants.smallVerticalGutter.verticalSpace,
    );
  }
}

final _speakersProvider = Provider.autoDispose<List<SpeakerDto>>((ref) {
  throw UnimplementedError();
});

class _Speakers extends ConsumerWidget {
  const _Speakers();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speakers = ref.watch(_speakersProvider);
    return SliverList.separated(
      itemCount: speakers.length,
      itemBuilder: (context, index) {
        final speaker = speakers[index];
        final isDayOne = speaker.sessions.first.startTime?.day == 15;
        final session = isDayOne
            ? ref.watch(dayOneSessionsProvider).firstWhereOrNull(
                (session) => session.id == speaker.sessions.first.id)
            : ref.watch(dayTwoSessionsProvider).firstWhereOrNull(
                (session) => session.id == speaker.sessions.first.id);

        if (session == null) return const SizedBox.shrink();
        return AgendaTalkTile(
          speaker: speaker,
          session: session,
          onTap: () {},
        );
      },
      separatorBuilder: (context, _) =>
          Constants.smallVerticalGutter.verticalSpace,
    );
  }
}
