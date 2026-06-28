import '../../core/constants/app_constants.dart';
import '../../core/extensions/extensions.dart';
import '../entities/veilleur.dart';

// ─── Calculate progression ────────────────────────────────────────────────────

class CalculateProgressionUseCase {
  double call({
    required int sets,
    required int reps,
    required double coefficient,
    required double streakMultiplier,
    double runeBoostPercent = 0,
    double defiBonus = 0,
  }) {
    final base = sets * reps * coefficient * 0.01;
    final withStreak = base * streakMultiplier;
    final withRune = withStreak * (1 + runeBoostPercent / 100);
    return withRune + defiBonus;
  }

  double estimateCalories(int totalReps) {
    return totalReps * AppConstants.caloriesPerRep;
  }
}

// ─── Apply daily decline ──────────────────────────────────────────────────────

class ApplyDailyDeclineUseCase {
  Veilleur call(Veilleur veilleur, DateTime now) {
    final today = now.dateOnly;
    final lastCombat = veilleur.lastCombatDate?.dateOnly;
    final lastDecline = veilleur.lastDeclineDate?.dateOnly;

    if (lastDecline != null && lastDecline.isSameDay(today)) return veilleur;
    if (lastCombat != null && lastCombat.isSameDay(today)) return veilleur;

    if (lastCombat != null) {
      final daysSinceCombat = today.difference(lastCombat).inDays;
      if (daysSinceCombat < 1) return veilleur;
    }

    final newProgression = (veilleur.progression - AppConstants.dailyDeclineRate)
        .clampProgress(AppConstants.minProgress, AppConstants.maxProgress);

    return veilleur.copyWith(
      progression: newProgression,
      lastDeclineDate: today,
    );
  }
}

// ─── Apply progress gain ──────────────────────────────────────────────────────

class ApplyProgressGainUseCase {
  ({Veilleur veilleur, double appliedGain}) call({
    required Veilleur veilleur,
    required double rawGain,
    required DateTime now,
  }) {
    final today = now.dateOnly;
    var todayGain = veilleur.todayProgressGain;

    if (veilleur.lastProgressDate?.dateOnly != today) {
      todayGain = 0;
    }

    final remaining = AppConstants.maxDailyProgressGain - todayGain;
    final appliedGain = rawGain.clamp(0, remaining).toDouble();

    final newProgression = (veilleur.progression + appliedGain)
        .clampProgress(AppConstants.minProgress, AppConstants.maxProgress);

    return (
      veilleur: veilleur.copyWith(
        progression: newProgression,
        todayProgressGain: todayGain + appliedGain,
        lastProgressDate: today,
      ),
      appliedGain: appliedGain,
    );
  }
}
