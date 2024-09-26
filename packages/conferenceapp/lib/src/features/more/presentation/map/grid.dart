import 'dart:core';
import 'dart:math';
import 'dart:ui';

import 'package:cave/cave.dart';
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
    this.onWalkerPosition,
  });

  final Grid<int> grid;
  final double cellSize;
  final double progress;
  final GridCellRange? cellTrackRange;
  final List<Action> actions;
  final bool showGrid;
  final bool showPath;
  final bool showBlocks;
  final void Function(Offset walkerPostion, double angle)? onWalkerPosition;

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
        final extractPath = pathMetric.extractPath(
            0, pathMetric.length * progress,
            startWithMoveTo: false);

        final tangent = _computeTangentForPath(extractPath);
        final offset = tangent.position;

        canvas.save();
        canvas.translate(offset.dx, offset.dy);

        double rotationAngle = tangent.angle.abs() - pi / 2;

        final isOnXAxis = rotationAngle == pi / 2 || rotationAngle == -pi / 2;

        if (isOnXAxis) {
          rotationAngle = rotationAngle - pi;
        } else {
          // if the tangent angle is -90, then the rotation angle should be 180
          if (_getDegFromRad(tangent.angle) == -90) {
            rotationAngle = pi;
          }
        }

        onWalkerPosition?.call(offset, rotationAngle);
        canvas.rotate(rotationAngle);

        _walker(canvas, Size(cellSize * 1.5, cellSize * 1.5));
        if (!isOnXAxis) {
          canvas.translate(0, cellSize / 2);
        }

        Matrix4 matrix4 = Matrix4.identity();
        matrix4.scale(-1.0, 1.0);
        canvas.transform(matrix4.storage);
        _walker(canvas, Size(cellSize * 1.5, cellSize * 1.5));

        canvas.restore();
        // canvas.drawOval(
        //     Rect.fromCircle(center: offset, radius: cellSize * 1.5),
        //     Paint()
        //       ..style = PaintingStyle.fill
        //       ..color = Colors.orange);
      } catch (_) {}
    }
  }

  void _walker(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3759985, size.height * 0.4896138);
    path_0.cubicTo(
        size.width * 0.4655944,
        size.height * 0.5371670,
        size.width * 0.5076371,
        size.height * 0.6434983,
        size.width * 0.4776357,
        size.height * 0.7412578);
    path_0.cubicTo(
        size.width * 0.4721253,
        size.height * 0.7588096,
        size.width * 0.4672271,
        size.height * 0.7769737,
        size.width * 0.4633494,
        size.height * 0.7951377);
    path_0.cubicTo(
        size.width * 0.4474303,
        size.height * 0.8767741,
        size.width * 0.4688598,
        size.height * 0.9792276,
        size.width * 0.5586598,
        size.height * 0.9973917);
    path_0.cubicTo(
        size.width * 0.6039679,
        size.height * 1.006984,
        size.width * 0.6490720,
        size.height * 0.9894322,
        size.width * 0.6809102,
        size.height * 0.9561654);
    path_0.cubicTo(
        size.width * 0.7758124,
        size.height * 0.8530995,
        size.width * 0.7468315,
        size.height * 0.5426774,
        size.width * 0.7460151,
        size.height * 0.4649188);
    path_0.cubicTo(
        size.width * 0.7460151,
        size.height * 0.4308357,
        size.width * 0.7451988,
        size.height * 0.3959361,
        size.width * 0.7317288,
        size.height * 0.3640980);
    path_0.cubicTo(
        size.width * 0.7015233,
        size.height * 0.2926662,
        size.width * 0.6166216,
        size.height * 0.2640935,
        size.width * 0.5413121,
        size.height * 0.2442967);
    path_0.cubicTo(
        size.width * 0.4176330,
        size.height * 0.1991926,
        size.width * 0.3396704,
        size.height * 0.2561339,
        size.width * 0.3135467,
        size.height * 0.2981767);
    path_0.cubicTo(
        size.width * 0.2874231,
        size.height * 0.3402194,
        size.width * 0.2684427,
        size.height * 0.4336929,
        size.width * 0.3759985,
        size.height * 0.4896138);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = DevfestColors.primariesBlue70.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = DevfestColors.primariesBlue70.withOpacity(1.0);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.2894640, size.height * 0.09041222),
            width: size.width * 0.1285772,
            height: size.height * 0.1808244),
        paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = DevfestColors.primariesBlue70.withOpacity(1.0);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.4380421, size.height * 0.1055149),
            width: size.width * 0.07632996,
            height: size.height * 0.1077599),
        paint2Fill);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = DevfestColors.primariesBlue70.withOpacity(1.0);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.5570271, size.height * 0.1387817),
            width: size.width * 0.06816633,
            height: size.height * 0.09510631),
        paint3Fill);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = DevfestColors.primariesBlue70.withOpacity(1.0);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.6656034, size.height * 0.1667422),
            width: size.width * 0.06041088,
            height: size.height * 0.08408541),
        paint4Fill);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = DevfestColors.primariesBlue70.withOpacity(1.0);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.7473805, size.height * 0.2229039),
            width: size.width * 0.07469723,
            height: size.height * 0.05387997),
        paint5Fill);
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

  Tangent _computeTangentForPath(Path path) {
    final metric = path.computeMetrics().first;
    return metric.getTangentForOffset(metric.length)!;
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

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

double _getDegFromRad(double radians) {
  return radians * (180 / pi);
}

double getRadFromDeg(double angle) {
  return angle * (pi / 180);
}
