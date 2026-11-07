import 'package:finly/app/theme/app_colors.dart';
import 'package:finly/app/theme/app_dimensions.dart';
import 'package:finly/app/theme/app_text_styles.dart';
import 'package:finly/core/constants/app_assets.dart';
import 'package:finly/core/widgets/buttons/app_icon_button.dart';
import 'package:finly/app/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.onboardingBg),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.screenPadding,
                          vertical: AppDimensions.spacing16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(flex: 4),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                AppAssets.onboardingImage1,
                                width: 150,
                                height: 120,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: AppDimensions.spacing32),

                            RichText(
                              text: TextSpan(
                                style: AppTextStyles.displayMedium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'Take care ',
                                    style: AppTextStyles.displayMedium,
                                  ),
                                  TextSpan(
                                    text: 'of ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Your\nFinances Today!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: AppDimensions.spacing8),

                            Text(
                              'Understand your spending, build better money '
                              'habits, and take control of your finances.',
                              style: AppTextStyles.bodySmall.copyWith(
                                height: 1.5,
                              ),
                            ),

                            const Spacer(flex: 3),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Get started',
                                  style: AppTextStyles.labelLarge,
                                ),

                                AppIconButton(
                                  icon: Icons.arrow_forward_rounded,
                                  onPressed: () =>
                                      context.goNamed(RouteNames.authScreen),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimensions.spacing12),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
