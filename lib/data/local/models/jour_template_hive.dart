import 'package:hive_ce/hive.dart';

import 'exercice_template_hive.dart';

part 'jour_template_hive.g.dart';

@HiveType(typeId: 7)
class JourTemplateHive extends HiveObject {
  @HiveField(0) int dayOfWeek = 1;
  @HiveField(1) late String nom;
  @HiveField(2) List<ExerciceTemplateHive> exercices = [];
  @HiveField(3) bool estJourRepos = false;
  @HiveField(4) late String quote;
  @HiveField(5) double bonusProgress = 0;
  @HiveField(6) double coefficient = 1.0;
}
