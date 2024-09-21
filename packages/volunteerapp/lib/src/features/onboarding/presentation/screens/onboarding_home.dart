import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:volunteerapp/src/routing/routing.dart';
import 'package:volunteerapp/src/shared/shared.dart';

class _PreferredDevfestAppBarSize extends Size {
  _PreferredDevfestAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class DevfestAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DevfestAppBar({super.key});

  @override
  State<DevfestAppBar> createState() => _DevfestAppBarState();

  @override
  Size get preferredSize => _PreferredDevfestAppBarSize(kToolbarHeight, 0);
}

class _DevfestAppBarState extends State<DevfestAppBar> {
  SystemUiOverlayStyle _systemOverlayStyleForBrightness(Brightness brightness,
      [Color? backgroundColor]) {
    final SystemUiOverlayStyle style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarBrightness: style.statusBarBrightness,
      statusBarIconBrightness: style.statusBarIconBrightness,
      systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final SystemUiOverlayStyle overlayStyle = appBarTheme.systemOverlayStyle ??
        _systemOverlayStyleForBrightness(
          ThemeData.estimateBrightnessForColor(theme.scaffoldBackgroundColor),
          theme.useMaterial3 ? const Color(0x00000000) : null,
        );
    return SafeArea(
      bottom: false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Semantics(
          explicitChildNodes: true,
          child: Row(
            children: [
              SvgPicture.asset(
                'images/logo.svg',
                package: 'cave',
                width: 16,
                height: 29,
                semanticsLabel: 'Acme Logo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingHomeScreen extends StatelessWidget {
  const OnboardingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset(
          'images/logo.svg',
          package: 'cave',
          width: 16,
          height: 29,
          semanticsLabel: 'Acme Logo',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalMargin.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(
              title: Text('Get attendees checked in faster than before'),
              subtitle: Text(
                'Hey rockstar volunteer, we have made attendees check in more convenient for you.',
              ),
            ),
            SizedBox(height: (Constants.largeVerticalGutter * 3).h),
            DevfestFilledButton(
              onPressed: () {
                context.goNamed(Devfest2024Routes.onboardingLogin.name);
              },
              title: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
