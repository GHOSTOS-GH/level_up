import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/mur_notifier.dart';
import '../../widgets/glass_widgets.dart';
import '../../widgets/mur_progress.dart';
import '../../widgets/stat_card.dart';

class MurScreen extends ConsumerWidget {
  const MurScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final murState = ref.watch(murStateProvider);
    final defiState = ref.watch(todayDefiProvider);

    return SafeArea(
      child: murState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.accentPurpleLight),
        ),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (state) {
          return RefreshIndicator(
            onRefresh: () => ref.read(murStateProvider.notifier).refresh(),
            color: AppColors.accentPurpleLight,
            backgroundColor: AppColors.surfaceElevated,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Navbar style maquette ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('🛡️', style: TextStyle(fontSize: 22)),
                          const SizedBox(width: 8),
                          GradientText(
                            'Level Up',
                            gradient: AppColors.brandGradient,
                            style: GoogleFonts.orbitron(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      GlassBadge(
                        label: 'Niv. ${state.niveau}',
                        emoji: '⭐',
                        color: AppColors.accentLight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ── Hero Card (avatar + nom + XP bar) ──
                  GlassCard(
                    padding: const EdgeInsets.all(20),
                    accentColor: AppColors.accentCyan,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                gradient: AppColors.brandGradient,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.accentPurple.withValues(alpha: 0.4),
                                    blurRadius: 16,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: const Text('🧙', style: TextStyle(fontSize: 28)),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.veilleur.nom,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${state.palier.emoji} ${state.palier.title}',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.accentPurpleLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.chapitre.emoji} ${state.chapitre.name}',
                              style: AppTheme.metadataStyle,
                            ),
                            Text(
                              '${state.todayGain.toStringAsFixed(1)} / ${20} % aujourd\'hui',
                              style: AppTheme.metadataStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        GlassXpBar(
                          progress: (state.todayGain / 20).clamp(0.0, 1.0),
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Le Mur (progression principale) ──
                  MurProgress(
                    progression: state.progression,
                    palier: state.palier,
                    chapitre: state.chapitre,
                  ),
                  const SizedBox(height: 20),

                  // ── Stats rapides style maquette (3 colonnes) ──
                  SectionHeader(title: 'Statistiques', emoji: '📊'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: StatCard(
                          label: 'Streak',
                          value: '${state.streakDays}j',
                          emoji: '🔥',
                          accentColor: AppColors.accentFire,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: StatCard(
                          label: 'Boost',
                          value: 'x${state.streakMultiplier.toStringAsFixed(1)}',
                          emoji: '⚡',
                          accentColor: AppColors.accentCyan,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: StatCard(
                          label: 'Niveau',
                          value: '${state.niveau}',
                          emoji: '🏆',
                          accentColor: AppColors.accentLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ── Défi du jour (quête principale, style quest-item) ──
                  SectionHeader(title: 'Quête du jour', emoji: '📋'),
                  const SizedBox(height: 12),
                  defiState.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (e, _) => Text('Erreur défi: $e'),
                    data: (defi) => GlassCard(
                      padding: const EdgeInsets.all(18),
                      accentColor: AppColors.accentFire,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.accentFire.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.flag_rounded,
                                    color: AppColors.accentFire, size: 20),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      defi.name,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    Text(
                                      '${defi.targetSets} séries × ${defi.targetReps} reps',
                                      style: AppTheme.metadataStyle,
                                    ),
                                  ],
                                ),
                              ),
                              GlassBadge(
                                label: '+${defi.bonusProgress.toStringAsFixed(1)}%',
                                color: AppColors.success,
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(defi.quote, style: AppTheme.quoteStyle),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── CTA principal ──
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => context.go(AppRoutes.entrainement),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ).copyWith(
                        backgroundColor: WidgetStateProperty.all(Colors.transparent),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: AppColors.fireGradient,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accentFire.withValues(alpha: 0.35),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.sports_martial_arts_rounded,
                                  color: Colors.white, size: 20),
                              const SizedBox(width: 10),
                              Text(
                                'COMMENCER LE COMBAT',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
