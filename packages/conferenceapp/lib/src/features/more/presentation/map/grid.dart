import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Action;

import '../widgets/map.dart';
import 'map.dart';

class GridCell extends Equatable implements Comparable<GridCell> {
  final int row;
  final int column;

  const GridCell({required this.row, required this.column});

  GridCell get left => GridCell(row: row, column: column - 1);

  GridCell get right => GridCell(row: row, column: column + 1);

  GridCell get above => GridCell(row: row - 1, column: column);

  GridCell get below => GridCell(row: row + 1, column: column);

  @override
  int compareTo(GridCell other) {
    return row.compareTo(other.row) + column.compareTo(other.column);
  }

  @override
  List<Object?> get props => [row, column];
}

class GridPainter extends CustomPainter {
  GridPainter({
    required this.grid,
    required this.cellSize,
    required this.progress,
    this.cellTrackRange,
    this.actions = const [],
    this.showGrid = false,
    this.showPath = false,
    this.showBlocks = false,
  });

  final Grid<int> grid;
  final double cellSize;
  final double progress;
  final GridCellRange? cellTrackRange;
  final List<Action> actions;
  final bool showGrid;
  final bool showPath;
  final bool showBlocks;

  @override
  void paint(Canvas canvas, Size size) {
    final path = _paintRobotPath(canvas, size, grid);

    if (showGrid) _paintGrid(canvas, size);
    if (showBlocks) _paintBlocks(canvas, size);
    if (showPath) {
      _paintProgressPath(path, canvas, const HSLColor.fromAHSL(1, 30, 1, 0.5));
    }
    _paintWalker(path, canvas);
  }

  Path _paintRobotPath(Canvas canvas, Size size, Grid<int> grid) {
    Path progressPath = Path();

    if (cellTrackRange != null) {
      final firstYOrigin =
          (size.height / grid.rows * cellTrackRange!.start.row).floorToDouble();
      final firstXOrigin =
          (size.width / grid.columns * cellTrackRange!.start.column)
              .floorToDouble();
      for (int i = 0; i < actions.length; i++) {
        final action = actions[i];

        if (i == 0 && action == Action.doNothing) {
          progressPath.moveTo(
              firstXOrigin + cellSize / 2, firstYOrigin + cellSize / 2);
          continue;
        }

        switch (action) {
          case Action.moveRight:
            progressPath.relativeLineTo(cellSize, 0);
          case Action.moveLeft:
            progressPath.relativeLineTo(-cellSize, 0);
          case Action.moveUp:
            progressPath.relativeLineTo(0, -cellSize);
          case Action.moveDown:
            progressPath.relativeLineTo(0, cellSize);
          case Action.doNothing:
        }
      }
    }

    return progressPath;
  }

  // for debugging purposes
  // ignore: unused_element
  void _paintProgressPath(Path path, Canvas canvas, HSLColor hue) {
    canvas.drawPath(
      path,
      Paint()
        ..color = hue.toColor()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = cellSize,
    );
  }

  void _paintWalker(Path path, Canvas canvas) {
    final pathMetrics = path.computeMetrics();

    for (final pathMetric in pathMetrics) {
      try {
        final extractPath =
            pathMetric.extractPath(0, pathMetric.length * progress);

        final metric = extractPath.computeMetrics().first;
        final tangent = metric.getTangentForOffset(metric.length)!;
        final offset = tangent.position;

        canvas.drawOval(
            Rect.fromCircle(center: offset, radius: cellSize * 1.5),
            Paint()
              ..style = PaintingStyle.fill
              ..color = Colors.orange);
      } catch (_) {}
    }
  }

  void _paintGrid(Canvas canvas, Size size) {
    for (int i = 0; i < grid.rows; i++) {
      for (int j = 0; j < grid.columns; j++) {
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
      }
    }
  }

  void _paintBlocks(Canvas canvas, Size size) {
    for (int i = 0; i < grid.rows; i++) {
      for (int j = 0; j < grid.columns; j++) {
        final state = grid.grid[i][j];

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

          HSLColor hue = HSLColor.fromAHSL(1, state.toDouble(), 1, 0.5);

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

    if (oldDelegate.grid != grid) return true;
    if (oldDelegate.cellSize != cellSize) return true;
    if (oldDelegate.progress != progress) return true;
    if (oldDelegate.cellTrackRange != cellTrackRange) return true;
    if (oldDelegate.actions != actions) return true;
    if (oldDelegate.showGrid != showGrid) return true;
    if (oldDelegate.showPath != showPath) return true;
    if (oldDelegate.showBlocks != showBlocks) return true;
    return false;
  }
}

class Grid<T extends Object> extends Equatable {
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

        if (filter(state)) cells.add(GridCell(row: i, column: j));
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

        if (filter(state)) return GridCell(row: i, column: j);
      }
    }
    return null;
  }

  Map<String, GridCell?> getNeighbourPositions(GridCell cell) {
    final neighbours = <String, GridCell?>{};

    if (validPosition(cell.above)) {
      neighbours['above'] = cell.above;
    } else {
      neighbours['above'] = null;
    }

    if (validPosition(cell.below)) {
      neighbours['below'] = cell.below;
    } else {
      neighbours['below'] = null;
    }

    if (validPosition(cell.left)) {
      neighbours['left'] = cell.left;
    } else {
      neighbours['left'] = null;
    }

    if (validPosition(cell.right)) {
      neighbours['right'] = cell.right;
    } else {
      neighbours['right'] = null;
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
