import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/narrative_entities.dart';
import 'glass_widgets.dart';

class MurProgress extends StatelessWidget {
  const MurProgress({
    super.key,
    required this.progression,
    required this.palier,
    required this.chapitre,
  });

  final double progression;
  final PalierNarratif palier;
  final Chapitre chapitre;

  @override
  Widget build(BuildContext context) {
    final clamped = progression.clamp(0.0, 100.0) / 100.0;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      accentColor: AppColors.accentPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ligne Palier ← → Chapitre
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(palier.emoji, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Text(
                    palier.title,
                    style: GoogleFonts.orbitron(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accentPurpleLight,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accentCyan.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.accentCyan.withValues(alpha: 0.25)),
                ),
                child: Text(
                  '${chapitre.emoji} ${chapitre.name}',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentCyanLight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Pourcentage + texte
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              GradientText(
                '${progression.toStringAsFixed(1)}%',
                gradient: AppColors.xpBarGradient,
                style: GoogleFonts.orbitron(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Mur brisé',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Barre XP avec fissures
          Stack(
            children: [
              GlassXpBar(progress: clamped, height: 12),
              // Fissures visuelles par-dessus la barre
              if (clamped > 0.15)
                Positioned.fill(
                  child: CustomPaint(painter: _CrackPainter(progress: clamped)),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            palier.description,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textMuted,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _CrackPainter extends CustomPainter {
  _CrackPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accentCyanLight.withValues(alpha: 0.25 + progress * 0.3)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final random = math.Random(42);
    final crackCount = (progress * 6).ceil();

    for (var i = 0; i < crackCount; i++) {
      final startX = size.width * progress * random.nextDouble();
      final startY = size.height * random.nextDouble();
      final path = Path()..moveTo(startX, startY);
      var x = startX;
      var y = startY;
      for (var j = 0; j < 3; j++) {
        x += random.nextDouble() * 10 - 5;
        y += random.nextDouble() * 6;
        path.lineTo(x.clamp(0, size.width), y.clamp(0, size.height));
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CrackPainter old) => old.progress != progress;
}
