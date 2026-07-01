/// Instance concrète d'un exercice dans une séance datée (contrairement à
/// ExerciceTemplate qui est le modèle abstrait récurrent).
class ExerciceSeance {
  const ExerciceSeance({
    required this.nom,
    required this.series,
    required this.repetitions,
    required this.ordre,
    required this.complete,
    this.combatId,
  });

  final String nom;
  final int series;
  final int repetitions;
  final int ordre;
  final bool complete;
  /// Lié au Combat créé lors de la validation de cet exercice (historique).
  final int? combatId;

  ExerciceSeance copyWith({
    String? nom,
    int? series,
    int? repetitions,
    int? ordre,
    bool? complete,
    int? combatId,
  }) {
    return ExerciceSeance(
      nom: nom ?? this.nom,
      series: series ?? this.series,
      repetitions: repetitions ?? this.repetitions,
      ordre: ordre ?? this.ordre,
      complete: complete ?? this.complete,
      combatId: combatId ?? this.combatId,
    );
  }
}

/// Séance programmée pour une date précise. Générée automatiquement depuis
/// le JourTemplate correspondant, mais éditable individuellement ensuite
/// (ajout/suppression/modification d'exercices pour CE jour uniquement).
class SeanceProgrammee {
  const SeanceProgrammee({
    required this.id,
    required this.date,
    required this.nom,
    required this.exercices,
    required this.estJourRepos,
    required this.quote,
    required this.bonusProgress,
    required this.coefficient,
    required this.bonusApplique,
  });

  final int id;
  final DateTime date;
  final String nom;
  final List<ExerciceSeance> exercices;
  final bool estJourRepos;
  final String quote;
  final double bonusProgress;
  final double coefficient;
  /// true une fois que le bonus narratif a été appliqué (séance 100% complète).
  final bool bonusApplique;

  int get totalExercices => exercices.length;
  int get exercicesCompletes => exercices.where((e) => e.complete).length;
  bool get estComplete => exercices.isNotEmpty && exercicesCompletes == totalExercices;
  double get progressionRatio =>
      totalExercices == 0 ? 0 : exercicesCompletes / totalExercices;

  SeanceProgrammee copyWith({
    int? id,
    DateTime? date,
    String? nom,
    List<ExerciceSeance>? exercices,
    bool? estJourRepos,
    String? quote,
    double? bonusProgress,
    double? coefficient,
    bool? bonusApplique,
  }) {
    return SeanceProgrammee(
      id: id ?? this.id,
      date: date ?? this.date,
      nom: nom ?? this.nom,
      exercices: exercices ?? this.exercices,
      estJourRepos: estJourRepos ?? this.estJourRepos,
      quote: quote ?? this.quote,
      bonusProgress: bonusProgress ?? this.bonusProgress,
      coefficient: coefficient ?? this.coefficient,
      bonusApplique: bonusApplique ?? this.bonusApplique,
    );
  }
}
