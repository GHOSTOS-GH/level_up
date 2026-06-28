import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/combat.dart';
import '../../providers/providers.dart';

final historiqueProvider = FutureProvider<List<Combat>>((ref) async {
  return ref.read(combatRepositoryProvider).getAllCombats();
});

final historiqueStatsProvider = FutureProvider((ref) async {
  return ref.read(combatRepositoryProvider).getHistoriqueStats();
});

class HistoriqueScreen extends ConsumerStatefulWidget {
  const HistoriqueScreen({super.key});

  @override
  ConsumerState<HistoriqueScreen> createState() => _HistoriqueScreenState();
}

class _HistoriqueScreenState extends ConsumerState<HistoriqueScreen> {
  String? _filterExercise;

  @override
  Widget build(BuildContext context) {
    final combatsAsync = ref.watch(historiqueProvider);
    final statsAsync = ref.watch(historiqueStatsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Historique')),
      body: combatsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (combats) {
          final exercises = combats.map((c) => c.exercise).toSet().toList()..sort();
          final filtered = _filterExercise == null
              ? combats
              : combats.where((c) => c.exercise == _filterExercise).toList();

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(historiqueProvider);
              ref.invalidate(historiqueStatsProvider);
            },
            color: AppColors.accentFire,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: statsAsync.when(
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                      data: (stats) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Statistiques globales',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _StatChip('Combats', '${stats.totalCombats}'),
                              _StatChip('Sets', '${stats.totalSets}'),
                              _StatChip('Reps', '${stats.totalReps}'),
                              _StatChip('Calories', stats.totalCalories.toStringAsFixed(0)),
                              _StatChip('Minutes', '${stats.totalMinutes}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (exercises.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButtonFormField<String?>(
                        value: _filterExercise,
                        decoration: const InputDecoration(
                          labelText: 'Filtrer par exercice',
                        ),
                        dropdownColor: AppColors.surfaceElevated,
                        items: [
                          const DropdownMenuItem(value: null, child: Text('Tous')),
                          ...exercises.map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          ),
                        ],
                        onChanged: (v) => setState(() => _filterExercise = v),
                      ),
                    ),
                  ),
                if (filtered.isEmpty)
                  const SliverFillRemaining(
                    child: Center(child: Text('Aucun combat enregistré')),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final combat = filtered[index];
                        return _CombatTile(combat: combat);
                      },
                      childCount: filtered.length,
                    ),
                  ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value, style: Theme.of(context).textTheme.titleMedium),
          Text(label, style: AppTheme.metadataStyle),
        ],
      ),
    );
  }
}

class _CombatTile extends StatelessWidget {
  const _CombatTile({required this.combat});

  final Combat combat;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: AppColors.accentFire.withValues(alpha: 0.2),
          child: const Icon(Icons.fitness_center, color: AppColors.accentFire, size: 20),
        ),
        title: Text(combat.exercise),
        subtitle: Text(
          '${combat.date.formattedDate} • ${combat.completedSets}/${combat.totalSets} sets • '
          '${combat.totalReps} reps • ${combat.durationMinutes} min',
          style: AppTheme.metadataStyle,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '+${combat.progressionGain.toStringAsFixed(1)}%',
              style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold),
            ),
            if (combat.defiName != null)
              Text(combat.defiName!, style: AppTheme.metadataStyle),
          ],
        ),
      ),
    );
  }
}
