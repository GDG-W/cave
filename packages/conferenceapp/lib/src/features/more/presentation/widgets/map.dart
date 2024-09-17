import 'package:cave/cave.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/physics.dart';

import '../map/map.dart';
import '../map/path_finder.dart';
import 'map_block.dart';
import 'map_layout.dart';

typedef BlockLayoutCallback = void Function(List<BlockLayoutArea> areas);
typedef GridCallback = void Function(Grid<int> grid);

typedef GridCellRange = ({GridCell start, GridCell end});

class LandmarkMap extends StatefulWidget {
  const LandmarkMap({
    super.key,
    required this.mapConstraints,
    required this.onBlocksLayout,
    this.getDirections,
    this.onGridUpdate,
  });

  final BoxConstraints mapConstraints;
  final BlockLayoutCallback onBlocksLayout;
  final GridCallback? onGridUpdate;
  final GridCellRange? getDirections;

  @override
  State<LandmarkMap> createState() => _LandmarkMapState();
}

class _LandmarkMapState extends State<LandmarkMap>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late double largeRoomHeight = widget.mapConstraints.maxWidth * 0.206;
  late double mediumRoomHeight = widget.mapConstraints.maxHeight * 0.09;
  late List<BlockLayoutArea> roomsLayouts;
  late Animation<double> speedProgressAnim;

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
      blockLabelStyle: DevfestTheme.of(context)
          .textTheme
          ?.bodyBody4Regular
          ?.medium
          .applyColor(DevfestColors.grey10),
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
      blockLabelStyle: DevfestTheme.of(context)
          .textTheme
          ?.bodyBody4Regular
          ?.medium
          .applyColor(DevfestColors.grey10),
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

  List<Action> actions = [];

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

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      // upperBound: double.infinity,
      // lowerBound: double.infinity,
    );
    speedProgressAnim = ConstantTween<double>(0).animate(controller);

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      if (widget.getDirections != null) {
        _navigateToDestination();
      }
    });
  }

  @override
  void didUpdateWidget(covariant LandmarkMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.getDirections != null) {
      _navigateToDestination();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _resetGrid() {
    setState(() {
      grid = Grid.make(grid.rows, grid.columns, 0);
    });
    roomsLayouts.forEach(_fillPositionOnGrid);
  }

  void _runAnimation(int distance) {
    speedProgressAnim = controller.drive(Tween<double>(begin: 0, end: 1));

    final simulation = FrictionSimulation.through(0, distance.toDouble(),
        switch (distance) { <= 50 => 0.5, <= 100 => 0.4, _ => 0.3 }, 0);
    controller.animateWith(simulation);
  }

  void _navigateToDestination() async {
    if (widget.getDirections == null) return;

    _resetGrid();
    controller.reset();

    Grid<int> newGrid = Grid.make(widget.mapConstraints.maxHeight ~/ cellSize,
        widget.mapConstraints.maxWidth ~/ cellSize, 0);

    newGrid = newGrid.copyWith(grid: grid.grid.toList());

    final navigationActions = await getActions(
      grid: newGrid,
      moveRange: widget.getDirections!,
    );
    if (!mounted) return;

    GridCell start = widget.getDirections!.start;
    for (final action in navigationActions) {
      switch (action) {
        case Action.moveUp:
          start = start.above;
          newGrid.grid[start.row][start.column] = movementPathState;
          break;
        case Action.moveRight:
          start = start.right;
          newGrid.grid[start.row][start.column] = movementPathState;
          break;
        case Action.moveLeft:
          start = start.left;
          newGrid.grid[start.row][start.column] = movementPathState;
          break;
        case Action.moveDown:
          start = start.below;
          newGrid.grid[start.row][start.column] = movementPathState;
          break;
        case Action.doNothing:
          newGrid.grid[start.row][start.column] = movementPathState;
          break;
      }
    }

    if (!mounted) return;
    setState(() {
      if (!mounted) return;
      grid = newGrid;
      actions = navigationActions;
    });

    _runAnimation(navigationActions.length);
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
            progress: speedProgressAnim.value,
            cellTrackRange: widget.getDirections,
            actions: actions,
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
    widget.onGridUpdate?.call(grid);

    hueValue += 20;
    if (hueValue > 360) {
      hueValue = 1;
    }
  }
}
