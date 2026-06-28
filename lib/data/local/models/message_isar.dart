import 'package:isar/isar.dart';

part 'message_isar.g.dart';

@collection
class MessageIsar {
  Id id = Isar.autoIncrement;

  late String content;
  int requiredStreak = 1;
  bool revealed = false;
  DateTime? revealedAt;
}
