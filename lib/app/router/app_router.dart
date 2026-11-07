import 'package:finly/app/router/route_names.dart';
import 'package:finly/app/router/route_paths.dart';
import 'package:finly/features/splash/presentation/screens/splash_screen.dart';
import 'package:finly/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:finly/features/authentication/presentation/screens/auth_screen.dart';
import 'package:finly/features/error/presentation/screens/route_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.splashScreen,
  errorBuilder: (context, state) => const RouteErrorScreen(),
  routes: [
    GoRoute(
      name: RouteNames.splashScreen,
      path: RoutePaths.splashScreen,
      pageBuilder: (context, state) =>
          NoTransitionPage(key: state.pageKey, child: const SplashScreen()),
    ),
    GoRoute(
      name: RouteNames.onboardingScreen,
      path: RoutePaths.onboardingScreen,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const OnboardingScreen(),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: RouteNames.authScreen,
      path: RoutePaths.authScreen,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AuthScreen(),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          );
        },
      ),
    ),
  ],
);
