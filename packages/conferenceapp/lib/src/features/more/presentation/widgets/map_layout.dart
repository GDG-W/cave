import 'package:cave/cave.dart';

import 'map_block.dart';
import 'package:flutter/material.dart';

import '../map/map_utils.dart';

double cellSize = 5;

class MapLayoutDelegate extends MultiChildLayoutDelegate {
  final List<Block> blocks;
  final ValueChanged<List<BlockLayoutArea>>? onBlocksLayout;

  MapLayoutDelegate({
    this.blocks = const [],
    this.onBlocksLayout,
  });

  double _sumBlocHeightsToIndex(int index) {
    double sum = 0;
    for (int i = 0; i < index; i++) {
      sum += blocks[i].height;
    }
    return sum;
  }

  @override
  void performLayout(Size size) {
    final blockLayouts = <BlockLayoutArea>[];
    for (int i = 0; i < blocks.length; i++) {
      final block = blocks[i];
      final childId = i;
      final childSize = Size(block.width, block.height);
      final currentSize = layoutChild(childId, BoxConstraints.tight(childSize));

      final childOffset = Offset(
        block.position?.dx ?? 0,
        size.height -
            currentSize.height -
            (block.position?.dy ?? _sumBlocHeightsToIndex(i)),
      );

      blockLayouts.add(
        (
        room: RoomType.values[i],
        start: childOffset,
        end: Offset(childOffset.dx + currentSize.width,
            childOffset.dy + currentSize.height),
        hideFenceBorder: block.hideFenceBorder,
        openings: block.openingPositions
            .asMap()
            .map((index, openingPosition) {
          final startX = childOffset.dx + openingPosition.dx;
          final startY = childOffset.dy + openingPosition.dy;

          final openingSize =
              block.openingSizes.elementAtOrNull(index) ?? openingRadius;
          late Offset start;
          late Offset end;

          final blockStartFromEnd =
          (block.entranceLabel?.isNotEmpty ?? false) ? 25.0 : 0.0;
          // if is at left edge
          if (openingPosition.dx == 0) {
            start = Offset(startX, startY);
            end = Offset(startX, startY + openingSize);
          } // if is at right edge
          else if (openingPosition.dx - blockStartFromEnd ==
              block.width) {
            start = Offset(startX, startY);
            end = Offset(startX, startY + openingSize);
          } // if is at top edge
          else if (openingPosition.dy == 0) {
            start = Offset(startX - blockStartFromEnd, startY);
            end =
                Offset(startX + openingSize - blockStartFromEnd,
                    startY);
          } // if is at bottom edge
          else {
            start =
                Offset(startX - blockStartFromEnd, startY - cellSize.w);
            end = Offset(
                startX + openingSize - blockStartFromEnd, startY - cellSize.w);
          }

          return MapEntry(index, (start: start, end: end));
        })
            .values
            .toList(),
        ),
      );

      positionChild(childId, childOffset);
    }

    onBlocksLayout?.call(blockLayouts);
  }

  @override
  bool shouldRelayout(MapLayoutDelegate oldDelegate) {
    return oldDelegate.blocks != blocks;
  }
}
