import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/more/presentation/map/map.dart';
import 'package:devfest24/src/features/more/presentation/widgets/map.dart';
import 'package:flutter/material.dart' hide Action;

import '../../../../shared/shared.dart';
import '../widgets/map_layout.dart';

class VenueMapScreen extends StatefulWidget {
  const VenueMapScreen({super.key});

  @override
  State<VenueMapScreen> createState() => _VenueMapScreenState();
}

class _VenueMapScreenState extends State<VenueMapScreen> {
  late List<BlockLayoutArea> roomsLayouts;
  GridCellRange? navigationBlock;
  ({RoomType? from, RoomType? to}) instructions = (from: null, to: null);
  Grid<int>? grid;
  List<RoomType> roomByRoomInstructions = [];

  void _fromOnChanged(RoomType? room) {
    setState(() {
      instructions = (from: room, to: instructions.to);
      navigationBlock = null;
    });
  }

  void _toOnChanged(RoomType? room) {
    setState(() {
      instructions = (from: instructions.from, to: room);
      navigationBlock = null;
    });
  }

  void _getDirections() {
    if (instructions.to == null || instructions.from == null) return;

    final newNavigationBlock = (
      start: getFirstAvailableCellFromBottomInRoom(instructions.from!),
      end: getCenterAvailableCellInRoom(instructions.to!),
    );
    roomByRoomInstructions =
        getOverviewDirections(instructions.from!, instructions.to!);

    debugPrint('walk path: ${roomByRoomInstructions.chainString()}');
    setState(() {
      navigationBlock = newNavigationBlock;
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

    return GridCell(row: randomRow, column: randomColumn);
  }

  GridCell getFirstAvailableCellFromBottomInRoom(RoomType room) {
    final roomBlock = roomsLayouts.firstWhere(
      (block) => block.room == room,
    );

    final startTouchColumn = (roomBlock.start.dx / cellSize).floor();
    final endTouchColumn = (roomBlock.end.dx / cellSize).floor();
    final startTouchRow = (roomBlock.start.dy / cellSize).floor();
    final endTouchRow = (roomBlock.end.dy / cellSize).floor();

    final startAndEndColDiff = (endTouchColumn - startTouchColumn - 1);
    final column =
        startTouchColumn + startAndEndColDiff - (startAndEndColDiff ~/ 8);
    final row = startTouchRow + (endTouchRow - startTouchRow) ~/ 2;

    GridCell cell = GridCell(row: row, column: column);

    while (grid!.filter(cell, (state) => state <= 0)) {
      cell = GridCell(row: cell.row - 1, column: cell.column - 1);
    }

    return cell;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        leadingWidth: 120.w,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                          horizontal: Constants.horizontalMargin)
                      .r,
                  child: Column(
                    children: [
                      DevfestDropDown(
                        title: 'Where are you in Landmark?',
                        hint: 'Current Location',
                        items: RoomType.values
                            .where((room) => room != instructions.to)
                            .toList(),
                        prefixIcon: const Icon(IconsaxOutline.location),
                        suffixIcon: const Icon(IconsaxOutline.arrow_down_1),
                        onChanged: _fromOnChanged,
                      ),
                      Constants.verticalGutter.verticalSpace,
                      DevfestDropDown(
                        title: 'Where are you headed?',
                        hint: 'Desired destination',
                        items: RoomType.values
                            .where((room) => room != instructions.from)
                            .toList(),
                        prefixIcon: const Icon(IconsaxOutline.location_tick),
                        suffixIcon: const Icon(IconsaxOutline.arrow_down_1),
                        onChanged: _toOnChanged,
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
                                onGridUpdate: (newGrid) {
                                  grid = newGrid;
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
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: DevfestTheme.of(context).backgroundColor,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      border: Border(
                        top: BorderSide(
                          color: DevfestColors.grey80.possibleDarkVariant,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              vertical: Constants.verticalGutter,
                              horizontal: Constants.horizontalMargin)
                          .r
                          .add(EdgeInsets.only(
                              bottom:
                                  MediaQuery.viewPaddingOf(context).bottom)),
                      child: DevfestFilledButton(
                        title: const Text('Get Directions'),
                        onPressed: _getDirections,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
