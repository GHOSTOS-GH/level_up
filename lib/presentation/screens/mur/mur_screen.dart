import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/mur_notifier.dart';
import '../../widgets/mur_progress.dart';
import '../../widgets/stat_card.dart';

class MurScreen extends ConsumerWidget {
  const MurScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final murState = ref.watch(murStateProvider);
    final defiState = ref.watch(todayDefiProvider);

    return Scaffold(
      body: SafeArea(
        child: murState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Erreur: $e')),
          data: (state) {
            return RefreshIndicator(
              onRefresh: () => ref.read(murStateProvider.notifier).refresh(),
              color: AppColors.accentFire,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Level Up !',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Veilleur ${state.veilleur.nom}',
                      style: AppTheme.metadataStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    MurProgress(
                      progression: state.progression,
                      palier: state.palier,
                      chapitre: state.chapitre,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            label: 'Streak',
                            value: '${state.streakDays}j',
                            icon: Icons.local_fire_department,
                            accentColor: AppColors.accentFire,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            label: 'Multiplicateur',
                            value: 'x${state.streakMultiplier.toStringAsFixed(1)}',
                            icon: Icons.bolt,
                            accentColor: AppColors.accentLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            label: 'Niveau',
                            value: '${state.niveau}',
                            icon: Icons.military_tech,
                            accentColor: AppColors.accentShadow,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: StatCard(
                            label: 'Gain restant',
                            value: '${state.remainingDailyGain.toStringAsFixed(0)}%',
                            icon: Icons.trending_up,
                            accentColor: AppColors.accentWater,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    defiState.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (e, _) => Text('Erreur défi: $e'),
                      data: (defi) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.flag, color: AppColors.accentFire),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Défi du jour — ${defi.name}',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                defi.exercise,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      color: AppColors.accentLight,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${defi.targetSets} séries × ${defi.targetReps} reps',
                                style: AppTheme.metadataStyle,
                              ),
                              const SizedBox(height: 12),
                              Text(defi.quote, style: AppTheme.quoteStyle),
                              const SizedBox(height: 8),
                              Text(
                                'Bonus: +${defi.bonusProgress.toStringAsFixed(1)}% progression',
                                style: AppTheme.metadataStyle.copyWith(
                                  color: AppColors.success,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: () => context.go(AppRoutes.entrainement),
                      icon: const Icon(Icons.sports_martial_arts),
                      label: const Text('COMMENCER LE COMBAT'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                        backgroundColor: AppColors.accentFire,
                      ),
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
