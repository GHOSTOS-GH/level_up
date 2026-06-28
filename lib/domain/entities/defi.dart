class Defi {
  const Defi({
    required this.id,
    required this.dayOfWeek,
    required this.name,
    required this.exercise,
    required this.targetSets,
    required this.targetReps,
    required this.quote,
    required this.bonusProgress,
    required this.coefficient,
    required this.date,
  });

  final int id;
  final int dayOfWeek;
  final String name;
  final String exercise;
  final int targetSets;
  final int targetReps;
  final String quote;
  final double bonusProgress;
  final double coefficient;
  final DateTime date;
}
