class MessageSecret {
  const MessageSecret({
    required this.id,
    required this.content,
    required this.requiredStreak,
    required this.revealed,
    required this.revealedAt,
  });

  final int id;
  final String content;
  final int requiredStreak;
  final bool revealed;
  final DateTime? revealedAt;
}
