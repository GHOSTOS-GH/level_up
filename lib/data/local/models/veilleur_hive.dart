import 'package:hive_ce/hive.dart';

part 'veilleur_hive.g.dart';

@HiveType(typeId: 1)
class VeilleurHive extends HiveObject {
  @HiveField(0) String nom = 'Veilleur';
  @HiveField(1) double progression = 0;
  @HiveField(2) int niveau = 1;
  @HiveField(3) int streakDays = 0;
  @HiveField(4) DateTime? lastCombatDate;
  @HiveField(5) double todayProgressGain = 0;
  @HiveField(6) DateTime? lastProgressDate;
  @HiveField(7) DateTime? lastDeclineDate;
  @HiveField(8) int totalCombats = 0;
  @HiveField(9) int notificationHour = 8;
  @HiveField(10) int notificationMinute = 0;
  @HiveField(11) bool notificationsEnabled = false;
}