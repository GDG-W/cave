import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cave/cave.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

typedef DetectScannedResultCallback = void Function(String qrResult);

class DevfestQrScanner extends StatefulWidget {
  const DevfestQrScanner({
    super.key,
    this.onControllerInitialised,
    required this.onDetect,
  });

  final DetectScannedResultCallback onDetect;
  final ValueSetter<MobileScannerController>? onControllerInitialised;

  @override
  State<DevfestQrScanner> createState() => _DevfestQrScannerState();
}

class _DevfestQrScannerState extends State<DevfestQrScanner>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final scannerController = MobileScannerController(autoStart: false);
  late AnimationController _controller;

  StreamSubscription<Object?>? _subscription;

  void _handleBarCode(BarcodeCapture barcode) {
    if (barcode.barcodes.isNotEmpty) {
      _controller.stop();
      unawaited(_subscription?.cancel());
      widget.onDetect(barcode.barcodes[0].rawValue ?? '');
      unawaited(scannerController.stop());
      _controller.reset();
    }
  }

  void _scannerControllerListener() {
    if (scannerController.value.isRunning) {
      _delayedStartAnimation();
    }
  }

  void _delayedStartAnimation() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      _controller.repeat(reverse: true);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    WidgetsBinding.instance.addObserver(this);
    _subscription = scannerController.barcodes.listen(_handleBarCode);
    unawaited(scannerController.start());
    _delayedStartAnimation();

    widget.onControllerInitialised?.call(scannerController);
    scannerController.addListener(_scannerControllerListener);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = scannerController.barcodes.listen(_handleBarCode);
        unawaited(scannerController.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(scannerController.stop());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    _controller.dispose();
    super.dispose();
    scannerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: MobileScanner(controller: scannerController)),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _DevfestScannerShape(
                  context: context,
                  progress: _controller.isAnimating ? _controller.value : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DevfestScannerShape extends CustomPainter {
  final double? progress;
  final BuildContext context;

  _DevfestScannerShape({required this.context, this.progress});

  final height = 307.h;
  final width = 306.w;
  final arcSize = 116.w;

  @override
  void paint(Canvas canvas, Size size) {
    // draw dark background with cutout
    final cutoutPadding = 10.w;
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(0, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, 0)
        ..close()
        ..moveTo(size.width / 2, size.height / 2)
        ..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              width: width - cutoutPadding,
              height: height - cutoutPadding,
              center: Offset(size.width / 2, size.height / 2.2),
            ),
            const Radius.circular(18),
          ),
        )
        ..close(),
      Paint()..color = Colors.black.withOpacity(0.5),
    );

    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2, size.height / 2.2)
        ..relativeMoveTo(-(width / 2) + arcSize, -(height / 2))
        ..relativeLineTo(-arcSize + 24, 0)
        ..relativeQuadraticBezierTo(-24, 0, -24, 24)
        ..relativeLineTo(0, arcSize - 24),
      Paint()
        ..color = DevfestColors.primariesYellow50
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );
    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2, size.height / 2.2)
        ..relativeMoveTo((width / 2) - arcSize, (height / 2))
        ..relativeLineTo(arcSize - 24, 0)
        ..relativeQuadraticBezierTo(24, 0, 24, -24)
        ..relativeLineTo(0, -arcSize + 24),
      Paint()
        ..color = DevfestColors.primariesRed50
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );
    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2, size.height / 2.2)
        ..relativeMoveTo((width / 2) - arcSize, -(height / 2))
        ..relativeLineTo(arcSize - 24, 0)
        ..relativeQuadraticBezierTo(24, 0, 24, 24)
        ..relativeLineTo(0, arcSize - 24),
      Paint()
        ..color = DevfestColors.primariesBlue50
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );
    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2, size.height / 2.2)
        ..relativeMoveTo(-(width / 2) + arcSize, (height / 2))
        ..relativeLineTo(-arcSize + 24, 0)
        ..relativeQuadraticBezierTo(-24, 0, -24, -24)
        ..relativeLineTo(0, -arcSize + 24),
      Paint()
        ..color = const Color(0xff34a853)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );

    late final TextPainter textPainter;
    if (progress == null) {
      textPainter = TextPainter(
        text: const TextSpan(
          text: 'Scan QR Code',
          style: TextStyle(
            color: DevfestColors.grey100,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
    } else {
      textPainter = TextPainter(
        text: const TextSpan(
          text: 'Scanning...',
          style: TextStyle(
            color: DevfestColors.grey100,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
    }

    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width / 2 - (textPainter.width / 2),
            (size.height / 2.2) - (height / 2 + 24) - 48.h));

    if (progress == null) {
      final infoSubtitleTextPainter = TextPainter(
        text: const TextSpan(
          text: 'Hold your camera at the\ndesignated QR Code',
          style: TextStyle(
            color: DevfestColors.grey100,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      infoSubtitleTextPainter.layout();

      infoSubtitleTextPainter.paint(
        canvas,
        Offset(size.width / 2 - infoSubtitleTextPainter.width / 2,
            (size.height / 2.2) + (height / 2 + 24) + 48.h),
      );
    } else {
      late TextPainter bottomInfoTextPainter;
      if (progress! < 0.6) {
        bottomInfoTextPainter = TextPainter(
          text: const TextSpan(
            text: 'Running from Geek\'s deadlines',
            style: TextStyle(
              color: DevfestColors.grey100,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        );
      } else {
        bottomInfoTextPainter = TextPainter(
          text: const TextSpan(
            text: 'Billing Ghost because',
            style: TextStyle(
              color: DevfestColors.grey100,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        );
      }

      bottomInfoTextPainter.layout();
      bottomInfoTextPainter.paint(
        canvas,
        Offset(
          size.width / 2 - (bottomInfoTextPainter.width / 2),
          size.height - 32.h - MediaQuery.viewPaddingOf(context).bottom,
        ),
      );
    }

    if (progress != null) {
      _drawScanOverlay(canvas, size, cutoutPadding, progress!);
    }
  }

  void _drawScanOverlay(
      Canvas canvas, Size size, double cutoutPadding, double progress) {
    double bottom = (size.height / 2.2 + height / 2 - cutoutPadding) -
        (height - cutoutPadding - 6.w) * progress;

    // bottom =
    //     bottom < (size.height / 2.2) ? bottom + (cutoutPadding * 2) : bottom;
    final scannerRect = Rect.fromCenter(
      center: Offset(size.width / 2, bottom),
      width: 272.w,
      height: 4.h,
    );
    canvas.drawRect(
      scannerRect,
      Paint()
        ..shader = LinearGradient(colors: [
          Colors.white.withOpacity(0),
          Colors.white,
          Colors.white.withOpacity(0),
        ]).createShader(scannerRect),
    );

    final hoverRect = Rect.fromCenter(
      center: Offset(size.width / 2, bottom + ((height / 2) * progress)),
      width: 248.w,
      height: height * progress,
    );
    canvas.drawRect(
      hoverRect,
      Paint()
        ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0)
            ]).createShader(hoverRect),
    );
  }

  @override
  bool shouldRepaint(_DevfestScannerShape oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
