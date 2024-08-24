import 'package:flutter/material.dart';

import 'typography.dart';

class DevFestTheme extends ThemeExtension<DevFestTheme> {
  /// Create and register new themes here
  final AppTextTheme? textTheme;

  static DevFestTheme of(BuildContext context) =>
      Theme.of(context).extension<DevFestTheme>()!;

  const DevFestTheme({this.textTheme});

  DevFestTheme.light() : this(textTheme: AppTextTheme.responsive());

  DevFestTheme.dark() : this(textTheme: AppTextTheme.responsive());

  @override
  DevFestTheme copyWith({AppTextTheme? textTheme}) {
    return DevFestTheme(textTheme: textTheme ?? this.textTheme);
  }

  @override
  DevFestTheme lerp(DevFestTheme? other, double t) {
    if (other is! DevFestTheme) return this;
    return DevFestTheme(textTheme: textTheme?.lerp(other.textTheme, t));
  }
}
