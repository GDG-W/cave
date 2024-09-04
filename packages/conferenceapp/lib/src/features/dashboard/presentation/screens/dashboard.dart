import 'package:devfest24/src/features/home/presentation/presentation.dart';
import 'package:devfest24/src/features/more/presentation/presentation.dart';
import 'package:devfest24/src/features/reserve/presentation/presentation.dart';
import 'package:devfest24/src/features/schedule/presentation/presentation.dart';
import 'package:devfest24/src/features/speakers/presentation/presentation.dart';
import 'package:flutter/material.dart';

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
  static const _tabs = [
    HomeScreen(),
    ScheduleHomeScreen(),
    SpeakersHomeScreen(),
    ReserveHomeScreen(),
    MoreHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabBarView(children: _tabs),
    );
  }
}
