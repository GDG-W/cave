import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/more/presentation/widgets/map.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class VenueMapScreen extends StatelessWidget {
  const VenueMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        leadingWidth: 120.w,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Constants.horizontalGutter).r,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return LandmarkMap(mapConstraints: constraints);
                },
              ),
            ),
          ),
          Constants.verticalGutter.verticalSpace,
          Material(
            color: DevfestTheme.of(context).backgroundColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              side: BorderSide(color: DevfestColors.grey80.possibleDarkVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                      vertical: Constants.verticalGutter,
                      horizontal: Constants.horizontalMargin)
                  .r
                  .add(EdgeInsets.only(
                      bottom: MediaQuery.viewPaddingOf(context).bottom)),
              child: DevfestFilledButton(
                title: const Text('Get Directions'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
