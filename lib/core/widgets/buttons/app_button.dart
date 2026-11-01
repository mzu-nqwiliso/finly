import 'package:flutter/material.dart';
import 'package:finly/app/theme/app_colors.dart';
import 'package:finly/app/theme/app_dimensions.dart';
import 'package:finly/app/theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.height = AppDimensions.buttonHeight,
    this.isLoading = false,
    this.enabled = true,
    this.borderRadius = AppDimensions.radius12,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double borderRadius;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final buttonColor = backgroundColor ?? AppColors.primary;
    final textColor = foregroundColor ?? AppColors.white;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: enabled && !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          disabledBackgroundColor: buttonColor.withValues(alpha: 0.5),
          disabledForegroundColor: textColor.withValues(alpha: 0.7),
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: textColor,
          ),
        )
            : Text(
          label,
          style: AppTextStyles.labelLarge.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}