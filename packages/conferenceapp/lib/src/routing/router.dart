import 'package:devfest24/src/features/dashboard/presentation/screens/dashboard.dart';
import 'package:devfest24/src/features/more/presentation/presentation.dart';
import 'package:devfest24/src/features/onboarding/presentation/presentation.dart';
import 'package:devfest24/src/features/schedule/presentation/presentation.dart';
import 'package:devfest24/src/features/speakers/presentation/presentation.dart';

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
    return GoRouter(initialLocation: '/onboarding', routes: [
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
          GoRoute(
            path: Devfest2024Routes.onboardingSignature.path,
            name: Devfest2024Routes.onboardingSignature.name,
            builder: (context, state) => const OnboardingSignatureScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/',
        name: Devfest2024Routes.dashboard.name,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: Devfest2024Routes.speakerDetails.path,
            name: Devfest2024Routes.speakerDetails.name,
            builder: (context, state) => const SpeakerDetailsScreen(),
          ),
          GoRoute(
            path: Devfest2024Routes.scheduleDetails.path,
            name: Devfest2024Routes.scheduleDetails.name,
            builder: (context, state) => const ScheduleDetailsScreen(),
          ),
          GoRoute(
            path: Devfest2024Routes.profile.path,
            name: Devfest2024Routes.profile.name,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: Devfest2024Routes.myQrCode.path,
            name: Devfest2024Routes.myQrCode.name,
            builder: (context, state) => const MyQrCodeScreen(),
          ),
          GoRoute(
            path: Devfest2024Routes.venueMap.path,
            name: Devfest2024Routes.venueMap.name,
            builder: (context, state) => const VenueMapScreen(),
          ),
        ],
      ),
    ]);
  }
}
