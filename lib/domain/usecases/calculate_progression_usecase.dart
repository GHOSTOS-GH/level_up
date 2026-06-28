import '../../core/constants/app_constants.dart';

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
