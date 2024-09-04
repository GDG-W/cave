import 'package:cave/cave.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Filled Button', type: DevfestFilledButton)
Widget devfestFilledButton(BuildContext context) {
  return Material(
    color: DevFestTheme.of(context).backgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DevfestFilledButton(
          prefixIcon: const Icon(Icons.arrow_back),
          title: const Text('Content'),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestFilledButton(
          title: const Text('Content'),
          suffixIcon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestFilledButton(
          prefixIcon: const Icon(Icons.arrow_back),
          suffixIcon: const Icon(Icons.arrow_back),
          title: const Text('Content'),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestFilledButton(
          title: const Text('Content'),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestFilledButton(
          suffixIcon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Outlined Button', type: DevfestOutlinedButton)
Widget devfestOutlinedButton(BuildContext context) {
  return Material(
    color: DevFestTheme.of(context).backgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DevfestOutlinedButton(
          prefixIcon: const Icon(Icons.arrow_back),
          title: const Text('Content'),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestOutlinedButton(
          suffixIcon: const Icon(Icons.arrow_back),
          title: const Text('Content'),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestOutlinedButton(
          prefixIcon: const Icon(Icons.arrow_back),
          suffixIcon: const Icon(Icons.arrow_back),
          title: const Text('Content'),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestOutlinedButton(
          prefixIcon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        DevfestOutlinedButton(
          title: const Text('Content'),
          onPressed: () {},
        ),
      ],
    ),
  );
}
