import 'package:cave/cave.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../map_utils.dart';
import 'map_block.dart';

class LandmarkMap extends StatefulWidget {
  const LandmarkMap({super.key, required this.mapConstraints});

  final BoxConstraints mapConstraints;

  @override
  State<LandmarkMap> createState() => _LandmarkMapState();
}

class _LandmarkMapState extends State<LandmarkMap> {
  late double largeRoomHeight = widget.mapConstraints.maxWidth * 0.206;
  late double mediumRoomHeight = widget.mapConstraints.maxHeight * 0.09;

  late final mapSchematics = [
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
        Offset(
          335.w,
          largeRoomHeight,
        ),
        Offset(
          307.w,
          0,
        ),
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
      position: Offset(
        280.w,
        largeRoomHeight * 3,
      ),
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

  static double cellSize = 5;
  int hueValue = 200;

  late final ValueNotifier<Grid<int>> grid = ValueNotifier(
    Grid.make(widget.mapConstraints.maxHeight ~/ cellSize,
        widget.mapConstraints.maxWidth ~/ cellSize, 0),
  );

  late List<BlockLayoutArea> roomsLayouts;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: CustomMultiChildLayout(
            delegate: MapLayoutDelegate(
              blocks: mapSchematics,
              onBlocksLayout: (areas) {
                roomsLayouts = areas.toList(); // soft-copy
                WidgetsFlutterBinding.ensureInitialized()
                    .addPostFrameCallback((_) {
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
        ),
        // Positioned.fill(
        //   child: ValueListenableBuilder(
        //     valueListenable: grid,
        //     builder: (context, schematicsGrid, child) {
        //       return CustomPaint(
        //         foregroundPainter: GridPainter(
        //           grid: schematicsGrid,
        //           cellSize: cellSize,
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  void _fillPositionOnGrid(BlockLayoutArea area) {
    Grid<int> newGrid = Grid.make(widget.mapConstraints.maxHeight ~/ cellSize,
        widget.mapConstraints.maxWidth ~/ cellSize, 0);

    newGrid = newGrid.copyWith(grid: grid.value.grid.toList());

    final startTouchColumn = (area.start.dx / cellSize).floor();
    final endTouchColumn = (area.end.dx / cellSize).floor();
    final startTouchRow = (area.start.dy / cellSize).floor();
    final endTouchRow = (area.end.dy / cellSize).floor();

    for (int i = startTouchRow; i < endTouchRow; i++) {
      for (int j = startTouchColumn; j < endTouchColumn; j++) {
        newGrid.grid[i][j] = hueValue;
      }
    }

    grid.value = newGrid;
    hueValue += 30;
    if (hueValue > 360) {
      hueValue = 1;
    }
  }
}

class GridPainter extends CustomPainter {
  GridPainter({
    required this.grid,
    required this.cellSize,
  });

  final Grid<int> grid;
  final double cellSize;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    _paintGrid(canvas, size, grid);

    canvas.restore();
  }

  void _paintGrid(Canvas canvas, Size size, Grid<int> grid) {
    for (int i = 0; i <= grid.rows - 1; i++) {
      for (int j = 0; j <= grid.columns - 1; j++) {
        final state = grid.grid[i][j];

        final yOrigin = 0 + (size.height ~/ grid.rows * i).toDouble();
        final xOrigin = 0 + (size.width ~/ grid.columns * j).toDouble();
        final center = cellSize / 2;
        Path path = Path()
          ..moveTo(xOrigin, yOrigin)
          ..addRect(
            Rect.fromCenter(
              center: Offset(xOrigin + center, yOrigin + center),
              width: cellSize,
              height: cellSize,
            ),
          );
        canvas.drawPath(
          path,
          Paint()
            ..color = Colors.black
            ..style = PaintingStyle.stroke
            ..strokeWidth = 0.5,
        );

        if (state > 0) {
          final yOrigin = 0 + (size.height ~/ grid.rows * i).toDouble();
          final xOrigin = 0 + (size.width ~/ grid.columns * j).toDouble();
          final center = cellSize / 2;
          Path path = Path()
            ..moveTo(xOrigin, yOrigin)
            ..addRect(
              Rect.fromCenter(
                center: Offset(xOrigin + center, yOrigin + center),
                width: cellSize,
                height: cellSize,
              ),
            );

          final hue = HSLColor.fromAHSL(1, state.toDouble(), 1, 0.5);
          canvas.drawPath(
            path,
            Paint()
              ..color = hue.toColor()
              ..style = PaintingStyle.fill,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! GridPainter) return false;

    // ensure unnecessary paint calls doesn't trigger repaints
    if (oldDelegate.grid != grid) return true;
    return false;
  }
}

final class Grid<T> extends Equatable {
  final List<List<T>> grid;

  final T initialValue;

  const Grid._(this.grid, this.initialValue);

  factory Grid.make(int rows, int columns, T initialValue) {
    return Grid._(
      List.generate(
        rows,
        (index) => List.generate(columns, (index) => initialValue),
      ),
      initialValue,
    );
  }

  int get rows {
    return grid.length;
  }

  int get columns {
    return grid.first.length;
  }

  int filledCellsCount(bool Function(T state) filter) {
    return filledCells(filter).length;
  }

  List<({int row, int column})> filledCells(bool Function(T state) filter) {
    List<({int row, int column})> cells = [];
    for (int i = 0; i <= rows - 1; i++) {
      for (int j = 0; j <= columns - 1; j++) {
        final state = grid[i][j];

        if (filter(state)) cells.add((row: i, column: j));
      }
    }
    return cells;
  }

  /// Due to the vector nature of the grid(2x2 matrix), to ensure the equality
  /// works properly and to help dart infer that a new grid object is created
  /// we use the grid factory to create a new instance and copy the grid values
  /// to this new grid before returning the instance
  Grid<T> copyWith({List<List<T>>? grid}) {
    if (grid != null) {
      Grid<T> nextGrid = Grid.make(rows, columns, initialValue);

      for (int i = 0; i <= rows - 1; i++) {
        for (int j = 0; j <= columns - 1; j++) {
          nextGrid.grid[i][j] = grid[i][j];
        }
      }

      return nextGrid;
    }

    return Grid._(grid ?? this.grid, initialValue);
  }

  @override
  List<Object?> get props => [grid];
}
