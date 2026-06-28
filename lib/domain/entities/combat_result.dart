import 'combat.dart';
import 'narrative_entities.dart';
import 'rune.dart';
import 'veilleur.dart';

class CombatResult {
  const CombatResult({
    required this.combat,
    required this.progressionGain,
    required this.newProgression,
    required this.streakDays,
    required this.streakMultiplier,
    required this.revealedMessage,
    required this.unlockedRune,
    required this.runeApplied,
  });

  final Combat combat;
  final double progressionGain;
  final double newProgression;
  final int streakDays;
  final double streakMultiplier;
  final MessageSecret? revealedMessage;
  final Rune? unlockedRune;
  final Rune? runeApplied;
}

class MurState {
  const MurState({
    required this.progression,
    required this.niveau,
    required this.streakDays,
    required this.streakMultiplier,
    required this.palier,
    required this.chapitre,
    required this.todayGain,
    required this.remainingDailyGain,
    required this.veilleur,
  });

  final double progression;
  final int niveau;
  final int streakDays;
  final double streakMultiplier;
  final PalierNarratif palier;
  final Chapitre chapitre;
  final double todayGain;
  final double remainingDailyGain;
  final Veilleur veilleur;
}

class HistoriqueStats {
  const HistoriqueStats({
    required this.totalCombats,
    required this.totalSets,
    required this.totalReps,
    required this.totalCalories,
    required this.totalMinutes,
  });

  final int totalCombats;
  final int totalSets;
  final int totalReps;
  final double totalCalories;
  final int totalMinutes;
}
