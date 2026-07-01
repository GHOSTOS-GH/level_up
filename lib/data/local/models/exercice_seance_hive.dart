import 'package:hive_ce/hive.dart';

part 'exercice_seance_hive.g.dart';

@HiveType(typeId: 8)
class ExerciceSeanceHive {
  @HiveField(0) late String nom;
  @HiveField(1) int series = 3;
  @HiveField(2) int repetitions = 10;
  @HiveField(3) int ordre = 0;
  @HiveField(4) bool complete = false;
  @HiveField(5) int? combatId;
}
