enum RuneType {
  progressionBoost,
  streakShield,
  doubleBonus,
}

class Rune {
  const Rune({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.unlocked,
    required this.active,
    required this.remainingCombats,
    required this.boostPercent,
  });

  final int id;
  final RuneType type;
  final String name;
  final String description;
  final bool unlocked;
  final bool active;
  final int remainingCombats;
  final double boostPercent;

  Rune copyWith({
    bool? unlocked,
    bool? active,
    int? remainingCombats,
  }) {
    return Rune(
      id: id,
      type: type,
      name: name,
      description: description,
      unlocked: unlocked ?? this.unlocked,
      active: active ?? this.active,
      remainingCombats: remainingCombats ?? this.remainingCombats,
      boostPercent: boostPercent,
    );
  }
}
