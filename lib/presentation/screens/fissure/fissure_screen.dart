import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/combat_result.dart';

class FissureScreen extends StatefulWidget {
  const FissureScreen({super.key, required this.result});

  final CombatResult result;

  @override
  State<FissureScreen> createState() => _FissureScreenState();
}

class _FissureScreenState extends State<FissureScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _glowAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scaleAnim = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _glowAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1, curve: Curves.easeIn),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.result;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2 * _glowAnim.value + 0.5,
                  colors: [
                    AppColors.accentLight.withValues(alpha: 0.15 * _glowAnim.value),
                    AppColors.background,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Spacer(),
                    Transform.scale(
                      scale: _scaleAnim.value,
                      child: Column(
                        children: [
                          Text(
                            '💥',
                            style: TextStyle(fontSize: 64 * _scaleAnim.value),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'La Fissure S\'ouvre',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: AppColors.accentLight,
                                  shadows: [
                                    Shadow(
                                      color: AppColors.accentLight.withValues(alpha: 0.6),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    _GainRow(
                      icon: Icons.trending_up,
                      label: 'Progression au Mur',
                      value: '+${result.progressionGain.toStringAsFixed(1)}%',
                      color: AppColors.accentFire,
                    ),
                    const SizedBox(height: 12),
                    _GainRow(
                      icon: Icons.landscape,
                      label: 'Nouvelle progression',
                      value: '${result.newProgression.toStringAsFixed(1)}%',
                      color: AppColors.accentWater,
                    ),
                    const SizedBox(height: 12),
                    _GainRow(
                      icon: Icons.local_fire_department,
                      label: 'Streak',
                      value: '${result.streakDays}j (x${result.streakMultiplier.toStringAsFixed(1)})',
                      color: AppColors.warning,
                    ),
                    if (result.revealedMessage != null) ...[
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.accentShadow.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text('🔮 Message Secret Révélé'),
                            const SizedBox(height: 12),
                            Text(
                              result.revealedMessage!.content,
                              style: AppTheme.quoteStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (result.unlockedRune != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.accentLight.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.accentLight.withValues(alpha: 0.4)),
                        ),
                        child: Row(
                          children: [
                            const Text('⚡', style: TextStyle(fontSize: 28)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rune débloquée: ${result.unlockedRune!.name}',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    result.unlockedRune!.description,
                                    style: AppTheme.metadataStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => context.go(AppRoutes.mur),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 52),
                      ),
                      child: const Text('Retour au Mur'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GainRow extends StatelessWidget {
  const _GainRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
