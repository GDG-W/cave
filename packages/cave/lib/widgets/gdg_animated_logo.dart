import 'dart:math';

import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

class GdgLogo extends StatefulWidget {
  const GdgLogo({super.key, required this.width, required this.height});

  final double width;
  final double height;

  GdgLogo.normal({Key? key}) : this(width: 44.w, height: 20.w, key: key);

  @override
  State<GdgLogo> createState() => _GdgLogoState();
}

class _GdgLogoState extends State<GdgLogo> with SingleTickerProviderStateMixin {
  List<Color> pillColors = [
    DevfestColors.primariesRed50,
    DevfestColors.primariesGreen50,
    DevfestColors.primariesBlue50,
    DevfestColors.primariesYellow50
  ];

  late AnimationController _controller;
  late Animation<double> _angleAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _angleAnim = Tween<double>(begin: 0, end: pi / 5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 1, curve: Curves.elasticInOut),
      ),
    );

    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.4, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnim,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 1,
                  child: Transform.rotate(
                    angle: -_angleAnim.value,
                    child: _logoPill(DevfestColors.primariesRed50),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 0,
                  child: Transform.rotate(
                    angle: _angleAnim.value,
                    child: _logoPill(DevfestColors.primariesBlue50),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 1,
                  child: Transform.rotate(
                    angle: _angleAnim.value,
                    child: _logoPill(DevfestColors.primariesGreen50),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 1,
                  child: Transform.rotate(
                    angle: -_angleAnim.value,
                    child: _logoPill(DevfestColors.primariesYellow50),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _logoPill(Color color) {
    return Material(
      color: color,
      shape: StadiumBorder(
        side: BorderSide(
            color:
                DevfestTheme.of(context).textTheme?.bodyBody2Regular?.color ??
                    DevfestColors.grey100,
            width: 0.8),
      ),
      child: SizedBox(width: widget.width/ 2, height: widget.height/2 ),
    );
  }
}
