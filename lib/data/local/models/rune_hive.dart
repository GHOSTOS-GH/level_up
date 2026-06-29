import 'package:hive_ce/hive.dart';

part 'rune_hive.g.dart';

@HiveType(typeId: 5)
class RuneHive extends HiveObject {
  @HiveField(0) late String type;
  @HiveField(1) late String name;
  @HiveField(2) late String description;
  @HiveField(3) bool unlocked = false;
  @HiveField(4) bool active = false;
  @HiveField(5) int remainingCombats = 0;
  @HiveField(6) double boostPercent = 10;
}