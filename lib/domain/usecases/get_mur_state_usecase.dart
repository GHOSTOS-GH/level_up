import '../../core/constants/app_constants.dart';
import '../../core/constants/narrative_constants.dart';
import '../entities/combat_result.dart';
import '../entities/rune.dart';
import '../repositories/rune_repository.dart';
import '../repositories/veilleur_repository.dart';
import 'apply_daily_decline_usecase.dart';
import 'calculate_streak_multiplier_usecase.dart';
import 'update_streak_usecase.dart';

class GetMurStateUseCase {
  GetMurStateUseCase({
    required VeilleurRepository veilleurRepository,
    required ApplyDailyDeclineUseCase applyDailyDecline,
    required CalculateStreakMultiplierUseCase calculateStreakMultiplier,
    required UpdateStreakUseCase updateStreak,
  })  : _veilleurRepository = veilleurRepository,
        _applyDailyDecline = applyDailyDecline,
        _calculateStreakMultiplier = calculateStreakMultiplier,
        _updateStreak = updateStreak;

  final VeilleurRepository _veilleurRepository;
  final ApplyDailyDeclineUseCase _applyDailyDecline;
  final CalculateStreakMultiplierUseCase _calculateStreakMultiplier;
  final UpdateStreakUseCase _updateStreak;

  Future<MurState> call() async {
    var veilleur = await _veilleurRepository.getVeilleur();
    veilleur = _applyDailyDecline.call(veilleur, DateTime.now());
    veilleur = _updateStreak.resetIfInactive(veilleur, DateTime.now());
    await _veilleurRepository.saveVeilleur(veilleur);

    final streakDays = veilleur.streakDays;
    final multiplier = _calculateStreakMultiplier.call(streakDays);
    final palier = NarrativeConstants.palierForStreak(streakDays);
    final chapitre = NarrativeConstants.chapitreForLevel(veilleur.niveau);
    final remaining = AppConstants.maxDailyProgressGain - veilleur.todayProgressGain;

    return MurState(
      progression: veilleur.progression,
      niveau: veilleur.niveau,
      streakDays: streakDays,
      streakMultiplier: multiplier,
      palier: palier,
      chapitre: chapitre,
      todayGain: veilleur.todayProgressGain,
      remainingDailyGain: remaining.clamp(0, AppConstants.maxDailyProgressGain),
      veilleur: veilleur,
    );
  }
}

class ActivateRuneUseCase {
  ActivateRuneUseCase(this._runeRepository);

  final RuneRepository _runeRepository;

  Future<Rune?> call(int runeId) async {
    final now = DateTime.now();
    if (now.weekday != DateTime.sunday) return null;

    final activeCount = await _runeRepository.countActiveRunes();
    if (activeCount >= AppConstants.maxActiveRunes) return null;

    final runes = await _runeRepository.getAllRunes();
    final rune = runes.where((r) => r.id == runeId).firstOrNull;
    if (rune == null || !rune.unlocked || rune.active) return null;

    final activated = rune.copyWith(active: true, remainingCombats: 3);
    await _runeRepository.saveRune(activated);
    return activated;
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }
}
