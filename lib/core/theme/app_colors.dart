import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0A0A1A);
  static const Color surface = Color(0xFF1A1A3A);
  static const Color surfaceElevated = Color(0xFF2A2A4A);

  static const Color textPrimary = Color(0xFFF5E6D3);
  static const Color textSecondary = Color(0xFFB8A99A);
  static const Color textMuted = Color(0xFF6A5D52);

  static const Color accentFire = Color(0xFFFF6B35);
  static const Color accentLight = Color(0xFFFFE66D);
  static const Color accentShadow = Color(0xFF6C63FF);
  static const Color accentWater = Color(0xFF4ECDC4);

  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color danger = Color(0xFFF44336);

  static const LinearGradient murGradient = LinearGradient(
    colors: [accentFire, accentLight, accentShadow],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const RadialGradient murRadial = RadialGradient(
    colors: [accentLight, accentFire, accentShadow],
    center: Alignment.center,
    radius: 1.2,
  );
}
