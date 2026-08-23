import 'package:finly/app/router/route_names.dart';
import 'package:finly/app/router/route_paths.dart';
import 'package:finly/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.splashScreen,
  routes: [
    GoRoute(
      name: RouteNames.splashScreen,
      path: RoutePaths.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
