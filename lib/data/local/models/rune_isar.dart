import 'package:isar/isar.dart';

part 'rune_isar.g.dart';

@collection
class RuneIsar {
  Id id = Isar.autoIncrement;

  late String type;
  late String name;
  late String description;
  bool unlocked = false;
  bool active = false;
  int remainingCombats = 0;
  double boostPercent = 10;
}
