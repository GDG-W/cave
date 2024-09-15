import 'package:cave/cave.dart';
import 'package:devfest24/src/features/more/presentation/widgets/map_layout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum HideFenceBorder {
  none,
  top,
  right,
  bottom,
  left,
  all;
}

final class Block extends Equatable {
  final double width;
  final double height;
  final HideFenceBorder hideFenceBorder;
  final String? entranceLabel;
  final TextStyle? entranceLabelStyle;
  final String blockLabel;
  final TextStyle? blockLabelStyle;
  final Color? blockColor;
  final Offset? position;
  final List<Offset> openingPositions;
  final List<double?> openingSizes;

  const Block({
    this.width = 100,
    this.height = 100,
    this.hideFenceBorder = HideFenceBorder.none,
    this.entranceLabel,
    this.entranceLabelStyle,
    required this.blockLabel,
    this.blockLabelStyle,
    this.blockColor,
    this.position,
    this.openingPositions = const [],
    this.openingSizes = const [],
  });

  factory Block.fromContext(
    BuildContext context, {
    double width = 100,
    double height = 100,
    HideFenceBorder hideFenceBorder = HideFenceBorder.none,
    String? entranceLabel,
    TextStyle? entranceLabelStyle,
    required String blockLabel,
    TextStyle? blockLabelStyle,
    Color? blockColor,
    Offset? position,
    List<Offset> openingPositions = const [],
    List<double?> openingSizes = const [],
  }) {
    return Block(
      entranceLabel: entranceLabel,
      blockLabel: blockLabel,
      blockColor: blockColor,
      height: height,
      width: width,
      hideFenceBorder: hideFenceBorder,
      entranceLabelStyle: DevfestTheme.of(context)
          .textTheme
          ?.bodyBody4Regular
          ?.medium
          .merge(entranceLabelStyle),
      blockLabelStyle: DevfestTheme.of(context)
          .textTheme
          ?.bodyBody2Regular
          ?.semi
          .merge(blockLabelStyle),
      position: position,
      openingPositions: openingPositions,
      openingSizes: openingSizes,
    );
  }

  @override
  List<Object?> get props => [
        width,
        height,
        hideFenceBorder,
        entranceLabel,
        entranceLabelStyle,
        blockLabel,
        blockLabelStyle,
        blockColor,
        position,
        openingPositions,
        openingSizes,
      ];
}

typedef BlockLayoutArea = ({
  RoomType room,
  Offset start,
  Offset end,
  HideFenceBorder hideFenceBorder,
  List<({Offset start, Offset end})> openings,
});

enum RoomType {
  exhibitionRoom,
  room1,
  room2,
  hallway,
  toilet,
  stairs,
  room3,
  room4;

  const RoomType();

  List<RoomType> get directionInstructions => switch (this) {
        RoomType.exhibitionRoom => [RoomType.room1],
        RoomType.room1 => [RoomType.exhibitionRoom, RoomType.room2],
        RoomType.room2 => [RoomType.room1, RoomType.hallway],
        RoomType.hallway => [RoomType.room2, RoomType.toilet, RoomType.stairs],
        RoomType.toilet => [RoomType.hallway],
        RoomType.stairs => [RoomType.hallway, RoomType.room3, RoomType.room4],
        RoomType.room3 => [RoomType.stairs],
        RoomType.room4 => [RoomType.stairs],
      };
}

// DFS algorithm to get the directions from one room to another
List<RoomType> getOverviewDirections(RoomType start, RoomType end) {
  final adj = <RoomType>{};

  adj.add(_getNextDirection(start, end, <RoomType>{}, adj));

  return adj.toList();
}

RoomType _getNextDirection(
    RoomType next, RoomType end, Set<RoomType> visited, Set<RoomType> adj) {
  if (next == end) return next;

  visited.add(next);
  adj.add(next);

  final nextBlockDirections = next.directionInstructions.toList()
    ..removeWhere((element) => element == next || visited.contains(element));

  // backtrack
  if (nextBlockDirections.isEmpty) {
    adj.remove(next);
    return _getNextDirection(adj.last, end, visited, adj);
  }

  late RoomType nextDirection;
  for (final direction in nextBlockDirections) {
    if (direction == end) {
      return direction;
    }

    if (direction.directionInstructions.length == 1 &&
        direction.directionInstructions.first == next) {
      nextDirection = direction;
      continue;
    }

    if (!visited.contains(direction)) {
      return _getNextDirection(direction, end, visited, adj);
    }
  }

  return _getNextDirection(nextDirection, end, visited, adj);
}

extension BlockLayouts on List<BlockLayoutArea> {
  BlockLayoutArea getRoomLayout(RoomType room) {
    return firstWhere((layout) => layout.room == room);
  }

  String printLayout() {
    final buffer = StringBuffer();
    for (final layout in this) {
      buffer.write('Room: ${layout.room}\t');
      buffer.write('Start: ${layout.start}\t');
      buffer.writeln('End: ${layout.end}');
      buffer.write(
        'Start GridCell(row: ${(layout.start.dy / cellSize).floor()}, column: ${(layout.start.dx / cellSize).floor()})\t',
      );
      buffer.writeln(
        'End GridCell(row: ${(layout.end.dy / cellSize).floor()}, column: ${(layout.end.dx / cellSize).floor()})',
      );
    }
    return buffer.toString();
  }
}
