import 'package:hive_ce/hive.dart';

import 'serie_combat_hive.dart';

part 'combat_hive.g.dart';

@HiveType(typeId: 2)
class CombatHive extends HiveObject {
  @HiveField(0) late String exercise;
  @HiveField(1) late DateTime date;
  @HiveField(2) List<SerieCombatHive> series = [];
  @HiveField(3) int durationMinutes = 0;
  @HiveField(4) double calories = 0;
  @HiveField(5) double progressionGain = 0;
  @HiveField(6) String? defiName;
  @HiveField(7) double coefficient = 1.0;
}