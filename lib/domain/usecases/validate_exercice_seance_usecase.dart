import '../../core/constants/app_constants.dart';
import '../../core/constants/narrative_constants.dart';
import '../../data/mappers/programme_mapper.dart';
import '../entities/combat.dart';
import '../entities/combat_result.dart';
import '../entities/rune.dart';
import '../entities/seance_programmee.dart';
import '../repositories/repositories.dart';
import 'progression_usecases.dart';
import 'streak_usecases.dart';
import 'validate_combat_usecase.dart';

/// Résultat de la validation d'un exercice au sein d'une séance programmée.
/// `combatResult` contient toujours le gain lié à l'exercice lui-même.
/// `seanceBonusResult` n'est renseigné QUE si cette validation complète
/// la séance à 100% (déclenche le bonus narratif, message, rune).
class ValidateExerciceSeanceResult {
  const ValidateExerciceSeanceResult({
    required this.seance,
    required this.combatResult,
    this.seanceBonusResult,
  });

  final SeanceProgrammee seance;
  final CombatResult combatResult;
  final CombatResult? seanceBonusResult;

  bool get seanceVientDeSeTerminer => seanceBonusResult != null;
}

class ValidateExerciceSeanceUseCase {
  ValidateExerciceSeanceUseCase({
    required SeanceRepository seanceRepository,
    required VeilleurRepository veilleurRepository,
    required MessageRepository messageRepository,
    required RuneRepository runeRepository,
    required ValidateCombatUseCase validateCombat,
    required CalculateStreakMultiplierUseCase calculateStreakMultiplier,
    required ApplyProgressGainUseCase applyProgressGain,
  })  : _seanceRepository = seanceRepository,
        _veilleurRepository = veilleurRepository,
        _messageRepository = messageRepository,
        _runeRepository = runeRepository,
        _validateCombat = validateCombat,
        _calculateStreakMultiplier = calculateStreakMultiplier,
        _applyProgressGain = applyProgressGain;

  final SeanceRepository _seanceRepository;
  final VeilleurRepository _veilleurRepository;
  final MessageRepository _messageRepository;
  final RuneRepository _runeRepository;
  final ValidateCombatUseCase _validateCombat;
  final CalculateStreakMultiplierUseCase _calculateStreakMultiplier;
  final ApplyProgressGainUseCase _applyProgressGain;

  Future<ValidateExerciceSeanceResult> call({
    required SeanceProgrammee seance,
    required int exerciceOrdre,
    required List<SerieCombat> series,
    required int durationMinutes,
  }) async {
    final exercice = seance.exercices.firstWhere((e) => e.ordre == exerciceOrdre);

    // 1. Le gain "brut" de l'exercice est appliqué normalement (comme un
    //    combat classique), SANS bonus narratif — celui-ci est réservé à
    //    la complétion de la séance entière (fusion demandée).
    final combatResult = await _validateCombat.call(
      exercise: exercice.nom,
      series: series,
      durationMinutes: durationMinutes,
      coefficient: seance.coefficient,
      defiName: seance.nom,
      defiBonus: 0,
    );

    // 2. Marquer l'exercice comme complété + lier le combat créé.
    final updatedExercices = seance.exercices.map((e) {
      if (e.ordre != exerciceOrdre) return e;
      return e.copyWith(complete: true, combatId: combatResult.combat.id);
    }).toList();

    var updatedSeance = seance.copyWith(exercices: updatedExercices);
    updatedSeance = await _seanceRepository.saveSeance(updatedSeance);

    // 3. Si la séance vient d'atteindre 100% ET que le bonus n'a pas encore
    //    été appliqué → on applique le bonus narratif du défi fusionné.
    CombatResult? seanceBonusResult;
    if (updatedSeance.estComplete && !updatedSeance.bonusApplique && !updatedSeance.estJourRepos) {
      seanceBonusResult = await _applySeanceBonus(updatedSeance);
      updatedSeance = updatedSeance.copyWith(bonusApplique: true);
      updatedSeance = await _seanceRepository.saveSeance(updatedSeance);
    }

    return ValidateExerciceSeanceResult(
      seance: updatedSeance,
      combatResult: combatResult,
      seanceBonusResult: seanceBonusResult,
    );
  }

  Future<CombatResult> _applySeanceBonus(SeanceProgrammee seance) async {
    var veilleur = await _veilleurRepository.getVeilleur();
    final now = DateTime.now();

    final streakMultiplier = _calculateStreakMultiplier.call(veilleur.streakDays);
    final rawGain = seance.bonusProgress * streakMultiplier;

    final gainResult = _applyProgressGain.call(
      veilleur: veilleur,
      rawGain: rawGain,
      now: now,
    );
    veilleur = gainResult.veilleur;
    await _veilleurRepository.saveVeilleur(veilleur);

    final revealedMessage =
        await _messageRepository.revealNextMessage(veilleur.streakDays);

    Rune? unlockedRune;
    if (veilleur.streakDays >= AppConstants.runeUnlockStreakDays) {
      final runes = await _runeRepository.getAllRunes();
      final locked = runes.where((r) => !r.unlocked).toList();
      if (locked.isNotEmpty) {
        unlockedRune = locked.first.copyWith(unlocked: true);
        await _runeRepository.saveRune(unlockedRune);
      }
    }

    // CombatResult "virtuel" : pas de nouveau Combat créé ici, seulement
    // le résumé du bonus narratif pour l'UI (écran Fissure).
    return CombatResult(
      combat: Combat(
        id: now.millisecondsSinceEpoch,
        exercise: seance.nom,
        date: now,
        series: const [],
        durationMinutes: 0,
        calories: 0,
        progressionGain: gainResult.appliedGain,
        defiName: seance.nom,
        coefficient: seance.coefficient,
      ),
      progressionGain: gainResult.appliedGain,
      newProgression: veilleur.progression,
      streakDays: veilleur.streakDays,
      streakMultiplier: streakMultiplier,
      revealedMessage: revealedMessage,
      unlockedRune: unlockedRune,
      runeApplied: null,
    );
  }
}
