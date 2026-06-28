import '../../core/constants/app_constants.dart';
import '../../core/constants/narrative_constants.dart';
import '../../core/extensions/date_extensions.dart';
import '../entities/combat.dart';
import '../entities/combat_result.dart';
import '../entities/rune.dart';
import '../entities/veilleur.dart';
import '../repositories/combat_repository.dart';
import '../repositories/message_repository.dart';
import '../repositories/rune_repository.dart';
import '../repositories/veilleur_repository.dart';
import 'apply_daily_decline_usecase.dart';
import 'calculate_progression_usecase.dart';
import 'calculate_streak_multiplier_usecase.dart';
import 'update_streak_usecase.dart';

class ValidateCombatUseCase {
  ValidateCombatUseCase({
    required VeilleurRepository veilleurRepository,
    required CombatRepository combatRepository,
    required MessageRepository messageRepository,
    required RuneRepository runeRepository,
    required CalculateProgressionUseCase calculateProgression,
    required CalculateStreakMultiplierUseCase calculateStreakMultiplier,
    required UpdateStreakUseCase updateStreak,
    required ApplyProgressGainUseCase applyProgressGain,
  })  : _veilleurRepository = veilleurRepository,
        _combatRepository = combatRepository,
        _messageRepository = messageRepository,
        _runeRepository = runeRepository,
        _calculateProgression = calculateProgression,
        _calculateStreakMultiplier = calculateStreakMultiplier,
        _updateStreak = updateStreak,
        _applyProgressGain = applyProgressGain;

  final VeilleurRepository _veilleurRepository;
  final CombatRepository _combatRepository;
  final MessageRepository _messageRepository;
  final RuneRepository _runeRepository;
  final CalculateProgressionUseCase _calculateProgression;
  final CalculateStreakMultiplierUseCase _calculateStreakMultiplier;
  final UpdateStreakUseCase _updateStreak;
  final ApplyProgressGainUseCase _applyProgressGain;

  Future<CombatResult> call({
    required String exercise,
    required List<SerieCombat> series,
    required int durationMinutes,
    required double coefficient,
    String? defiName,
    double defiBonus = 0,
  }) async {
    final now = DateTime.now();
    var veilleur = await _veilleurRepository.getVeilleur();
    veilleur = _updateStreak.call(veilleur, now);

    final completedSeries = series.where((s) => s.completed).toList();
    final totalSets = completedSeries.length;
    final totalReps = completedSeries.fold(0, (sum, s) => sum + s.reps);

    final streakMultiplier = _calculateStreakMultiplier.call(veilleur.streakDays);

    final activeRunes = await _runeRepository.getAllRunes();
    final activeRune = activeRunes.where((r) => r.active && r.remainingCombats > 0).firstOrNull;
    final runeBoost = activeRune?.boostPercent ?? 0;

    final rawGain = _calculateProgression.call(
      sets: totalSets,
      reps: totalReps,
      coefficient: coefficient,
      streakMultiplier: streakMultiplier,
      runeBoostPercent: runeBoost,
      defiBonus: defiBonus,
    );

    final gainResult = _applyProgressGain.call(
      veilleur: veilleur,
      rawGain: rawGain,
      now: now,
    );
    veilleur = gainResult.veilleur;

    final calories = _calculateProgression.estimateCalories(totalReps);
    final combat = Combat(
      id: now.millisecondsSinceEpoch,
      exercise: exercise,
      date: now,
      series: series,
      durationMinutes: durationMinutes,
      calories: calories,
      progressionGain: gainResult.appliedGain,
      defiName: defiName,
      coefficient: coefficient,
    );

    await _combatRepository.saveCombat(combat);

    veilleur = veilleur.copyWith(
      totalCombats: veilleur.totalCombats + 1,
      niveau: NarrativeConstants.levelFromTotalCombats(veilleur.totalCombats + 1),
    );
    await _veilleurRepository.saveVeilleur(veilleur);

    final revealedMessage = await _messageRepository.revealNextMessage(veilleur.streakDays);

    Rune? unlockedRune;
    if (veilleur.streakDays >= AppConstants.runeUnlockStreakDays) {
      final runes = await _runeRepository.getAllRunes();
      final lockedRune = runes.where((r) => !r.unlocked).firstOrNull;
      if (lockedRune != null) {
        unlockedRune = lockedRune.copyWith(unlocked: true);
        await _runeRepository.saveRune(unlockedRune);
      }
    }

    if (activeRune != null) {
      final updated = activeRune.copyWith(
        remainingCombats: activeRune.remainingCombats - 1,
        active: activeRune.remainingCombats - 1 > 0,
      );
      await _runeRepository.saveRune(updated);
    }

    return CombatResult(
      combat: combat,
      progressionGain: gainResult.appliedGain,
      newProgression: veilleur.progression,
      streakDays: veilleur.streakDays,
      streakMultiplier: streakMultiplier,
      revealedMessage: revealedMessage,
      unlockedRune: unlockedRune,
      runeApplied: activeRune,
    );
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }
}
