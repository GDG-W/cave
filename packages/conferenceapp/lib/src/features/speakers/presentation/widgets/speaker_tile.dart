import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class SpeakerTile extends StatelessWidget {
  const SpeakerTile({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius:
          const BorderRadius.all(Radius.circular(Constants.verticalGutter)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.verticalGutter),
        ),
        child: const SpeakerInfo(
          name: 'Samuel Abada',
          shortBio: 'Flutter Engineer, Tesla',
          avatarUrl: '',
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
