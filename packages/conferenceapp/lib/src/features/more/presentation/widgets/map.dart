import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

import 'map_block.dart';

class LandmarkMap extends StatefulWidget {
  const LandmarkMap({super.key, required this.mapConstraints});

  final BoxConstraints mapConstraints;

  @override
  State<LandmarkMap> createState() => _LandmarkMapState();
}

class _LandmarkMapState extends State<LandmarkMap> {
  late final mapSchematics = [
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth,
      height: 103.h,
      hideFenceBorder: HideFenceBorder.right,
      entranceLabel: 'ENTRANCE',
      blockLabel: 'Exhibition Room',
      blockColor: const Color(0xffb6b0dd),
      openingPositions: [
        Offset(widget.mapConstraints.maxWidth - 333, 0),
        Offset(widget.mapConstraints.maxWidth - 79, 0),
      ],
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth,
      height: 103.h,
      hideFenceBorder: HideFenceBorder.right,
      entranceLabel: 'ENTRANCE',
      blockLabel: 'Room 1',
      blockColor: const Color(0xffffd3bf),
      openingPositions: [
        Offset(widget.mapConstraints.maxWidth - 79, 103.h),
        Offset(widget.mapConstraints.maxWidth - 333, 103.h),
        Offset(widget.mapConstraints.maxWidth - 79, 0),
      ],
    ),
    Block.fromContext(
      context,
      width: widget.mapConstraints.maxWidth,
      height: 103.h,
      hideFenceBorder: HideFenceBorder.right,
      entranceLabel: 'Exit',
      blockLabel: 'Room 2',
      blockColor: const Color(0xff88cd83),
      openingPositions: [
        Offset(widget.mapConstraints.maxWidth - 79, 103.h),
        Offset(widget.mapConstraints.maxWidth - 96, 0),
      ],
    ),
    Block.fromContext(
      context,
      width: 33.w,
      height: 147.h,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'HALLWAY',
      blockLabelStyle:
          DevfestTheme.of(context).textTheme?.bodyBody4Regular?.medium,
      blockColor: const Color(0xffd9d0c3),
      position: Offset(280.w, 103.h * 3),
    ),
    Block.fromContext(
      context,
      width: 77.w,
      height: 70.h,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'Toilet',
      blockColor: const Color(0xffbee673),
      position: Offset(313.w, 103.h * 3 + 32.h),
    ),
    Block.fromContext(
      context,
      width: 139.w,
      height: 45.h,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'Room 3',
      blockColor: const Color(0xffbee673),
      position: Offset(22.w, 103.h * 3 + 57.h),
    ),
    Block.fromContext(
      context,
      width: 258.w,
      height: 45.h,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'STAIRWAY',
      blockLabelStyle:
          DevfestTheme.of(context).textTheme?.bodyBody4Regular?.medium,
      blockColor: const Color(0xffd9d9d9),
      position: Offset(22.w, 103.h * 3 + 102.h),
    ),
    Block.fromContext(
      context,
      width: 139.w,
      height: 45.h,
      hideFenceBorder: HideFenceBorder.all,
      blockLabel: 'Room 4',
      blockColor: const Color(0xffbbddc9),
      position: Offset(22.w, 103.h * 3 + 147.h),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Color(0xfffffaeb)),
      child: CustomMultiChildLayout(
        delegate: MapLayoutDelegate(blocks: mapSchematics),
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
}
