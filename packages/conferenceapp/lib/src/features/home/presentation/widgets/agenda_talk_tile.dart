import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../../../shared/shared.dart';

class AgendaTalkTile extends StatelessWidget {
  const AgendaTalkTile({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('hh:mm a');
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.verticalGutter),
        ),
        side: BorderSide(
          color: DevfestColors.grey70.possibleDarkVariant,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.verticalGutter),
          ),
          side: BorderSide(
            color: DevfestColors.grey70.possibleDarkVariant,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
                  horizontal: Constants.largeHorizontalGutter, vertical: 14)
              .r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'mobile development'.toUpperCase(),
                    style: DevfestTheme.of(context)
                        .textTheme
                        ?.bodyBody3Medium
                        ?.medium
                        .applyColor(DevfestColors.grey60.possibleDarkVariant),
                  ),
                  FavouriteIcon(
                    onTap: () {},
                  ),
                ],
              ),
              Constants.verticalGutter.verticalSpace,
              Text(
                'Appreciating the usefulness of football memes in decoding intent',
                style: DevfestTheme.of(context)
                    .textTheme
                    ?.bodyBody1Semibold
                    ?.semi
                    .applyColor(DevfestColors.grey10.possibleDarkVariant),
              ),
              Constants.smallVerticalGutter.verticalSpace,
              Text(
                'Celebrate the women tech makers at their annual breakfast',
                style: DevfestTheme.of(context)
                    .textTheme
                    ?.bodyBody2Medium
                    ?.semi
                    .applyColor(DevfestColors.grey50.possibleDarkVariant),
              ),
              Constants.verticalGutter.verticalSpace,
              const SpeakerInfo(
                name: 'Samuel Abada',
                shortBio: 'Flutter Engineer, Tesla',
                avatarUrl: '',
              ),
              Constants.verticalGutter.verticalSpace,
              Row(
                children: [
                  IconText(
                    IconsaxOutline.clock,
                    dateFormat.format(DateTime.now()),
                  ),
                  Constants.largeHorizontalGutter.horizontalSpace,
                  const IconText(IconsaxOutline.location, 'Hall A')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeakerInfo extends StatelessWidget {
  const SpeakerInfo({
    super.key,
    this.avatarUrl = '',
    required this.name,
    required this.shortBio,
  });

  final String name;
  final String shortBio;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Material(
          color: DevfestColors.primariesGreen80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Constants.smallVerticalGutter),
            ),
            side: BorderSide(color: DevfestColors.primariesBlue50, width: 2),
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: FlutterLogo(size: 48),
          ),
        ),
        Constants.horizontalGutter.horizontalSpace,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    DevfestTheme.of(context).textTheme?.bodyBody1Semibold?.semi,
              ),
              (Constants.smallVerticalGutter / 2).verticalSpace,
              Text(
                shortBio,
                style: DevfestTheme.of(context)
                    .textTheme
                    ?.bodyBody3Medium
                    ?.medium
                    .applyColor(DevfestColors.grey50.possibleDarkVariant),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, this.isFavourite = false, this.onTap});

  final bool isFavourite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: isFavourite ? 'Remove from favourites' : 'Add to favourites',
      ),
      child: Material(
        borderRadius: const BorderRadius.all(
            Radius.circular(Constants.smallVerticalGutter)),
        color: DevfestColors.primariesYellow90.possibleDarkVariant,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(
              Radius.circular(Constants.smallVerticalGutter)),
          child: Padding(
            padding: const EdgeInsets.all(Constants.largeVerticalGutter / 4).r,
            child: Icon(
              isFavourite ? IconsaxBold.star : IconsaxOutline.star,
              color: DevfestColors.grey50.possibleDarkVariant,
            ),
          ),
        ),
      ),
    );
  }
}
