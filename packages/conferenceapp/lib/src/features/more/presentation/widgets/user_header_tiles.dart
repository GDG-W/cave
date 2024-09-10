import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';

class SignedInUserHeaderTile extends StatelessWidget {
  const SignedInUserHeaderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188.h,
      padding: const EdgeInsets.all(Constants.verticalGutter).r,
      margin: const EdgeInsets.only(
          top: Constants.smallVerticalGutter,
          bottom: Constants.largeVerticalGutter),
      decoration: const BoxDecoration(
        gradient: DevfestColors.inverseGradientGradient,
        borderRadius: BorderRadius.all(
          Radius.circular(Constants.largeVerticalGutter),
        ),
      ),
      child: Column(
        children: [
          const _UserInitialTag('s'),
          Constants.smallVerticalGutter.verticalSpace,
          Text(
            'Samuel Abada',
            style: DevfestTheme.of(context)
                .textTheme
                ?.titleTitle2Semibold
                ?.semi
                .applyColor(DevfestColors.grey100),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: _TicketInfoTile(
                  title: IconText(
                    IconsaxOutline.ticket_star,
                    'Type: 2 Day Ticket',
                    textStyle: DevfestTheme.of(context)
                        .textTheme
                        ?.bodyBody4Semibold
                        ?.semi
                        .applyColor(DevfestColors.grey100),
                    iconColor: DevfestColors.grey100,
                    iconSize: 24,
                  ),
                ),
              ),
              Constants.horizontalGutter.horizontalSpace,
              Expanded(
                child: _TicketInfoTile(
                  title: IconText(
                    IconsaxOutline.ticket_star,
                    'ID: 413 012 123',
                    textStyle: DevfestTheme.of(context)
                        .textTheme
                        ?.bodyBody4Semibold
                        ?.semi
                        .applyColor(DevfestColors.grey100),
                    iconColor: DevfestColors.grey100,
                    iconSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UserInitialTag extends StatelessWidget {
  const _UserInitialTag(this.initial);

  final String initial;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DevfestColors.backgroundSoftLight,
      shape: const CircleBorder(
        side: BorderSide(color: DevfestColors.grey100),
      ),
      child: SizedBox.square(
        dimension: 64.r,
        child: Center(
          child: Text(
            initial.toUpperCase(),
            style: DevfestTheme.of(context)
                .textTheme
                ?.headerH5
                ?.semi
                .applyColor(DevfestColors.grey100),
          ),
        ),
      ),
    );
  }
}

class _TicketInfoTile extends StatelessWidget {
  const _TicketInfoTile({required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DevfestColors.backgroundSoftLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(56)),
        side: BorderSide(
          color: DevfestColors.grey100,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.smallVerticalGutter * 0.6,
          horizontal: Constants.largeHorizontalGutter * 0.8,
        ).r,
        child: Center(child: title),
      ),
    );
  }
}
