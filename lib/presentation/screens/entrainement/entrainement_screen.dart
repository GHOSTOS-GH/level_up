import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_haptic_feedback/flutter_haptic_feedback.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/exercise_list.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/combat_notifier.dart';
import '../../providers/mur_notifier.dart';
import '../../providers/providers.dart';
import '../../widgets/glass_widgets.dart';
import '../../widgets/particle_burst.dart';

class EntrainementScreen extends ConsumerStatefulWidget {
  const EntrainementScreen({super.key});

  @override
  ConsumerState<EntrainementScreen> createState() => _EntrainementScreenState();
}

class _EntrainementScreenState extends ConsumerState<EntrainementScreen> {
  bool _showParticles = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initCombat());
  }

  Future<void> _initCombat() async {
    final combat = ref.read(combatNotifierProvider);
    if (combat != null) return;

    final defi = await ref.read(todayDefiProvider.future);
    ref.read(combatNotifierProvider.notifier).startFromDefi(defi);
  }

  Future<void> _validateCombat() async {
    final result = await ref.read(combatNotifierProvider.notifier).validateCombat();
    if (result == null || !mounted) return;

    await FlutterHapticFeedback.impact(ImpactFeedbackStyle.medium);
    setState(() => _showParticles = true);

    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;

    context.push(AppRoutes.fissure, extra: result);
    setState(() => _showParticles = false);
  }

  void _showEditRepsModal(int serieIndex, int currentReps) {
    final controller = TextEditingController(text: currentReps.toString());

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surfaceElevated,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Modifier les répétitions — Série $serieIndex',
              style: Theme.of(ctx).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Répétitions'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final reps = int.tryParse(controller.text) ?? currentReps;
                ref
                    .read(combatNotifierProvider.notifier)
                    .updateSerieReps(serieIndex, reps.clamp(1, 999));
                Navigator.pop(ctx);
              },
              child: const Text('Confirmer'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final combat = ref.watch(combatNotifierProvider);
    final calc = ref.watch(calculateProgressionProvider);

    if (combat == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.accentPurpleLight),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Text('⚔️', style: TextStyle(fontSize: 22)),
                      const SizedBox(width: 8),
                      Text('Combat Actif', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // ── Sélecteur d'exercice ──
                  GlassCard(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: DropdownButtonFormField<String>(
                      value: combat.exercise,
                      decoration: const InputDecoration(
                        labelText: 'Exercice',
                        border: InputBorder.none,
                      ),
                      dropdownColor: AppColors.surfaceElevated,
                      items: [
                        if (!ExerciseList.exercises.contains(combat.exercise))
                          DropdownMenuItem(value: combat.exercise, child: Text(combat.exercise)),
                        ...ExerciseList.exercises.map(
                          (e) => DropdownMenuItem(value: e, child: Text(e)),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          ref.read(combatNotifierProvider.notifier).setExercise(value);
                        }
                      },
                    ),
                  ),
                  if (combat.defiName != null) ...[
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'Défi: ${combat.defiName}',
                        style: AppTheme.metadataStyle.copyWith(color: AppColors.accentFire),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),

                  if (combat.isResting)
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors.accentCyan.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.accentCyan.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.timer_rounded, color: AppColors.accentCyan),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Repos: ${combat.restSecondsRemaining}s',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                ref.read(combatNotifierProvider.notifier).skipRest(),
                            child: const Text('Passer'),
                          ),
                        ],
                      ),
                    ),

                  SectionHeader(title: 'Séries', emoji: '🎯'),
                  const SizedBox(height: 10),
                  ...combat.series.map((serie) {
                    return Dismissible(
                      key: ValueKey('serie_${serie.index}'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: AppColors.danger.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.delete_rounded, color: AppColors.danger),
                      ),
                      onDismissed: (_) {
                        ref.read(combatNotifierProvider.notifier).removeSerie(serie.index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: serie.completed
                              ? AppColors.success.withValues(alpha: 0.08)
                              : AppColors.glassCard,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: serie.completed
                                ? AppColors.success.withValues(alpha: 0.3)
                                : AppColors.glassBorder,
                          ),
                        ),
                        child: InkWell(
                          onTap: () => _showEditRepsModal(serie.index, serie.reps),
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(combatNotifierProvider.notifier)
                                        .toggleSerieCompleted(serie.index);
                                    if (!serie.completed) {
                                      FlutterHapticFeedback.impact(ImpactFeedbackStyle.light);
                                    }
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: serie.completed
                                          ? AppColors.success
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: serie.completed
                                            ? AppColors.success
                                            : AppColors.textMuted,
                                        width: 2,
                                      ),
                                    ),
                                    child: serie.completed
                                        ? const Icon(Icons.check_rounded,
                                            color: Colors.white, size: 16)
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Série ${serie.index}',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      Text('${serie.reps} reps', style: AppTheme.metadataStyle),
                                    ],
                                  ),
                                ),
                                GlassBadge(
                                  label: serie.completed ? 'Complet' : 'En cours',
                                  color: serie.completed
                                      ? AppColors.success
                                      : AppColors.warning,
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.edit_rounded,
                                    size: 16, color: AppColors.textMuted),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  OutlinedButton.icon(
                    onPressed: () {
                      final lastReps =
                          combat.series.isNotEmpty ? combat.series.last.reps : 10;
                      ref.read(combatNotifierProvider.notifier).addSerie(reps: lastReps);
                    },
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text('Ajouter une série'),
                  ),
                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _SummaryChip(label: 'Sets', value: '${combat.completedSets}/${combat.totalSets}'),
                      _SummaryChip(label: 'Reps', value: '${combat.totalReps}'),
                      _SummaryChip(label: 'Temps', value: _formatDuration(combat.elapsedSeconds)),
                      _SummaryChip(
                          label: 'Calories', value: combat.estimatedCalories(calc).toStringAsFixed(0)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ── Barre d'action fixe en bas ──
          Container(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated.withValues(alpha: 0.9),
              border: Border(top: BorderSide(color: AppColors.glassBorder)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ParticleBurst(
                  trigger: _showParticles,
                  child: SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: combat.isValidating || combat.completedSets == 0
                          ? null
                          : _validateCombat,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        disabledBackgroundColor: AppColors.success.withValues(alpha: 0.3),
                      ),
                      child: combat.isValidating
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('VALIDER LE COMBAT'),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: combat.isValidating
                      ? null
                      : () {
                          ref.read(combatNotifierProvider.notifier).abandonCombat();
                          context.go(AppRoutes.mur);
                        },
                  child: const Text('ABANDONNER'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({required this.label, required this.value});

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
