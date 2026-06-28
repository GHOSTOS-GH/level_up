import '../entities/message_secret.dart';

abstract class MessageRepository {
  Future<List<MessageSecret>> getAllMessages();
  Future<MessageSecret?> revealNextMessage(int streakDays);
  Future<void> saveMessage(MessageSecret message);
  Future<void> initializeMessages(List<MessageSecret> messages);
}
