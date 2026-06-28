import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ParticleBurst extends StatefulWidget {
  const ParticleBurst({
    super.key,
    required this.trigger,
    required this.child,
  });

  final bool trigger;
  final Widget child;

  @override
  State<ParticleBurst> createState() => _ParticleBurstState();
}

class _ParticleBurstState extends State<ParticleBurst>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void didUpdateWidget(covariant ParticleBurst oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger && !oldWidget.trigger) {
      _spawnParticles();
      _controller.forward(from: 0);
    }
  }

  void _spawnParticles() {
    _particles.clear();
    for (var i = 0; i < 30; i++) {
      _particles.add(
        _Particle(
          angle: _random.nextDouble() * 2 * pi,
          speed: 50 + _random.nextDouble() * 100,
          size: 2 + _random.nextDouble() * 4,
          color: [
            AppColors.accentFire,
            AppColors.accentLight,
            AppColors.accentWater,
          ][_random.nextInt(3)],
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        widget.child,
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            if (_controller.value == 0) return const SizedBox.shrink();
            return CustomPaint(
              size: const Size(200, 200),
              painter: _ParticlePainter(
                particles: _particles,
                progress: _controller.value,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Particle {
  _Particle({
    required this.angle,
    required this.speed,
    required this.size,
    required this.color,
  });

  final double angle;
  final double speed;
  final double size;
  final Color color;
}

class _ParticlePainter extends CustomPainter {
  _ParticlePainter({required this.particles, required this.progress});

  final List<_Particle> particles;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    for (final p in particles) {
      final distance = p.speed * progress;
      final opacity = (1 - progress).clamp(0.0, 1.0);
      final paint = Paint()
        ..color = p.color.withValues(alpha: opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawCircle(
        center + Offset(cos(p.angle) * distance, sin(p.angle) * distance),
        p.size * (1 - progress * 0.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
