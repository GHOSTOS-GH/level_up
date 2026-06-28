import 'package:isar/isar.dart';

import 'serie_combat_isar.dart';

part 'combat_isar.g.dart';

@collection
class CombatIsar {
  Id id = Isar.autoIncrement;

  @Index()
  late String exercise;

  @Index()
  late DateTime date;

  List<SerieCombatIsar> series = [];

  int durationMinutes = 0;
  double calories = 0;
  double progressionGain = 0;
  String? defiName;
  double coefficient = 1.0;
}
