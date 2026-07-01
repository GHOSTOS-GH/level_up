/// Un exercice au sein d'un jour de template hebdomadaire.
/// C'est la définition "modèle" (pas une instance datée).
class ExerciceTemplate {
  const ExerciceTemplate({
    required this.nom,
    required this.series,
    required this.repetitions,
    required this.ordre,
  });

  final String nom;
  final int series;
  final int repetitions;
  final int ordre;

  ExerciceTemplate copyWith({
    String? nom,
    int? series,
    int? repetitions,
    int? ordre,
  }) {
    return ExerciceTemplate(
      nom: nom ?? this.nom,
      series: series ?? this.series,
      repetitions: repetitions ?? this.repetitions,
      ordre: ordre ?? this.ordre,
    );
  }
}

/// Un jour de la semaine dans le programme récurrent de l'utilisateur.
/// dayOfWeek: 1 (lundi) → 7 (dimanche), suit DateTime.monday..sunday.
class JourTemplate {
  const JourTemplate({
    required this.dayOfWeek,
    required this.nom,
    required this.exercices,
    required this.estJourRepos,
    required this.quote,
    required this.bonusProgress,
    required this.coefficient,
  });

  final int dayOfWeek;
  final String nom;
  final List<ExerciceTemplate> exercices;
  final bool estJourRepos;
  final String quote;
  final double bonusProgress;
  final double coefficient;

  JourTemplate copyWith({
    int? dayOfWeek,
    String? nom,
    List<ExerciceTemplate>? exercices,
    bool? estJourRepos,
    String? quote,
    double? bonusProgress,
    double? coefficient,
  }) {
    return JourTemplate(
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      nom: nom ?? this.nom,
      exercices: exercices ?? this.exercices,
      estJourRepos: estJourRepos ?? this.estJourRepos,
      quote: quote ?? this.quote,
      bonusProgress: bonusProgress ?? this.bonusProgress,
      coefficient: coefficient ?? this.coefficient,
    );
  }
}
