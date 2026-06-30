import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Fond ──────────────────────────────────────────────────────────────────
  static const Color background     = Color(0xFF0A0C14);
  static const Color bgDeepPurple   = Color(0xFF1E1B4B); // blob violet du maquette
  static const Color bgDeepCyan     = Color(0xFF0C2333); // blob cyan du maquette

  // ── Surfaces glass ────────────────────────────────────────────────────────
  static const Color surface         = Color(0xFF0F1020);
  static const Color surfaceElevated = Color(0xFF171929);
  static const Color surfaceGlass    = Color(0x08FFFFFF); // 3% blanc — effet verre
  static const Color glassCard       = Color(0x0DFFFFFF); // 5% blanc
  static const Color glassBorder     = Color(0x14FFFFFF); // 8% blanc — bordure

  // ── Accents principaux (palette maquette) ─────────────────────────────────
  static const Color accentPurple      = Color(0xFF7C3AED); // violet principal
  static const Color accentPurpleLight = Color(0xFFA78BFA); // violet clair / textes
  static const Color accentCyan        = Color(0xFF06B6D4); // cyan principal
  static const Color accentCyanLight   = Color(0xFF67E8F9); // cyan clair

  // ── Accents thématiques (Solo Leveling) ───────────────────────────────────
  static const Color accentFire   = Color(0xFFFF6B35); // 🔥 Streak / combat
  static const Color accentLight  = Color(0xFFFBBF24); // ⭐ XP / niveau / or
  static const Color accentShadow = accentPurple;       // alias pour la logique existante
  static const Color accentWater  = accentCyan;         // alias pour la logique existante

  // ── Texte ─────────────────────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted     = Color(0xFF475569);

  // ── Statuts ───────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger  = Color(0xFFEF4444);

  // ── Gradients ─────────────────────────────────────────────────────────────
  static const LinearGradient brandGradient = LinearGradient(
    colors: [accentPurpleLight, accentCyanLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient xpBarGradient = LinearGradient(
    colors: [accentPurple, accentCyan],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient fireGradient = LinearGradient(
    colors: [accentFire, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // alias legacy pour la logique existante
  static const LinearGradient murGradient = LinearGradient(
    colors: [accentFire, accentLight, accentPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const RadialGradient murRadial = RadialGradient(
    colors: [accentLight, accentFire, accentPurple],
    center: Alignment.center,
    radius: 1.2,
  );
}
