import 'package:hive_ce/hive.dart';

part 'message_hive.g.dart';

@HiveType(typeId: 4)
class MessageHive extends HiveObject {
  @HiveField(0) late String content;
  @HiveField(1) int requiredStreak = 1;
  @HiveField(2) bool revealed = false;
  @HiveField(3) DateTime? revealedAt;
}