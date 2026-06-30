import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

// ── Fond gradient global de l'app ─────────────────────────────────────────────
class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.7, -0.8),
          radius: 1.4,
          colors: [AppColors.bgDeepPurple, AppColors.background],
          stops: [0.0, 0.65],
        ),
      ),
      child: child,
    );
  }
}

// ── Carte glassmorphisme de base ───────────────────────────────────────────────
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.accentColor,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? color;
  final Color? borderColor;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? 20.0;
    return Container(
      padding: padding ?? const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color ?? AppColors.glassCard,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor ?? (accentColor?.withValues(alpha: 0.2) ?? AppColors.glassBorder),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          if (accentColor != null)
            BoxShadow(
              color: accentColor!.withValues(alpha: 0.06),
              blurRadius: 24,
              spreadRadius: 0,
            ),
        ],
      ),
      child: child,
    );
  }
}

// ── Badge de niveau / statut ──────────────────────────────────────────────────
class GlassBadge extends StatelessWidget {
  const GlassBadge({
    super.key,
    required this.label,
    this.icon,
    this.emoji,
    this.color = AppColors.accentLight,
  });

  final String label;
  final IconData? icon;
  final String? emoji;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (emoji != null) ...[
            Text(emoji!, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 4),
          ] else if (icon != null) ...[
            Icon(icon, color: color, size: 14),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

// ── XP Bar avec gradient + shimmer ────────────────────────────────────────────
class GlassXpBar extends StatefulWidget {
  const GlassXpBar({
    super.key,
    required this.progress, // 0.0 → 1.0
    this.gradient,
    this.height = 10.0,
  });

  final double progress;
  final LinearGradient? gradient;
  final double height;

  @override
  State<GlassXpBar> createState() => _GlassXpBarState();
}

class _GlassXpBarState extends State<GlassXpBar> with SingleTickerProviderStateMixin {
  late AnimationController _shimmer;

  @override
  void initState() {
    super.initState();
    _shimmer = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _shimmer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clamped = widget.progress.clamp(0.0, 1.0);
    return AnimatedBuilder(
      animation: _shimmer,
      builder: (_, __) {
        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(widget.height),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: clamped,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.height),
                gradient: widget.gradient ?? AppColors.xpBarGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentCyan.withValues(alpha: 0.3 + 0.2 * _shimmer.value),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ── Section header avec titre + action ────────────────────────────────────────
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.emoji,
    this.action,
  });

  final String title;
  final String? emoji;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (emoji != null) ...[
              Text(emoji!, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
            ],
            Text(title, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        if (action != null) action!,
      ],
    );
  }
}

// ── Gradient text ─────────────────────────────────────────────────────────────
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.style,
    this.gradient = AppColors.brandGradient,
  });

  final String text;
  final TextStyle style;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
