import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../cave.dart';

class DevfestBottomNav extends StatefulWidget {
  const DevfestBottomNav({
    super.key,
    required this.index,
    required this.onTap,
    required this.items,
    this.selectedColor,
    this.unselectedColor,
    this.labelStyle,
    this.decorationColor,
    this.borderColor,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.backgroundColor,
  });

  final ValueChanged<int> onTap;
  final int index;
  final List<DevfestBottomNavItem> items;
  final Color? selectedColor;
  final Color? unselectedColor;
  final TextStyle? labelStyle;
  final Color? decorationColor;
  final Color? borderColor;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final Color? backgroundColor;

  @override
  State<DevfestBottomNav> createState() => _DevfestBottomNavState();
}

class _DevfestBottomNavState extends State<DevfestBottomNav> {
  @override
  Widget build(BuildContext context) {
    final additionalBottomPadding = MediaQuery.viewPaddingOf(context).bottom;
    return DevfestTheme(
      data: DevFestTheme.of(context).copyWith(
        bottomNavTheme: DevFestTheme.of(context).bottomNavTheme?.copyWith(
              labelStyle: widget.labelStyle,
              selectedColor: widget.selectedColor,
              unselectedColor: widget.unselectedColor,
              decoration: widget.decorationColor,
              borderColor: widget.borderColor,
              selectedIconColor: widget.selectedIconColor,
              unselectedIconColor: widget.unselectedIconColor,
              backgroundColor: widget.backgroundColor,
            ),
      ),
      child: Container(
        height: 88 + additionalBottomPadding,
        padding: EdgeInsets.only(bottom: additionalBottomPadding),
        decoration: BoxDecoration(
          color: DevFestTheme.of(context).bottomNavTheme?.backgroundColor,
          border: Border(
            top: BorderSide(
                color: DevFestTheme.of(context).bottomNavTheme?.borderColor ??
                    const Color(0xFF000000),
                width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            widget.items.length,
            (index) => _DevfestBottomNavTile(
              icon: widget.items[index].icon,
              inactiveIcon: widget.items[index].inactiveIcon,
              label: widget.items[index].label,
              selected: widget.index == index,
              onTap: () {
                HapticFeedback.lightImpact();
                widget.onTap.call(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DevfestBottomNavItem {
  final String label;
  final Widget icon;
  final Widget? inactiveIcon;

  const DevfestBottomNavItem({
    required this.label,
    required this.icon,
    this.inactiveIcon,
  });
}

class _DevfestBottomNavTile extends StatelessWidget {
  const _DevfestBottomNavTile({
    required this.icon,
    required this.label,
    this.selected = false,
    this.inactiveIcon,
    required this.onTap,
  });

  final String label;
  final Widget icon;
  final bool selected;
  final VoidCallback onTap;
  final Widget? inactiveIcon;

  @override
  Widget build(BuildContext context) {
    final bottomNavItemTheme = DevFestTheme.of(context).bottomNavTheme ??
        const DevfestBottomNavTheme.light();

    final itemColor = selected
        ? bottomNavItemTheme.selectedColor
        : bottomNavItemTheme.unselectedColor;
    final iconColor = selected
        ? bottomNavItemTheme.selectedIconColor
        : bottomNavItemTheme.unselectedIconColor;
    final decorationColor = bottomNavItemTheme.decoration;
    return InkWell(
      onTap: onTap,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: bottomNavItemTheme.labelStyle.copyWith(color: itemColor),
        child: IconTheme(
          data: IconThemeData(size: 24, color: iconColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: selected
                    ? Column(
                        key: const Key('selected icon'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 36,
                            width: 56,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56),
                              ),
                              color: decorationColor,
                            ),
                            alignment: Alignment.center,
                            child: icon,
                          ),
                          const SizedBox(height: 2),
                        ],
                      )
                    : Column(
                        key: const Key('unselected icon'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 36,
                            width: 56,
                            alignment: Alignment.center,
                            child: inactiveIcon ?? icon,
                          ),
                          const SizedBox(height: 2),
                        ],
                      ),
              ),
              Text(
                label,
                style: bottomNavItemTheme.labelStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
