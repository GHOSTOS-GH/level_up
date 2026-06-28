import 'package:isar/isar.dart';

part 'defi_isar.g.dart';

@collection
class DefiIsar {
  Id id = Isar.autoIncrement;

  int dayOfWeek = 1;
  late String name;
  late String exercise;
  int targetSets = 3;
  int targetReps = 10;
  late String quote;
  double bonusProgress = 0;
  double coefficient = 1.0;

  @Index()
  late DateTime date;
}
