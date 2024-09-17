import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'widgets.dart';

final class PathSvgParser {
  final List<DrawSession> drawSessions;
  final BoxConstraints canvasConstraints;

  PathSvgParser({required this.drawSessions, required this.canvasConstraints});

  Future<File?> parseAsFile() async {
    final svgDocument = parseAsString();
    if (svgDocument == null) return null;

    final tempSvgPath = await _getTemporarySvgDocumentPath();
    final svgFile = File(tempSvgPath);
    await svgFile.writeAsString(svgDocument);
    return svgFile;
  }

  String? parseAsString() {
    if (drawSessions.isEmpty) return null;

    final svgBuffer = StringBuffer();
    svgBuffer.writeln(
        '<svg xmlns="http://www.w3.org/2000/svg" width="${canvasConstraints.maxWidth}" height="${canvasConstraints.maxHeight}">');

    for (final session in drawSessions) {
      final rgbColor =
          'rgb(${session.color.red},${session.color.green},${session.color.blue})';
      svgBuffer.writeln(
        '<path id="${session.id}" d="${_pathDataFromSession(session)}" style="fill:none;stroke:$rgbColor;stroke-width:${session.strokeWidth};stroke-linejoin:round;stroke-linecap:round;"/>',
      );
    }

    svgBuffer.writeln('</svg>');
    return svgBuffer.toString();
  }

  String _pathDataFromSession(DrawSession session) {
    final pathBuffer = StringBuffer();

    for (int i = 0; i < session.points.length; i++) {
      final point = session.points[i];
      if (i == 0) {
        pathBuffer.write('M${point.dx} ${point.dy}');
      } else {
        pathBuffer.write(' L${point.dx} ${point.dy}');
      }
    }

    return pathBuffer.toString();
  }
}

Future<String> _getTemporarySvgDocumentPath() async {
  final tempStorage = await getTemporaryDirectory();
  final exPath = '${tempStorage.path}/devfest24_signature.svg';
  return exPath;
}
