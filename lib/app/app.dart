import 'package:finly/app/router/app_router.dart';
import 'package:flutter/material.dart';

class FinalyApp extends StatelessWidget {
  const FinalyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finly',
      routerConfig: appRouter,
    );
  }
}
