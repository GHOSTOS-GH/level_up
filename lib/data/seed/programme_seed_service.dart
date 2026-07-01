import '../../core/constants/daily_challenges.dart';
import '../../domain/entities/programme_template.dart';
import '../../domain/repositories/repositories.dart';

/// Génère les 7 JourTemplate par défaut à partir des DailyChallenges
/// narratifs existants (1 exercice/jour au départ), que l'utilisateur
/// pourra ensuite enrichir (plusieurs exercices/jour) ou éditer librement
/// depuis l'écran Programme.
class ProgrammeSeedService {
  ProgrammeSeedService(this._repository);

  final ProgrammeRepository _repository;

  Future<void> seedIfNeeded() async {
    final defaults = DailyChallenges.templates.map((t) {
      return JourTemplate(
        dayOfWeek: t.dayOfWeek,
        nom: t.name,
        exercices: [
          ExerciceTemplate(
            nom: t.exercise,
            series: t.targetSets,
            repetitions: t.targetReps,
            ordre: 0,
          ),
        ],
        estJourRepos: t.dayOfWeek == DateTime.sunday,
        quote: t.quote,
        bonusProgress: t.bonusProgress,
        coefficient: t.coefficient,
      );
    }).toList();

    await _repository.initializeTemplates(defaults);
  }
}
