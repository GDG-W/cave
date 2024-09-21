import 'package:cave/cave.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:volunteerapp/src/routing/routing.dart';

extension DevfestColorsX on Color {
  ///  utility extension used on colors when prototyping from light-mode
  ///  converts colors passed in light mode to their respective dark-mode
  ///  variants
  Color get possibleDarkVariant {
    final context = Devfest2024Router.rootNavigatorKey.currentContext;
    if (context == null) return this;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (isDarkMode) {
      return switch (this) {
        DevfestColors.grey40 || DevfestColors.grey60 => DevfestColors.grey70,
        DevfestColors.grey10 => DevfestColors.backgroundLight,
        // DevfestColors.grey50 =>
        DevfestColors.primariesYellow90 => DevfestColors.grey40,
        DevfestColors.primariesYellow100 => DevfestColors.backgroundDark,
        _ => this,
      };
    }

    return this;
  }
}

extension NumberFormatExtension on num {
  String get formattedWithDecimalPattern =>
      NumberFormat.decimalPattern().format(this);
}
