import 'dart:math';

import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/more/presentation/widgets/map.dart';
import 'package:devfest24/src/features/more/presentation/map/grid.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../map/map_utils.dart';
import '../widgets/map_layout.dart';

class VenueMapScreen extends StatefulWidget {
  const VenueMapScreen({super.key});

  @override
  State<VenueMapScreen> createState() => _VenueMapScreenState();
}

class _VenueMapScreenState extends State<VenueMapScreen> {
  late List<BlockLayoutArea> roomsLayouts;
  GridCellRange? navigationBlock;

  void _getDirections() {
    // final getExhibitionToRoom4Directions =
    //     getOverviewDirections(RoomType.exhibitionRoom, RoomType.room3);

    // final directionsBlockLayout = getExhibitionToRoom4Directions
    //     .map((direction) =>
    //         roomsLayouts.firstWhere((layout) => layout.room == direction))
    //     .toList();

    // debugPrint('block layouts result\n${directionsBlockLayout.printLayout()}');
    setState(() {
      navigationBlock = (
        start: getRandomAvailableCellInRoom(RoomType.exhibitionRoom),
        end: getCenterAvailableCellInRoom(RoomType.toilet),
      );
    });
  }

  GridCell getCenterAvailableCellInRoom(RoomType room) {
    final roomBlock = roomsLayouts.firstWhere(
      (block) => block.room == room,
    );

    final startTouchColumn = (roomBlock.start.dx / cellSize).floor();
    final endTouchColumn = (roomBlock.end.dx / cellSize).floor();
    final startTouchRow = (roomBlock.start.dy / cellSize).floor();
    final endTouchRow = (roomBlock.end.dy / cellSize).floor();

    final randomRow = startTouchRow + (endTouchRow - startTouchRow) ~/ 2;
    final randomColumn =
        startTouchColumn + (endTouchColumn - startTouchColumn) ~/ 2;

    return GridCell((row: randomRow, column: randomColumn));
  }

  GridCell getRandomAvailableCellInRoom(RoomType room) {
    final roomBlock = roomsLayouts.firstWhere(
      (block) => block.room == room,
    );

    final startTouchColumn = (roomBlock.start.dx / cellSize).floor();
    final endTouchColumn = (roomBlock.end.dx / cellSize).floor();
    final startTouchRow = (roomBlock.start.dy / cellSize).floor();
    final endTouchRow = (roomBlock.end.dy / cellSize).floor();

    final randomRow =
        startTouchRow + Random().nextInt(endTouchRow - startTouchRow) ~/ 2;
    final randomColumn = startTouchColumn +
        Random().nextInt(endTouchColumn - startTouchColumn) ~/ 2;

    return GridCell((row: randomRow, column: randomColumn));
  }

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
                        child: LandmarkMap(
                          mapConstraints: constraints,
                          getDirections: navigationBlock,
                          onBlocksLayout: (layout) {
                            roomsLayouts = layout;
                          },
                        ),
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
                onPressed: _getDirections,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
