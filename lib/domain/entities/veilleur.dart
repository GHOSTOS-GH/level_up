class Veilleur {
  const Veilleur({
    required this.id,
    required this.nom,
    required this.progression,
    required this.niveau,
    required this.streakDays,
    required this.lastCombatDate,
    required this.todayProgressGain,
    required this.lastProgressDate,
    required this.lastDeclineDate,
    required this.totalCombats,
    required this.notificationHour,
    required this.notificationMinute,
    required this.notificationsEnabled,
  });

  final int id;
  final String nom;
  final double progression;
  final int niveau;
  final int streakDays;
  final DateTime? lastCombatDate;
  final double todayProgressGain;
  final DateTime? lastProgressDate;
  final DateTime? lastDeclineDate;
  final int totalCombats;
  final int notificationHour;
  final int notificationMinute;
  final bool notificationsEnabled;

  Veilleur copyWith({
    String? nom,
    double? progression,
    int? niveau,
    int? streakDays,
    DateTime? lastCombatDate,
    double? todayProgressGain,
    DateTime? lastProgressDate,
    DateTime? lastDeclineDate,
    int? totalCombats,
    int? notificationHour,
    int? notificationMinute,
    bool? notificationsEnabled,
  }) {
    return Veilleur(
      id: id,
      nom: nom ?? this.nom,
      progression: progression ?? this.progression,
      niveau: niveau ?? this.niveau,
      streakDays: streakDays ?? this.streakDays,
      lastCombatDate: lastCombatDate ?? this.lastCombatDate,
      todayProgressGain: todayProgressGain ?? this.todayProgressGain,
      lastProgressDate: lastProgressDate ?? this.lastProgressDate,
      lastDeclineDate: lastDeclineDate ?? this.lastDeclineDate,
      totalCombats: totalCombats ?? this.totalCombats,
      notificationHour: notificationHour ?? this.notificationHour,
      notificationMinute: notificationMinute ?? this.notificationMinute,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
