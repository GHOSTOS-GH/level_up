import 'package:isar/isar.dart';

import '../../domain/entities/narrative_entities.dart';
import '../../domain/repositories/repositories.dart';
import '../local/isar_service.dart';
import '../local/models/message_isar.dart';
import '../mappers/entity_mapper.dart';

class MessageRepositoryImpl implements MessageRepository {
  MessageRepositoryImpl(this._isar);

  final Isar _isar;

  static Future<MessageRepositoryImpl> create() async {
    final isar = await IsarService.getInstance();
    return MessageRepositoryImpl(isar);
  }

  @override
  Future<List<MessageSecret>> getAllMessages() async {
    final messages = await _isar.messageIsars.where().findAll();
    return messages.map(EntityMapper.toMessage).toList();
  }

  @override
  Future<MessageSecret?> revealNextMessage(int streakDays) async {
    final unrevealed = await _isar.messageIsars
        .filter()
        .revealedEqualTo(false)
        .requiredStreakLessThan(streakDays + 1, include: true)
        .findFirst();

    if (unrevealed == null) return null;

    unrevealed.revealed = true;
    unrevealed.revealedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.messageIsars.put(unrevealed);
    });

    return EntityMapper.toMessage(unrevealed);
  }

  @override
  Future<void> saveMessage(MessageSecret message) async {
    await _isar.writeTxn(() async {
      await _isar.messageIsars.put(EntityMapper.fromMessage(message));
    });
  }

  @override
  Future<void> initializeMessages(List<MessageSecret> messages) async {
    final count = await _isar.messageIsars.count();
    if (count > 0) return;

    await _isar.writeTxn(() async {
      await _isar.messageIsars.putAll(
        messages.map(EntityMapper.fromMessage).toList(),
      );
    });
  }
}
