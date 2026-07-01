import '../../domain/entities/programme_template.dart';
import '../../domain/entities/seance_programmee.dart';
import '../local/models/exercice_seance_hive.dart';
import '../local/models/exercice_template_hive.dart';
import '../local/models/jour_template_hive.dart';
import '../local/models/seance_programmee_hive.dart';

class ProgrammeMapper {
  // ── Template hebdomadaire ─────────────────────────────────────────────────

  static JourTemplate toJourTemplate(JourTemplateHive h) {
    return JourTemplate(
      dayOfWeek: h.dayOfWeek,
      nom: h.nom,
      exercices: h.exercices.map(toExerciceTemplate).toList()
        ..sort((a, b) => a.ordre.compareTo(b.ordre)),
      estJourRepos: h.estJourRepos,
      quote: h.quote,
      bonusProgress: h.bonusProgress,
      coefficient: h.coefficient,
    );
  }

  static JourTemplateHive fromJourTemplate(JourTemplate e) {
    return JourTemplateHive()
      ..dayOfWeek = e.dayOfWeek
      ..nom = e.nom
      ..exercices = e.exercices.map(fromExerciceTemplate).toList()
      ..estJourRepos = e.estJourRepos
      ..quote = e.quote
      ..bonusProgress = e.bonusProgress
      ..coefficient = e.coefficient;
  }

  static ExerciceTemplate toExerciceTemplate(ExerciceTemplateHive h) {
    return ExerciceTemplate(
      nom: h.nom,
      series: h.series,
      repetitions: h.repetitions,
      ordre: h.ordre,
    );
  }

  static ExerciceTemplateHive fromExerciceTemplate(ExerciceTemplate e) {
    return ExerciceTemplateHive()
      ..nom = e.nom
      ..series = e.series
      ..repetitions = e.repetitions
      ..ordre = e.ordre;
  }

  // ── Séance datée ──────────────────────────────────────────────────────────

  static SeanceProgrammee toSeance(int id, SeanceProgrammeeHive h) {
    return SeanceProgrammee(
      id: id,
      date: h.date,
      nom: h.nom,
      exercices: h.exercices.map(toExerciceSeance).toList()
        ..sort((a, b) => a.ordre.compareTo(b.ordre)),
      estJourRepos: h.estJourRepos,
      quote: h.quote,
      bonusProgress: h.bonusProgress,
      coefficient: h.coefficient,
      bonusApplique: h.bonusApplique,
    );
  }

  static SeanceProgrammeeHive fromSeance(SeanceProgrammee e) {
    return SeanceProgrammeeHive()
      ..date = e.date
      ..nom = e.nom
      ..exercices = e.exercices.map(fromExerciceSeance).toList()
      ..estJourRepos = e.estJourRepos
      ..quote = e.quote
      ..bonusProgress = e.bonusProgress
      ..coefficient = e.coefficient
      ..bonusApplique = e.bonusApplique;
  }

  static ExerciceSeance toExerciceSeance(ExerciceSeanceHive h) {
    return ExerciceSeance(
      nom: h.nom,
      series: h.series,
      repetitions: h.repetitions,
      ordre: h.ordre,
      complete: h.complete,
      combatId: h.combatId,
    );
  }

  static ExerciceSeanceHive fromExerciceSeance(ExerciceSeance e) {
    return ExerciceSeanceHive()
      ..nom = e.nom
      ..series = e.series
      ..repetitions = e.repetitions
      ..ordre = e.ordre
      ..complete = e.complete
      ..combatId = e.combatId;
  }

  /// Convertit un template hebdo en une nouvelle séance datée (génération
  /// automatique du jour). Les exercices repartent tous à `complete: false`.
  static SeanceProgrammee generateSeanceFromTemplate(
    JourTemplate template,
    DateTime date,
  ) {
    return SeanceProgrammee(
      id: 0, // sera assigné par le repository (clé = date)
      date: date,
      nom: template.nom,
      exercices: template.exercices
          .map((t) => ExerciceSeance(
                nom: t.nom,
                series: t.series,
                repetitions: t.repetitions,
                ordre: t.ordre,
                complete: false,
              ))
          .toList(),
      estJourRepos: template.estJourRepos,
      quote: template.quote,
      bonusProgress: template.bonusProgress,
      coefficient: template.coefficient,
      bonusApplique: false,
    );
  }
}
