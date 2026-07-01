import 'package:hive_ce/hive.dart';

part 'exercice_template_hive.g.dart';

@HiveType(typeId: 6)
class ExerciceTemplateHive {
  @HiveField(0) late String nom;
  @HiveField(1) int series = 3;
  @HiveField(2) int repetitions = 10;
  @HiveField(3) int ordre = 0;
}
