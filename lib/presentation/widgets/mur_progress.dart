import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/narrative_entities.dart';

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
    final clampedProgress = progression.clamp(0.0, 100.0) / 100.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${palier.emoji} ${palier.title}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.accentLight,
                  ),
            ),
            Text(
              '${chapitre.emoji} ${chapitre.name}',
              style: AppTheme.metadataStyle,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 48,
          child: CustomPaint(
            painter: _MurProgressPainter(
              progress: clampedProgress,
              palierEmoji: palier.emoji,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${progression.toStringAsFixed(1)}%',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: AppColors.accentFire.withValues(alpha: 0.8),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                  ),
                  Icon(
                    Icons.auto_fix_high,
                    color: AppColors.accentLight.withValues(alpha: clampedProgress),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          palier.description,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _MurProgressPainter extends CustomPainter {
  _MurProgressPainter({
    required this.progress,
    required this.palierEmoji,
  });

  final double progress;
  final String palierEmoji;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(24),
    );

    final bgPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.surface, AppColors.surfaceElevated],
      ).createShader(rect.outerRect);
    canvas.drawRRect(rect, bgPaint);

    if (progress > 0) {
      final progressRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width * progress, size.height),
        const Radius.circular(24),
      );

      final progressPaint = Paint()
        ..shader = RadialGradient(
          center: Alignment.centerRight,
          radius: 1.5,
          colors: [
            AppColors.accentLight.withValues(alpha: 0.9),
            AppColors.accentFire,
            AppColors.accentShadow.withValues(alpha: 0.8),
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(progressRect.outerRect);

      canvas.drawRRect(progressRect, progressPaint);

      _drawCracks(canvas, size);
    }

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = AppColors.accentFire.withValues(alpha: 0.4);
    canvas.drawRRect(rect, borderPaint);
  }

  void _drawCracks(Canvas canvas, Size size) {
    if (progress < 0.15) return;

    final crackPaint = Paint()
      ..color = AppColors.accentLight.withValues(alpha: 0.3 + progress * 0.5)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final random = math.Random(42);
    final crackCount = (progress * 8).ceil();

    for (var i = 0; i < crackCount; i++) {
      final startX = size.width * progress * random.nextDouble();
      final startY = size.height * random.nextDouble();
      final path = Path()..moveTo(startX, startY);

      var x = startX;
      var y = startY;
      for (var j = 0; j < 3; j++) {
        x += random.nextDouble() * 12 - 6;
        y += random.nextDouble() * 8;
        path.lineTo(x.clamp(0, size.width), y.clamp(0, size.height));
      }
      canvas.drawPath(path, crackPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _MurProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
