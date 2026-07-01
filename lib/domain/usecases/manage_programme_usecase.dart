import '../entities/programme_template.dart';
import '../repositories/repositories.dart';

class ManageProgrammeUseCase {
  ManageProgrammeUseCase(this._repository);

  final ProgrammeRepository _repository;

  Future<List<JourTemplate>> getAllTemplates() => _repository.getAllTemplates();

  Future<JourTemplate> getTemplateForDay(int dayOfWeek) =>
      _repository.getTemplateForDay(dayOfWeek);

  /// Renomme le jour, change le statut repos, la citation, le bonus.
  Future<void> updateJourInfo(
    JourTemplate template, {
    String? nom,
    bool? estJourRepos,
    String? quote,
    double? bonusProgress,
    double? coefficient,
  }) async {
    final updated = template.copyWith(
      nom: nom,
      estJourRepos: estJourRepos,
      quote: quote,
      bonusProgress: bonusProgress,
      coefficient: coefficient,
    );
    await _repository.saveTemplate(updated);
  }

  Future<void> addExercice(
    JourTemplate template, {
    required String nom,
    required int series,
    required int repetitions,
  }) async {
    final ordre = template.exercices.isEmpty
        ? 0
        : template.exercices.map((e) => e.ordre).reduce((a, b) => a > b ? a : b) + 1;

    final updated = template.copyWith(
      exercices: [
        ...template.exercices,
        ExerciceTemplate(nom: nom, series: series, repetitions: repetitions, ordre: ordre),
      ],
    );
    await _repository.saveTemplate(updated);
  }

  Future<void> updateExercice(
    JourTemplate template,
    int ordre, {
    String? nom,
    int? series,
    int? repetitions,
  }) async {
    final updated = template.copyWith(
      exercices: template.exercices.map((e) {
        if (e.ordre != ordre) return e;
        return e.copyWith(nom: nom, series: series, repetitions: repetitions);
      }).toList(),
    );
    await _repository.saveTemplate(updated);
  }

  Future<void> removeExercice(JourTemplate template, int ordre) async {
    final updated = template.copyWith(
      exercices: template.exercices.where((e) => e.ordre != ordre).toList(),
    );
    await _repository.saveTemplate(updated);
  }

  Future<void> reorderExercices(JourTemplate template, List<String> newOrderNoms) async {
    final byNom = {for (final e in template.exercices) e.nom: e};
    final reordered = <ExerciceTemplate>[];
    for (var i = 0; i < newOrderNoms.length; i++) {
      final e = byNom[newOrderNoms[i]];
      if (e != null) reordered.add(e.copyWith(ordre: i));
    }
    await _repository.saveTemplate(template.copyWith(exercices: reordered));
  }
}
