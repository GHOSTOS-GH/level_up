import '../../core/constants/app_constants.dart';
import '../../core/extensions/date_extensions.dart';
import '../../core/extensions/num_extensions.dart';
import '../entities/veilleur.dart';

class ApplyDailyDeclineUseCase {
  Veilleur call(Veilleur veilleur, DateTime now) {
    final today = now.dateOnly;
    final lastCombat = veilleur.lastCombatDate?.dateOnly;
    final lastDecline = veilleur.lastDeclineDate?.dateOnly;

    if (lastDecline != null && lastDecline.isSameDay(today)) {
      return veilleur;
    }

    if (lastCombat != null && lastCombat.isSameDay(today)) {
      return veilleur;
    }

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
