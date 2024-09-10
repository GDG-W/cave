import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';

class SignedOutUserHeaderTile extends StatelessWidget {
  const SignedOutUserHeaderTile({super.key, this.signInOnTap});

  final VoidCallback? signInOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Constants.smallVerticalGutter,
        bottom: Constants.largeVerticalGutter,
      ),
      child: SizedBox(
        height: 188.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Container(
                height: 188.h,
                padding: const EdgeInsets.all(Constants.verticalGutter).r,
                decoration: BoxDecoration(
                  color: DevfestColors.grey10.possibleDarkVariant,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.largeVerticalGutter),
                  ),
                ),
                child: Column(
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      shape: CircleBorder(
                        side: BorderSide(
                            color: DevfestColors.grey50.possibleDarkVariant),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: Constants.largeHorizontalGutter,
                                vertical: Constants.largeVerticalGutter / 2)
                            .r,
                        child: Text(
                          '😁',
                          style: DevfestTheme.of(context)
                              .textTheme
                              ?.headerH5
                              ?.semi,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Sign In',
                      style: DevfestTheme.of(context)
                          .textTheme
                          ?.titleTitle2Semibold
                          ?.semi
                          .applyColor(
                              DevfestColors.grey100.possibleDarkVariant),
                    ),
                    Constants.smallVerticalGutter.verticalSpace,
                    Text(
                      'You have not logged yet to access\nyour profile',
                      textAlign: TextAlign.center,
                      style: DevfestTheme.of(context)
                          .textTheme
                          ?.bodyBody3Medium
                          ?.medium
                          .applyColor(
                              DevfestColors.grey100.possibleDarkVariant),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Constants.verticalGutter.r,
              right: Constants.verticalGutter.r,
              child: Material(
                color:
                    DevfestColors.grey100.possibleDarkVariant.withOpacity(0.3),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: DevfestColors.grey100),
                  borderRadius: BorderRadius.all(Radius.circular(56)),
                ),
                child: InkWell(
                  onTap: signInOnTap,
                  customBorder: const RoundedRectangleBorder(
                    side: BorderSide(color: DevfestColors.grey100),
                    borderRadius: BorderRadius.all(Radius.circular(56)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                            vertical: Constants.smallVerticalGutter,
                            horizontal: Constants.largeHorizontalGutter)
                        .r,
                    child: Text(
                      'Sign In',
                      style: DevfestTheme.of(context)
                          .textTheme
                          ?.bodyBody3Semibold
                          ?.semi
                          .applyColor(
                              DevfestColors.grey100.possibleDarkVariant),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignedInUserHeaderTile extends StatelessWidget {
  const SignedInUserHeaderTile({
    super.key,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.gap,
  });

  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Widget? gap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'user_header_tile',
      child: AnimatedContainer(
        duration: Constants.kAnimationDur,
        height: height ?? 188.h,
        padding: padding ?? const EdgeInsets.all(Constants.verticalGutter).r,
        margin: margin ??
            const EdgeInsets.only(
              top: Constants.smallVerticalGutter,
              bottom: Constants.largeVerticalGutter,
            ),
        decoration: BoxDecoration(
          gradient: DevfestColors.inverseGradientGradient,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(Constants.largeVerticalGutter),
              ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
            gap ?? const Spacer(),
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
