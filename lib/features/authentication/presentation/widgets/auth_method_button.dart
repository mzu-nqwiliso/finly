import 'package:finly/app/theme/app_colors.dart';
import 'package:finly/app/theme/app_dimensions.dart';
import 'package:finly/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthMethodButton extends StatelessWidget {
  const AuthMethodButton({
    super.key,
    required this.label,
    required this.leading,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final Widget leading;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF222222),
          foregroundColor: AppColors.white,
          disabledBackgroundColor: const Color(0xFF222222),
          elevation: 0,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing20,
          ),
        ),
        child: isLoading
            ? const SizedBox.square(
                dimension: 19,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 24, child: Center(child: leading)),
                  const SizedBox(width: AppDimensions.spacing8),
                  Text(
                    label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
