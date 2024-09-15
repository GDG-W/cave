import 'package:cave/cave.dart';
import 'package:flutter/material.dart' hide Action;

import '../map/map.dart';
import 'map_block.dart';
import 'map_layout.dart';

typedef BlockLayoutCallback = void Function(List<BlockLayoutArea> areas);

typedef GridCellRange = ({GridCell start, GridCell end});

class LandmarkMap extends StatefulWidget {
  const LandmarkMap({
    super.key,
    required this.mapConstraints,
    required this.onBlocksLayout,
    this.getDirections,
  });

  final BoxConstraints mapConstraints;
  final BlockLayoutCallback onBlocksLayout;
  final GridCellRange? getDirections;

  @override
  State<LandmarkMap> createState() => _LandmarkMapState();
}

class _LandmarkMapState extends State<LandmarkMap>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late double largeRoomHeight = widget.mapConstraints.maxWidth * 0.206;
  late double mediumRoomHeight = widget.mapConstraints.maxHeight * 0.09;

  late List<Block> mapSchematics = [
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth,
      height: largeRoomHeight,
      hideFenceBorder: HideFenceBorder.right,
      entranceLabel: 'ENTRANCE',
      blockLabel: 'Exhibition Room',
      blockColor: const Color(0xffb6b0dd),
      openingPositions: [
        Offset(56.w, 0),
        Offset(335.w, 0),
      ],
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth,
      height: largeRoomHeight,
      hideFenceBorder: HideFenceBorder.right,
      entranceLabel: 'ENTRANCE',
      blockLabel: 'Room 1',
      blockColor: const Color(0xffffd3bf),
      openingPositions: [
        Offset(335.w, largeRoomHeight),
        Offset(56.w, largeRoomHeight),
        Offset(335.w, 0),
      ],
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth,
      height: largeRoomHeight,
      hideFenceBorder: HideFenceBorder.right,
      entranceLabel: 'Exit',
      blockLabel: 'Room 2',
      blockColor: const Color(0xff88cd83),
      openingSizes: [null, widget.mapConstraints.maxWidth * 0.082],
      openingPositions: [
        Offset(335.w, largeRoomHeight),
        Offset(307.w, 0),
      ],
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth * 0.082,
      height: widget.mapConstraints.maxHeight * 0.293,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'HALLWAY',
      blockLabelStyle:
          DevfestTheme.of(context).textTheme?.bodyBody4Regular?.medium,
      blockColor: const Color(0xffd9d0c3),
      position: Offset(280.w, largeRoomHeight * 3),
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth * 0.190,
      height: widget.mapConstraints.maxHeight * 0.14,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'Toilet',
      blockColor: const Color(0xffbee673),
      position: Offset(
        313.w,
        largeRoomHeight * 3 + widget.mapConstraints.maxHeight * 0.064,
      ),
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth * 0.638,
      height: mediumRoomHeight,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'STAIRWAY',
      blockLabelStyle:
          DevfestTheme.of(context).textTheme?.bodyBody4Regular?.medium,
      blockColor: const Color(0xffd9d9d9),
      position: Offset(
        22.w,
        largeRoomHeight * 3 +
            widget.mapConstraints.maxHeight * 0.293 -
            widget.mapConstraints.maxHeight * 0.09,
      ),
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth * 0.344,
      height: mediumRoomHeight,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'Room 3',
      blockColor: const Color(0xffbee673),
      position: Offset(
        22.w,
        largeRoomHeight * 3 + widget.mapConstraints.maxHeight * 0.114,
      ),
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth * 0.344,
      height: mediumRoomHeight,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'Room 4',
      blockColor: const Color(0xffbbddc9),
      position: Offset(
        22.w,
        largeRoomHeight * 3 + widget.mapConstraints.maxHeight * 0.293,
      ),
    ),
  ];

  late List<BlockLayoutArea> roomsLayouts;

  int hueValue = 200;
  int movementPathState = 30;
  int allowedState = 150;

  late Grid<int> grid = Grid.make(
    widget.mapConstraints.maxHeight ~/ cellSize,
    widget.mapConstraints.maxWidth ~/ cellSize,
    0,
  );

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      if (widget.getDirections != null) {
        _navigateToDestination();
      }
    });
  }

  @override
  void didUpdateWidget(covariant LandmarkMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.getDirections != widget.getDirections &&
        widget.getDirections != null) {
      _navigateToDestination();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _navigateToDestination() async {
    if (widget.getDirections == null) return;
    GridCell start = widget.getDirections!.start;
    GridCell goal = widget.getDirections!.end;

    grid.resetCells(grid.filledCells((state) => state == movementPathState));
    controller.reset();

    final robot = MapRobot(grid);
    robot.getAction(start, goal);

    Grid<int> newGrid = Grid.make(widget.mapConstraints.maxHeight ~/ cellSize,
        widget.mapConstraints.maxWidth ~/ cellSize, 0);

    newGrid = newGrid.copyWith(grid: grid.grid.toList());

    for (final action in robot.foundActions.reversed) {
      switch (action) {
        case Action.moveUp:
          newGrid.grid[start.row][start.column] = movementPathState;
          start = start.above;
          break;
        case Action.moveRight:
          newGrid.grid[start.row][start.column] = movementPathState;
          start = start.right;
          break;
        case Action.moveLeft:
          newGrid.grid[start.row][start.column] = movementPathState;
          start = start.left;
          break;
        case Action.moveDown:
          newGrid.grid[start.row][start.column] = movementPathState;
          start = start.below;
          break;
        case Action.doNothing:
          newGrid.grid[start.row][start.column] = movementPathState;
          start = start;
          break;
      }
    }

    if (!mounted) return;
    setState(() {
      if (!mounted) return;
      grid = newGrid;
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          foregroundPainter: GridPainter(
            grid: grid,
            cellSize: cellSize,
            progress: controller.value,
            reverse: widget.getDirections != null
                ? (widget.getDirections!.start.row >
                    widget.getDirections!.end.row)
                : false,
          ),
          child: child,
        );
      },
      child: CustomMultiChildLayout(
        delegate: MapLayoutDelegate(
          blocks: mapSchematics,
          onBlocksLayout: (areas) {
            widget.onBlocksLayout(areas.toList());
            roomsLayouts = areas;
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              areas.forEach(_fillPositionOnGrid);
            });
          },
        ),
        children: [
          for (int i = 0; i < mapSchematics.length; i++)
            LayoutId(
              id: i,
              child: CustomPaint(
                painter: MapBlockPainter(block: mapSchematics[i]),
              ),
            ),
        ],
      ),
    );
  }

  void _fillPositionOnGrid(BlockLayoutArea area) {
    Grid<int> newGrid = Grid.make(widget.mapConstraints.maxHeight ~/ cellSize,
        widget.mapConstraints.maxWidth ~/ cellSize, 0);

    newGrid = newGrid.copyWith(grid: grid.grid.toList());

    final startTouchColumn = (area.start.dx / cellSize).floor();
    final endTouchColumn = (area.end.dx / cellSize).floor();
    final startTouchRow = (area.start.dy / cellSize).floor();
    final endTouchRow = (area.end.dy / cellSize).floor();

    for (int i = startTouchRow; i < endTouchRow; i++) {
      for (int j = startTouchColumn; j < endTouchColumn; j++) {
        final leftEdge = j == startTouchColumn;
        final rightEdge = j == endTouchColumn;
        final topEdge = i == startTouchRow;
        final bottomEdge = i == endTouchRow - 1;

        // deal with edges
        if (leftEdge || rightEdge || topEdge || bottomEdge) {
          if (area.hideFenceBorder != HideFenceBorder.all) {
            if (area.hideFenceBorder == HideFenceBorder.right && !rightEdge) {
              final openingsGridPoints = area.openings.map((opening) {
                final startTouchColumn = (opening.start.dx / cellSize).floor();
                final endTouchColumn = (opening.end.dx / cellSize).floor();
                final startTouchRow = (opening.start.dy / cellSize).floor();
                final endTouchRow = (opening.end.dy / cellSize).floor();

                return (
                  startGridColumn: startTouchColumn,
                  endGridColumn: endTouchColumn,
                  startGridRow: startTouchRow,
                  endGridRow: endTouchRow,
                );
              });

              for (final gridPoint in openingsGridPoints) {
                final isWithinColumnRange = j >= gridPoint.startGridColumn &&
                    j <= gridPoint.endGridColumn;
                final isWithinRowRange =
                    i >= gridPoint.startGridRow && i <= gridPoint.endGridRow;

                if (isWithinColumnRange && isWithinRowRange) {
                  newGrid.grid[i][j] = hueValue;
                  continue;
                }
              }

              continue;
            }

            if (area.hideFenceBorder == HideFenceBorder.left && !leftEdge) {
              continue;
            }

            if (area.hideFenceBorder == HideFenceBorder.top && !topEdge) {
              continue;
            }

            if (area.hideFenceBorder == HideFenceBorder.bottom && !bottomEdge) {
              continue;
            }
          }
        }

        newGrid.grid[i][j] = hueValue;
      }
    }

    setState(() {
      grid = newGrid;
    });

    hueValue += 20;
    if (hueValue > 360) {
      hueValue = 1;
    }
  }
}
