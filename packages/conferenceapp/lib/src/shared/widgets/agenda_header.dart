import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/extensions.dart';
import 'package:flutter/material.dart';

import 'header.dart';
import 'tab_button.dart';

enum EventDay {
  one,
  two;
}

class AgendaHeader extends StatelessWidget {
  const AgendaHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.eventDay = EventDay.one,
    this.onEventDayChanged,
    this.onFilterSelected,
    this.gutter,
  });

  final Widget title;
  final Widget? subtitle;
  final TextStyle? titleStyle;
  final EventDay eventDay;
  final ValueChanged<EventDay>? onEventDayChanged;
  final VoidCallback? onFilterSelected;
  final Widget? gutter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderText(
          title: title,
          titleStyle: titleStyle,
          titleAction: onFilterSelected == null
              ? null
              : SizedBox(
                  width: 87.w,
                  child: DevfestFilledButton.small(
                    backgroundColor:
                        DevfestColors.primariesYellow90.possibleDarkVariant,
                    prefixIcon: Icon(
                      Icons.filter_alt_outlined,
                      color: DevfestTheme.of(context)
                          .textTheme
                          ?.titleTitle2Semibold
                          ?.color,
                    ),
                    title: const Text('Filter'),
                    titleStyle: TextStyle(
                      color: DevfestTheme.of(context)
                          .textTheme
                          ?.titleTitle2Semibold
                          ?.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
          subtitle: subtitle,
          subtitleStyle: DevfestTheme.of(context)
              .textTheme
              ?.bodyBody2Medium
              ?.medium
              .applyColor(DevfestColors.grey50.possibleDarkVariant),
        ),
        gutter ?? Constants.largeVerticalGutter.verticalSpace,
        Row(
          children: [
            Flexible(
              child: DevfestTabButton(
                title: const Text('Friday'),
                selected: eventDay == EventDay.one,
                onTap: () {
                  onEventDayChanged?.call(EventDay.one);
                },
              ),
            ),
            Flexible(
              child: DevfestTabButton(
                title: const Text('Saturday'),
                selected: eventDay == EventDay.two,
                onTap: () {
                  onEventDayChanged?.call(EventDay.two);
                },
              ),
            ),
          ],
        ),
        Constants.verticalGutter.verticalSpace,
      ],
    );
  }
}
