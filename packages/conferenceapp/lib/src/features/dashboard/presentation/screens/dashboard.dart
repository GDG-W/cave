import 'package:cave/cave.dart';
import 'package:devfest24/src/features/home/presentation/presentation.dart';
import 'package:devfest24/src/features/more/presentation/presentation.dart';
import 'package:devfest24/src/features/reserve/presentation/presentation.dart';
import 'package:devfest24/src/features/schedule/presentation/presentation.dart';
import 'package:devfest24/src/features/speakers/presentation/presentation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(length: 5, child: _View());
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late int index;
  static const _tabs = [
    KeepAliveWidget(child: HomeScreen()),
    KeepAliveWidget(child: ScheduleHomeScreen()),
    KeepAliveWidget(child: SpeakersHomeScreen()),
    KeepAliveWidget(child: ReserveHomeScreen()),
    KeepAliveWidget(child: MoreHomeScreen()),
  ];

  void _onPageChanged(int page) {
    DefaultTabController.of(context).index = page;
  }

  void _onPageChangedListener() {
    setState(() {
      index = DefaultTabController.of(context).index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    index = DefaultTabController.of(context).index;
    DefaultTabController.of(context).addListener(_onPageChangedListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TabBarView(children: _tabs),
      bottomNavigationBar: DevfestBottomNav(
        index: DefaultTabController.of(context).index,
        onTap: _onPageChanged,
        items: const [
          DevfestBottomNavItem(
            label: 'Home',
            icon: Icon(IconsaxOutline.home_2),
          ),
          DevfestBottomNavItem(
            label: 'Schedule',
            icon: Icon(IconsaxOutline.calendar_1),
          ),
          DevfestBottomNavItem(
            label: 'Speakers',
            icon: Icon(IconsaxOutline.microphone),
          ),
          DevfestBottomNavItem(
            label: 'Reserve',
            icon: Icon(IconsaxOutline.ticket),
          ),
          DevfestBottomNavItem(
            label: 'More',
            icon: Icon(IconsaxOutline.more_square),
          ),
        ],
      ),
    );
  }
}
