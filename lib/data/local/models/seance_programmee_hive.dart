import 'package:hive_ce/hive.dart';

import 'exercice_seance_hive.dart';

part 'seance_programmee_hive.g.dart';

@HiveType(typeId: 9)
class SeanceProgrammeeHive extends HiveObject {
  @HiveField(0) late DateTime date;
  @HiveField(1) late String nom;
  @HiveField(2) List<ExerciceSeanceHive> exercices = [];
  @HiveField(3) bool estJourRepos = false;
  @HiveField(4) late String quote;
  @HiveField(5) double bonusProgress = 0;
  @HiveField(6) double coefficient = 1.0;
  @HiveField(7) bool bonusApplique = false;
}
