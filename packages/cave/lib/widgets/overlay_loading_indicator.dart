import 'package:flutter/material.dart';

import '../cave.dart';

class OverlayScreenLoadingIndicator extends StatelessWidget {
  const OverlayScreenLoadingIndicator({
    super.key,
    this.isLoading = false,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        if (isLoading)
          Positioned.fill(
            child: Container(
              color:
                  DevfestTheme.of(context).onBackgroundColor?.withOpacity(0.4),
              alignment: Alignment.center,
              child: GdgLogo(
                repeat: true,
                width: 60.w,
                height: 28.w,
              ),
            ),
          ),
      ],
    );
  }
}
