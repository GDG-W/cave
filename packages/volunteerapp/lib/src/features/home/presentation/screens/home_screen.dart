import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:volunteerapp/src/features/home/presentation/widgets/widgets.dart';
import 'package:volunteerapp/src/shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
            left: Constants.horizontalMargin.w,
          ),
          child: SvgPicture.asset(
            'assets/icons/Logo.svg',
            semanticsLabel: 'Devfest Logo',
          ),
        ),
        actions: [
          const LogoutButton(),
          Constants.horizontalMargin.horizontalSpace
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.horizontalMargin.w,
            vertical: Constants.horizontalMargin.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '☺️ Welcome Sarah',
              style: DevfestTheme.of(context)
                  .textTheme
                  ?.titleTitle1Semibold
                  ?.semi
                  .applyColor(DevfestColors.grey10.possibleDarkVariant),
            ),
            SizedBox(height: 11.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Check-in overview',
                  style: DevfestTheme.of(context)
                      .textTheme
                      ?.bodyBody1Medium
                      ?.medium
                      .applyColor(DevfestColors.grey10.possibleDarkVariant),
                ),
                DayMenuBar(),
              ],
            ),
            SizedBox(height: 25.h),
            SingleChildScrollView(
              
              scrollDirection: Axis.horizontal,
              controller: _controller,
              child: Row(
                children: [
                  AnalyticsCard(
                      title: "Total Tickets",
                      amount: 5000,
                      analysis: "7% up this week"),
                  Constants.horizontalGutter.horizontalSpace,
                  AnalyticsCard(
                      title: "Total Check-ins",
                      amount: 5000,
                      analysis: "7% up this week"),
                  Constants.horizontalGutter.horizontalSpace,
                  AnalyticsCard(
                      title: "Total unchecked",
                      amount: 5000,
                      analysis: "7% up this week"),
                ],
              ),
            ),
            // SizedBox(height: 20.h),
            // Center(
            //   child: SmoothPageIndicator(
            //     controller: _controller,
            //     count: 3,
            //     effect: SlideEffect(
            //         activeDotColor: DevfestColors.backgroundDark,
            //         dotColor: Color(0xFFCCCCCC),
            //         dotWidth: 27.w,
            //         dotHeight: 3.h),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
