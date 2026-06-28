import '../../core/constants/app_constants.dart';
import '../../core/extensions/date_extensions.dart';
import '../entities/veilleur.dart';

class UpdateStreakUseCase {
  Veilleur call(Veilleur veilleur, DateTime combatDate) {
    final today = combatDate.dateOnly;
    final lastCombat = veilleur.lastCombatDate?.dateOnly;

    if (lastCombat == null) {
      return veilleur.copyWith(
        streakDays: 1,
        lastCombatDate: today,
      );
    }

    if (lastCombat.isSameDay(today)) {
      return veilleur.copyWith(lastCombatDate: today);
    }

    final daysDiff = today.difference(lastCombat).inDays;

    if (daysDiff == 1) {
      return veilleur.copyWith(
        streakDays: veilleur.streakDays + 1,
        lastCombatDate: today,
      );
    }

    return veilleur.copyWith(
      streakDays: 1,
      lastCombatDate: today,
    );
  }

  Veilleur resetIfInactive(Veilleur veilleur, DateTime now) {
    final lastCombat = veilleur.lastCombatDate?.dateOnly;
    if (lastCombat == null) return veilleur;

    final today = now.dateOnly;
    final daysSinceCombat = today.difference(lastCombat).inDays;

    if (daysSinceCombat > 1) {
      return veilleur.copyWith(streakDays: 0);
    }

    return veilleur;
  }
}

class CheckStreakResetUseCase {
  bool shouldResetStreak(Veilleur veilleur, DateTime now) {
    final lastCombat = veilleur.lastCombatDate?.dateOnly;
    if (lastCombat == null) return false;

    final today = now.dateOnly;
    final daysSinceCombat = today.difference(lastCombat).inDays;
    return daysSinceCombat > 1;
  }
}
