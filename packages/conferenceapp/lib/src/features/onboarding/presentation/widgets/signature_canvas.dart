import 'package:flutter/material.dart';
import 'dart:math' as math;

class SignatureCanvas extends StatefulWidget {
  const SignatureCanvas({
    super.key,
    required this.stencilColor,
    this.onDrawSessionsChanged,
    required this.strokeWidth,
  });

  final Color stencilColor;
  final void Function(List<DrawSession> drawSessions)? onDrawSessionsChanged;
  final double strokeWidth;

  @override
  State<SignatureCanvas> createState() => _SignatureCanvasState();
}

class _SignatureCanvasState extends State<SignatureCanvas> {
  List<DrawSession> drawSessions = [];

  void _startDragSession(Offset point) {
    setState(() {
      drawSessions.add(
        DrawSession(
          (drawSessions.length + 1).toString(),
          [point],
          widget.stencilColor,
          strokeWidth: widget.strokeWidth,
        ),
      );
    });
    _onDrawSessionsChanged();
  }

  void _addPoint(Offset point) {
    setState(() {
      drawSessions.last.points.add(point);
    });
    _onDrawSessionsChanged();
  }

  void _endDragSession(Offset point) {
    setState(() {
      drawSessions.last.points.add(point);
    });
    _onDrawSessionsChanged();
  }

  void _onDrawSessionsChanged() {
    widget.onDrawSessionsChanged?.call(drawSessions);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _startDragSession(details.localPosition);
      },
      onPanUpdate: (details) {
        _addPoint(details.localPosition);
      },
      onPanEnd: (details) {
        _endDragSession(details.localPosition);
      },
      child: CustomPaint(
        painter: _SignaturePainter(drawSessions),
        size: Size.infinite,
      ),
    );
  }
}

final class DrawSession {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;
  final String id;

  const DrawSession(this.id, this.points, this.color, {this.strokeWidth = 5});
}

class _SignaturePainter extends CustomPainter {
  final List<DrawSession> drawSessions;

  const _SignaturePainter([this.drawSessions = const []]);

  @override
  void paint(Canvas canvas, Size size) {
    for (final drawSession in drawSessions) {
      final paint = Paint()
        ..color = drawSession.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = drawSession.strokeWidth;
      for (int i = 0; i < drawSession.points.length; i++) {
        // // start control point
        // if (i > 0) {
        //   final startControlPoint = controlPoint(
        //     drawSession.points[i - 1],
        //     drawSession.points.elementAtIndexOrNull(i - 2),
        //     drawSession.points[i],
        //   );
        //
        //   // end control point
        //   final endControlPoint = controlPoint(
        //     drawSession.points[i],
        //     drawSession.points.elementAtIndexOrNull(i - 1),
        //     drawSession.points.elementAtIndexOrNull(i + 1),
        //     true,
        //   );
        //
        //   canvas.drawPath(
        //     Path()
        //       ..moveTo(
        //           drawSession.points[i - 1].dx, drawSession.points[i - 1].dy)
        //       ..quadraticBezierTo(
        //         startControlPoint.dx,
        //         startControlPoint.dy,
        //         endControlPoint.dx,
        //         endControlPoint.dy,
        //       ),
        //     paint,
        //   );
        // }

        if (i > 0) {
          final pointA = drawSession.points[i - 1];
          final pointB = drawSession.points[i];

          canvas.drawLine(pointA, pointB, paint);
          continue;
        }

        canvas.drawLine(drawSession.points[i], drawSession.points[i], paint);
      }
    }
  }

  ({double length, double angle}) opposedLines(Offset pointA, Offset pointB) {
    final lengthX = pointB.dx - pointA.dx;
    final lengthY = pointB.dy - pointA.dy;
    final length = math.sqrt(math.pow(lengthX, 2) + math.pow(lengthY, 2));
    final angle = math.atan2(lengthY, lengthX);
    return (length: length, angle: angle);
  }

  Offset controlPoint(Offset current,
      [Offset? previous, Offset? next, bool reverse = false]) {
    final p = previous ?? current;
    final n = next ?? current;
    const smoothing = 0.2;
    final o = opposedLines(p, n);
    final angle = o.angle + (reverse ? math.pi : 0);
    final length = o.length * smoothing;
    final x = current.dx + math.cos(angle) * length;
    final y = current.dy + math.sin(angle) * length;
    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension<T extends Object> on List<T> {
  // ignore: unused_element
  T? elementAtIndexOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return elementAt(index);
  }
}
