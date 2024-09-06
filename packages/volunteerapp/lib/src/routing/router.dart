
import 'package:volunteerapp/src/features/home/presentation/screens/home_screen.dart';
import 'package:volunteerapp/src/features/onboarding/presentation/screens/onboarding_home.dart';
import 'package:volunteerapp/src/features/onboarding/presentation/screens/onboarding_login.dart';

import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Devfest2024Router {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  Devfest2024Router._();

  static final Devfest2024Router instance = Devfest2024Router._();

  void initialiseRouter(WidgetRef ref) {
    router = _getRouter(ref);
  }

  late GoRouter router;

  GoRouter _getRouter(WidgetRef ref) {
    return GoRouter(
        navigatorKey: rootNavigatorKey,
        initialLocation: '/onboarding',
        routes: [
          GoRoute(
            path: '/${Devfest2024Routes.onboardingHome.path}',
            name: Devfest2024Routes.onboardingHome.name,
            builder: (context, state) => const OnboardingHomeScreen(),
            routes: [
              GoRoute(
                path: Devfest2024Routes.onboardingLogin.path,
                name: Devfest2024Routes.onboardingLogin.name,
                builder: (context, state) => const OnboardingLoginScreen(),
              ),
              
            ],
          ),
          GoRoute(
            path: '/',
            name: Devfest2024Routes.home.name,
            builder: (context, state) => const HomeScreen(),
            
          ),
        ]);
  }
}
