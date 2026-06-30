import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/combat.dart';
import '../../providers/providers.dart';
import '../../widgets/glass_widgets.dart';

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

    return SafeArea(
      child: combatsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.accentPurpleLight),
        ),
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
            color: AppColors.accentPurpleLight,
            backgroundColor: AppColors.surfaceElevated,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
                    child: Row(
                      children: [
                        const Text('📜', style: TextStyle(fontSize: 22)),
                        const SizedBox(width: 8),
                        Text('Historique', style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: statsAsync.when(
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                      data: (stats) => Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _StatChip('Combats', '${stats.totalCombats}'),
                          _StatChip('Sets', '${stats.totalSets}'),
                          _StatChip('Reps', '${stats.totalReps}'),
                          _StatChip('Calories', stats.totalCalories.toStringAsFixed(0)),
                          _StatChip('Minutes', '${stats.totalMinutes}'),
                        ],
                      ),
                    ),
                  ),
                ),
                if (exercises.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: GlassCard(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        child: DropdownButtonFormField<String?>(
                          value: _filterExercise,
                          decoration: const InputDecoration(
                            labelText: 'Filtrer par exercice',
                            border: InputBorder.none,
                          ),
                          dropdownColor: AppColors.surfaceElevated,
                          items: [
                            const DropdownMenuItem(value: null, child: Text('Tous')),
                            ...exercises.map((e) => DropdownMenuItem(value: e, child: Text(e))),
                          ],
                          onChanged: (v) => setState(() => _filterExercise = v),
                        ),
                      ),
                    ),
                  ),
                const SliverPadding(padding: EdgeInsets.only(top: 14)),
                if (filtered.isEmpty)
                  const SliverFillRemaining(
                    child: Center(
                      child: Text('Aucun combat enregistré', style: TextStyle(color: AppColors.textMuted)),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _CombatTile(combat: filtered[index]),
                        childCount: filtered.length,
                      ),
                    ),
                  ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 110)),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.glassCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.accentFire.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.fitness_center_rounded,
                  color: AppColors.accentFire, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    combat.exercise,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${combat.date.formattedDate} • ${combat.completedSets}/${combat.totalSets} sets • '
                    '${combat.totalReps} reps • ${combat.durationMinutes} min',
                    style: AppTheme.metadataStyle,
                  ),
                ],
              ),
            ),
            Column(
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
          ],
        ),
      ),
    );
  }
}
