import 'package:hive_ce/hive.dart';

part 'defi_hive.g.dart';

@HiveType(typeId: 3)
class DefiHive extends HiveObject {
  @HiveField(0) int dayOfWeek = 1;
  @HiveField(1) late String name;
  @HiveField(2) late String exercise;
  @HiveField(3) int targetSets = 3;
  @HiveField(4) int targetReps = 10;
  @HiveField(5) late String quote;
  @HiveField(6) double bonusProgress = 0;
  @HiveField(7) double coefficient = 1.0;
  @HiveField(8) late DateTime date;
}