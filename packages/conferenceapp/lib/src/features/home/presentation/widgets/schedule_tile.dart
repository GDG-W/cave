import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/dashboard/model/model.dart';
import 'package:devfest24/src/shared/extensions.dart';
import 'package:devfest24/src/shared/widgets/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgendaScheduleTile extends StatelessWidget {
  const AgendaScheduleTile(
      {super.key, required this.start, required this.session, this.onTap});

  final DateTime start;
  final SessionDto session;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('hh:mm a');
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius:
            const BorderRadius.all(Radius.circular(Constants.verticalGutter)),
        side: BorderSide(
            color: DevfestColors.grey70.possibleDarkVariant, width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(Constants.verticalGutter)),
          side: BorderSide(
              color: DevfestColors.grey70.possibleDarkVariant, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(Constants.verticalGutter.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Initials(initial: session.title[0]),
              Constants.verticalGutter.verticalSpace,
              Text(
                session.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: DevfestTheme.of(context)
                    .textTheme
                    ?.titleTitle2Semibold
                    ?.semi,
              ),
              Constants.smallVerticalGutter.verticalSpace,
              Text(
                session.descrption,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: DevfestTheme.of(context)
                    .textTheme
                    ?.bodyBody2Medium
                    ?.medium
                    .copyWith(color: DevfestColors.grey50.possibleDarkVariant),
              ),
              Constants.verticalGutter.verticalSpace,
              Row(
                children: [
                  IconText(
                    IconsaxOutline.clock,
                    dateFormat.format(start),
                  ),
                  Constants.largeHorizontalGutter.horizontalSpace,
                  IconText(IconsaxOutline.location, session.venue.id),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Initials extends StatelessWidget {
  const _Initials({required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DevfestColors.primariesBlue80.possibleDarkVariant,
      borderRadius: const BorderRadius.all(
          Radius.circular(Constants.smallVerticalGutter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.smallVerticalGutter,
          horizontal: Constants.largeVerticalGutter / 2,
        ).r,
        child: Text(
          initial.toUpperCase(),
          textAlign: TextAlign.center,
          style: DevfestTheme.of(context)
              .textTheme
              ?.titleTitle1Semibold
              ?.semi
              .copyWith(
                  color: DevfestColors.primariesBlue20.possibleDarkVariant,
                  height: 1.34),
        ),
      ),
    );
  }
}
