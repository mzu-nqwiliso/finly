import 'package:finly/app/router/route_names.dart';
import 'package:finly/app/theme/app_colors.dart';
import 'package:finly/app/theme/app_dimensions.dart';
import 'package:finly/app/theme/app_text_styles.dart';
import 'package:finly/core/constants/app_assets.dart';
import 'package:finly/core/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteErrorScreen extends StatelessWidget {
  const RouteErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppAssets.appBackground, fit: BoxFit.cover),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppDimensions.screenPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 56,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: AppDimensions.spacing24),
                    Text(
                      'We hit a snag',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineMedium,
                    ),
                    const SizedBox(height: AppDimensions.spacing8),
                    Text(
                      'This page could not be opened. You can return to onboarding or go straight to sign in.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: AppDimensions.spacing32),
                    AppButton(
                      label: 'Back to onboarding',
                      onPressed: () => context.goNamed(RouteNames.onboardingScreen),
                      borderRadius: AppDimensions.radiusFull,
                    ),
                    const SizedBox(height: AppDimensions.spacing12),
                    TextButton(
                      onPressed: () => context.goNamed(RouteNames.authScreen),
                      child: Text(
                        'Go to sign in',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
