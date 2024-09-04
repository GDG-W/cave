import 'package:cave/cave.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'DevFest Bottom Nav',
  type: DevfestBottomNav,
)
Widget devfestBottomNav(BuildContext context) {
  int index = 0;
  return StatefulBuilder(builder: (context, setState) {
    return Scaffold(
      backgroundColor: DevfestTheme.of(context).backgroundColor,
      bottomNavigationBar: DevfestBottomNav(
        index: index,
        items: const [
          DevfestBottomNavItem(
            label: 'Home',
            icon: Icon(IconsaxOutline.home_2),
          ),
          DevfestBottomNavItem(
            label: 'Schedule',
            icon: Icon(IconsaxOutline.calendar_1),
          ),
          DevfestBottomNavItem(
            label: 'Speakers',
            icon: Icon(IconsaxOutline.microphone),
          ),
          DevfestBottomNavItem(
            label: 'Reserve',
            icon: Icon(IconsaxOutline.ticket),
          ),
          DevfestBottomNavItem(
            label: 'More',
            icon: Icon(IconsaxOutline.more_square),
          ),
        ],
        onTap: (page) {
          setState(() => index = page);
        },
      ),
    );
  });
}
