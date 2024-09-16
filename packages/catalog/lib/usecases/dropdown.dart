import 'package:cave/cave.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

List<String> locations = [
  "Exhibition Room",
  "Room 1",
  "Room 2",
  "Room 3",
  "Hallway",
  "Toilet",
  "Stairway",
  "Room 4",
];

@widgetbook.UseCase(
  name: 'DevFest Dropdown',
  type: DevfestDropDown,
  designLink:
      "https://www.figma.com/design/CMEZj7OPDW09hOuTg1tAgF/DevFest-Lagos-'24---Mobile-App.?node-id=5457-8141&node-type=FRAME&t=13HTMdJAt4XcDqvU-0",
)
Widget devfestDropdown(BuildContext context) {
  String? currentLocation;
  String? destination;
  return StatefulBuilder(builder: (context, setState) {
    return Scaffold(
      backgroundColor: DevfestTheme.of(context).backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DevfestDropDown<String>(
                items: locations,
                selectedItem: currentLocation,
                onChanged: (value) {
                  currentLocation = value;
                  setState(() {});
                },
                title: 'Where are you in Landmark?',
                hint: 'Current location',
                prefixIcon: const Icon(IconsaxOutline.location),
                suffixIcon: const Icon(IconsaxOutline.arrow_down_1),
              ),
              const SizedBox(height: 16),
              DevfestDropDown<String>(
                items: locations,
                selectedItem: destination,
                onChanged: (value) {
                  destination = value;
                  setState(() {});
                },
                title: 'Where are you headed?',
                hint: 'Desired destination',
                prefixIcon: const Icon(IconsaxOutline.location_tick),
                suffixIcon: const Icon(IconsaxOutline.arrow_down_1),
              ),
            ],
          ),
        ),
      ),
    );
  });
}
