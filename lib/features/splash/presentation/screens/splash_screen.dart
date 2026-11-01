import 'package:finly/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:finly/app/router/route_names.dart';
import  'package:finly/app/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _exitController;
  late final Animation<double> _opacity;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _exitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    final curved = CurvedAnimation(
      parent: _exitController,
      curve: Curves.easeInOut,
    );

    _opacity = Tween<double>(begin: 1, end: 0).animate(curved);
    _scale = Tween<double>(begin: 1, end: 0.8).animate(curved);

    _start();
  }

  Future<void> _start() async {
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 3000)),
      _initializeApp(),
    ]);
    if (!mounted) return;

    await _exitController.forward();
    if (!mounted) return;

    context.goNamed(RouteNames.onboardingScreen);
  }

  Future<void> _initializeApp() async {
    await Future.delayed(Duration.zero);
  }

  @override
  void dispose() {
    _exitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF111313),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.appBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: FadeTransition(
              opacity: _opacity,
              child: ScaleTransition(
                scale: _scale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.finlyLogo,
                      width: 124,
                      height: 54,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(height: 24),
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        color: AppColors.primary, // match your brand purple
                        backgroundColor: AppColors.background, // faint track
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}