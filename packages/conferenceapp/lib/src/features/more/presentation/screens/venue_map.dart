import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class VenueMapScreen extends StatelessWidget {
  const VenueMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        leadingWidth: 120.w,
      ),
    );
  }
}
