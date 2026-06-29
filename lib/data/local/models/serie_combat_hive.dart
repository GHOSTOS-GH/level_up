import 'package:hive_ce/hive.dart';

part 'serie_combat_hive.g.dart';

@HiveType(typeId: 0)
class SerieCombatHive {
  @HiveField(0) int index = 0;
  @HiveField(1) int reps = 0;
  @HiveField(2) bool completed = false;
}