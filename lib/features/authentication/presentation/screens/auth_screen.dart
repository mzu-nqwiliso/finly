import 'package:finly/app/theme/app_colors.dart';
import 'package:finly/app/theme/app_dimensions.dart';
import 'package:finly/app/theme/app_text_styles.dart';
import 'package:finly/core/constants/app_assets.dart';
import 'package:finly/core/widgets/buttons/app_button.dart';
import 'package:finly/features/authentication/presentation/controllers/auth_screen_controller.dart';
import 'package:finly/features/authentication/presentation/widgets/auth_method_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.controller});

  final AuthScreenController? controller;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthScreenController _controller;
  late bool _ownsController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller = widget.controller ?? AuthScreenController();
  }

  @override
  void didUpdateWidget(covariant AuthScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      if (_ownsController) _controller.dispose();
      _ownsController = widget.controller == null;
      _controller = widget.controller ?? AuthScreenController();
    }
  }

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

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
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppAssets.appBackground, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x22111111), Color(0x33111111)],
                ),
              ),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.screenPadding,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) => Column(
                        children: [
                          SizedBox(height: constraints.maxHeight * 0.19),
                          Image.asset(
                            AppAssets.finlyLogo,
                            width: 132,
                            height: 48,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.065),
                          Text(
                            'Welcome back',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.headlineMedium.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.spacing4),
                          Text(
                            'Stay on top of your money, one step at a time.',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodySmall.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.045),
                          AuthMethodButton(
                            label: 'Sign up with Email',
                            leading: const Icon(Icons.email, size: 20),
                            isLoading:
                                _controller.activeMethod == AuthMethod.email,
                            onPressed: _controller.isLoading
                                ? null
                                : () => _controller.run(AuthMethod.email),
                          ),
                          const SizedBox(height: AppDimensions.spacing16),
                          AuthMethodButton(
                            label: 'Sign up with Google',
                            leading: SvgPicture.asset(
                              AppAssets.googleLogo,
                              width: 20,
                              height: 20,
                            ),
                            isLoading:
                                _controller.activeMethod == AuthMethod.google,
                            onPressed: _controller.isLoading
                                ? null
                                : () => _controller.run(AuthMethod.google),
                          ),
                          const SizedBox(height: AppDimensions.spacing16),
                          AuthMethodButton(
                            label: 'Sign up with Phone number',
                            leading: const Icon(Icons.phone, size: 20),
                            isLoading:
                                _controller.activeMethod == AuthMethod.phone,
                            onPressed: _controller.isLoading
                                ? null
                                : () => _controller.run(AuthMethod.phone),
                          ),
                          const SizedBox(height: AppDimensions.spacing16),
                          const _OrDivider(),
                          const SizedBox(height: AppDimensions.spacing16),
                          Text(
                            'Already have an account?',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodySmall,
                          ),
                          const SizedBox(height: AppDimensions.spacing16),
                          AppButton(
                            label: 'Sign in',
                            onPressed: _controller.isLoading
                                ? null
                                : () => _controller.run(AuthMethod.signIn),
                            height: 48,
                            borderRadius: AppDimensions.radiusFull,
                            isLoading:
                                _controller.activeMethod == AuthMethod.signIn,
                          ),
                          const SizedBox(height: AppDimensions.spacing24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Expanded(child: Divider(color: AppColors.border, height: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing8),
        child: Text('or', style: AppTextStyles.bodySmall),
      ),
      const Expanded(child: Divider(color: AppColors.border, height: 1)),
    ],
  );
}
