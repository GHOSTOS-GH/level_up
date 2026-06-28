class SerieCombat {
  const SerieCombat({
    required this.index,
    required this.reps,
    required this.completed,
  });

  final int index;
  final int reps;
  final bool completed;

  SerieCombat copyWith({
    int? index,
    int? reps,
    bool? completed,
  }) {
    return SerieCombat(
      index: index ?? this.index,
      reps: reps ?? this.reps,
      completed: completed ?? this.completed,
    );
  }
}

class Combat {
  const Combat({
    required this.id,
    required this.exercise,
    required this.date,
    required this.series,
    required this.durationMinutes,
    required this.calories,
    required this.progressionGain,
    required this.defiName,
    required this.coefficient,
  });

  final int id;
  final String exercise;
  final DateTime date;
  final List<SerieCombat> series;
  final int durationMinutes;
  final double calories;
  final double progressionGain;
  final String? defiName;
  final double coefficient;

  int get totalSets => series.length;
  int get totalReps => series.fold(0, (sum, s) => sum + s.reps);
  int get completedSets => series.where((s) => s.completed).length;
}
