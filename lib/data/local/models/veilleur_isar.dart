import 'package:isar/isar.dart';

part 'veilleur_isar.g.dart';

@collection
class VeilleurIsar {
  Id id = 1;

  String nom = 'Veilleur';

  @Index()
  double progression = 0;

  int niveau = 1;
  int streakDays = 0;

  DateTime? lastCombatDate;
  double todayProgressGain = 0;
  DateTime? lastProgressDate;
  DateTime? lastDeclineDate;

  int totalCombats = 0;

  int notificationHour = 8;
  int notificationMinute = 0;
  bool notificationsEnabled = false;
}
