import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

extension type const GridCell(({int row, int column}) cell) {
  int get row => cell.row;

  int get column => cell.column;

  GridCell get left => GridCell((row: cell.row, column: cell.column - 1));

  GridCell get right => GridCell((row: cell.row, column: cell.column + 1));

  GridCell get above => GridCell((row: cell.row - 1, column: cell.column));

  GridCell get below => GridCell((row: cell.row + 1, column: cell.column));
}

class GridPainter extends CustomPainter {
  GridPainter({
    required this.grid,
    required this.cellSize,
    required this.progress,
    this.reverse = false,
  });

  final Grid<int> grid;
  final double cellSize;
  final double progress;
  final bool reverse;

  @override
  void paint(Canvas canvas, Size size) {
    // final path = Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(0, size.height)
    //   ..lineTo(size.width, size.height)
    //   ..lineTo(size.width, 0)
    //   ..close();

    final path = _paintGrid(canvas, size, grid);
    const hue = HSLColor.fromAHSL(1, 30, 1, 0.5);

    canvas.drawPath(
      path,
      Paint()
        ..color = hue.toColor()
        ..style = PaintingStyle.fill,
    );
    // final pathMetrics = path.computeMetrics();

    // for (final pathMetric in pathMetrics) {
    //   final extractPath =
    //   pathMetric.extractPath(0, pathMetric.length * progress);
    //   canvas.drawPath(
    //     extractPath,
    //     Paint()
    //       ..color = hue.toColor()
    //       ..style = PaintingStyle.stroke
    //       ..strokeCap = StrokeCap.round
    //       ..strokeJoin = StrokeJoin.round
    //       ..strokeWidth = cellSize,
    //   );
    // }
  }

  Path _paintGrid(Canvas canvas, Size size, Grid<int> grid) {
    final progressPath = Path();

    final movementCells = reverse
        ? grid.filledCells((state) => state == 30).reversed.toList().asMap()
        : grid.filledCells((state) => state == 30).asMap();

    for (final cellEntry in movementCells.entries) {
      final cell = cellEntry.value;
      final yOrigin = (size.height / grid.rows * cell.row).ceilToDouble();
      final xOrigin = (size.width / grid.columns * cell.column).ceilToDouble();
      final center = cellSize / 2;

      progressPath
        ..moveTo(xOrigin, yOrigin)
        ..addRect(
          Rect.fromCenter(
            center: Offset(xOrigin + center, yOrigin + center),
            width: cellSize,
            height: cellSize,
          ),
        );
      // if (cellEntry.key == 0) {
      //   progressPath.moveTo(xOrigin, yOrigin);
      //   continue;
      // }

      // progressPath.lineTo(xOrigin + center, yOrigin + center);
      // progressPath.addRect(
      //   Rect.fromCenter(
      //     center: Offset(xOrigin + center, yOrigin + center),
      //     width: cellSize,
      //     height: cellSize,
      //   ),
      // );
      // progressPath.lineTo(xOrigin, yOrigin);
    }

    // for (int i = 0; i <= grid.rows - 1; i++) {
    //   for (int j = 0; j <= grid.columns - 1; j++) {
    //     final state = grid.grid[i][j];
    //
    //     final yOrigin = 0 + (size.height ~/ grid.rows * i).toDouble();
    //     final xOrigin = 0 + (size.width ~/ grid.columns * j).toDouble();
    //     final center = cellSize / 2;
    //     Path path = Path()
    //       ..moveTo(xOrigin, yOrigin)
    //       ..addRect(
    //         Rect.fromCenter(
    //           center: Offset(xOrigin + center, yOrigin + center),
    //           width: cellSize,
    //           height: cellSize,
    //         ),
    //       );
    //     canvas.drawPath(
    //       path,
    //       Paint()
    //         ..color = Colors.black
    //         ..style = PaintingStyle.stroke
    //         ..strokeWidth = 0.5,
    //     );
    //
    //     if (state > 0) {
    //       final yOrigin = 0 + (size.height ~/ grid.rows * i).toDouble();
    //       final xOrigin = 0 + (size.width ~/ grid.columns * j).toDouble();
    //       final center = cellSize / 2;
    //       Path path = Path()
    //         ..moveTo(xOrigin, yOrigin)
    //         ..addRect(
    //           Rect.fromCenter(
    //             center: Offset(xOrigin + center, yOrigin + center),
    //             width: cellSize,
    //             height: cellSize,
    //           ),
    //         );
    //
    //       final hue = HSLColor.fromAHSL(1, state.toDouble(), 1, 0.5);
    //       canvas.drawPath(
    //         path,
    //         Paint()
    //           ..color = hue.toColor()
    //           ..style = PaintingStyle.fill,
    //       );
    //
    //       if (state == 30) {
    //         final hue = HSLColor.fromAHSL(1, state.toDouble(), 1, 0.5);
    //         progressPath.addPath(path, Offset.zero);
    //         // canvas.drawPath(
    //         //   path,
    //         //   Paint()
    //         //     ..color = hue.toColor()
    //         //     ..style = PaintingStyle.stroke
    //         //     ..strokeCap = StrokeCap.round
    //         //     ..strokeJoin = StrokeJoin.round
    //         //     ..strokeWidth = cellSize,
    //         // );
    //         // final pathMetrics = path.computeMetrics();
    //         //
    //         // for (final pathMetric in pathMetrics) {
    //         //   final extractPath =
    //         //       pathMetric.extractPath(0, pathMetric.length * progress);
    //         //   canvas.drawPath(
    //         //     extractPath,
    //         //     Paint()
    //         //       ..color = hue.toColor()
    //         //       ..style = PaintingStyle.fill
    //         //       ..strokeWidth = 0.5,
    //         //   );
    //         // }
    //       }
    //     }
    //   }
    // }

    return progressPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! GridPainter) return false;

    // ensure unnecessary paint calls doesn't trigger repaints
    if (oldDelegate.grid != grid) return true;
    if (oldDelegate.cellSize != cellSize) return true;
    if (oldDelegate.progress != progress) return true;
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

  ({int rows, int columns}) get size {
    return (rows: rows, columns: columns);
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

  List<GridCell> filledCells(bool Function(T state) filter) {
    List<GridCell> cells = [];
    for (int i = 0; i <= rows - 1; i++) {
      for (int j = 0; j <= columns - 1; j++) {
        final state = grid[i][j];

        if (filter(state)) cells.add(GridCell((row: i, column: j)));
      }
    }
    return cells;
  }

  void resetCells(List<GridCell> cells) {
    for (final cell in cells) {
      grid[cell.row][cell.column] = initialValue;
    }
  }

  void fillCells(List<GridCell> cells, T state) {
    for (final cell in cells) {
      grid[cell.row][cell.column] = state;
    }
  }

  bool filter(GridCell cell, bool Function(T state) filter) {
    return filter(grid[cell.row][cell.column]);
  }

  bool filterCells(List<GridCell> cells, bool Function(T state) filter) {
    for (final cell in cells) {
      if (!filter(grid[cell.row][cell.column])) return false;
    }
    return true;
  }

  GridCell? firstWhereOrNull(bool Function(T state) filter) {
    for (int i = 0; i <= rows - 1; i++) {
      for (int j = 0; j <= columns - 1; j++) {
        final state = grid[i][j];

        if (filter(state)) return GridCell((row: i, column: j));
      }
    }
    return null;
  }

  Map<String, GridCell> getNeighbourPositions(GridCell cell) {
    final neighbours = <String, GridCell>{};

    if (validPosition(cell.above)) {
      neighbours['above'] = cell.above;
    }

    if (validPosition(cell.below)) {
      neighbours['below'] = cell.below;
    }

    if (validPosition(cell.left)) {
      neighbours['left'] = cell.left;
    }

    if (validPosition(cell.right)) {
      neighbours['right'] = cell.right;
    }

    return neighbours;
  }

  bool validPosition(GridCell cell) {
    return cell.row >= 0 &&
        cell.row < rows &&
        cell.column >= 0 &&
        cell.column < columns;
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
