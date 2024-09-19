import 'package:cave/cave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volunteerapp/src/features/home/presentation/screens/home_screen.dart';
import 'package:volunteerapp/src/shared/shared.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard(
      {super.key,
      required this.amount,
      required this.analysis,
      required this.title});
  final String title;
  final num amount;
  final String analysis;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170.w,
        padding: EdgeInsets.fromLTRB(16.0.w, 16.0.h, 0.0, 16.0),
        decoration: BoxDecoration(
          borderRadius: ContainerProperties.defaultBorderRadius,
          border: Border.all(color: Color(0xFFCCCCCC)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                  padding: EdgeInsets.all(7),
                  color: DevfestColors.primariesYellow90,
                  child: SvgPicture.asset('assets/icons/ticket.svg')),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: DevfestTheme.of(context)
                  .textTheme
                  ?.bodyBody4Regular
                  ?.medium
                  .applyColor(Color(0xFF828A8C)),
            ),
            Text(
              '${amount.formattedWithDecimalPattern}',
              style: DevfestTheme.of(context)
                  .textTheme
                  ?.titleTitle2Medium
                  ?.medium
                  .applyColor(Color(0xFF2A2E2F)),
            ),
            Wrap(
              children: [
                SvgPicture.asset('assets/icons/arrowUp.svg'),
                SizedBox(width: 4.w),
                Text(analysis,
                    style: DevfestTheme.of(context)
                        .textTheme
                        ?.bodyBody5Medium
                        ?.medium
                        .applyColor(Color(0xFF34A853)))
              ],
            )
          ],
        ));
  }
}
