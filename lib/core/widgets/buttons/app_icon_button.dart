import 'package:finly/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
    this.size = 50,
    this.iconSize = 23,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        icon: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}