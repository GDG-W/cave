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
          Padding(
            padding: const EdgeInsets.symmetric(
                    horizontal: Constants.horizontalMargin)
                .r,
            child: Column(
              children: [
                DevfestTextFormField(
                  title: 'Where are you in Landmark?',
                  hint: 'Current Location',
                  prefixIcon: const Icon(IconsaxOutline.location),
                  onChanged: (_) {},
                ),
                Constants.verticalGutter.verticalSpace,
                DevfestTextFormField(
                  title: 'Where are you headed?',
                  hint: 'Desired destination',
                  prefixIcon: const Icon(IconsaxOutline.location),
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          Constants.verticalGutter.verticalSpace,
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xfffffaeb),
                border: Border(
                  top: BorderSide(
                    color: DevfestColors.grey80.possibleDarkVariant,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Constants.largeHorizontalGutter,
                  right: Constants.smallVerticalGutter,
                  top: Constants.verticalGutter,
                  bottom: Constants.verticalGutter,
                ).r,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return RepaintBoundary(
                      child: SizedBox(
                        height: constraints.maxHeight,
                        child: LandmarkMap(mapConstraints: constraints),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
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
