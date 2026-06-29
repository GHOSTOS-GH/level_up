import '../../domain/entities/narrative_entities.dart';
import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../mappers/entity_mapper.dart';

class MessageRepositoryImpl implements MessageRepository {
  @override
  Future<List<MessageSecret>> getAllMessages() async {
    final box = HiveService.messageBox;
    return box.toMap().entries
        .map((e) => EntityMapper.toMessage(e.key as int, e.value))
        .toList();
  }

  @override
  Future<MessageSecret?> revealNextMessage(int streakDays) async {
    final box = HiveService.messageBox;
    final entries = box.toMap().entries.toList();

    // Chercher le premier message non révélé dont le streak requis est atteint
    final entry = entries
        .where((e) => !e.value.revealed && e.value.requiredStreak <= streakDays)
        .fold<MapEntry<dynamic, dynamic>?>(null, (best, e) {
      if (best == null) return e;
      return e.value.requiredStreak < best.value.requiredStreak ? e : best;
    });

    if (entry == null) return null;

    entry.value.revealed = true;
    entry.value.revealedAt = DateTime.now();
    await box.put(entry.key, entry.value);

    return EntityMapper.toMessage(entry.key as int, entry.value);
  }

  @override
  Future<void> saveMessage(MessageSecret message) async {
    await HiveService.messageBox.put(message.id, EntityMapper.fromMessage(message));
  }

  @override
  Future<void> initializeMessages(List<MessageSecret> messages) async {
    final box = HiveService.messageBox;
    if (box.isNotEmpty) return;

    final entries = {
      for (final m in messages) m.id: EntityMapper.fromMessage(m),
    };
    await box.putAll(entries);
  }
}