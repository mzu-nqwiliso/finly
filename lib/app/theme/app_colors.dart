import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF8C71F5);
  static const Color secondary = Color(0xFF1A1A1A);

  // Base
  static const Color white = Color(0xFFF7F7F7);
  static const Color text = Color(0xFFF7F7F7);

  // Backgrounds
  static const Color background = secondary;
  static const Color surface = Color(0xFF242424);

  // Text
  static const Color textPrimary = white;
  static const Color textSecondary = Color(0xFFB8B8B8);
  static const Color textMuted = Color(0xFF858585);

  // States
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFB74D);
  static const Color error = Color(0xFFE57373);
  static const Color info = Color(0xFF64B5F6);

  // Borders
  static const Color border = Color(0xFF353535);
}
