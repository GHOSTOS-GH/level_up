// ─── Chapitre ─────────────────────────────────────────────────────────────────

class Chapitre {
  const Chapitre({
    required this.name,
    required this.minLevel,
    required this.maxLevel,
    required this.emoji,
  });

  final String name;
  final int minLevel;
  final int maxLevel;
  final String emoji;
}

// ─── Palier narratif ──────────────────────────────────────────────────────────

class PalierNarratif {
  const PalierNarratif({
    required this.minDays,
    required this.maxDays,
    required this.title,
    required this.emoji,
    required this.description,
  });

  final int minDays;
  final int maxDays;
  final String title;
  final String emoji;
  final String description;
}

// ─── Message secret ───────────────────────────────────────────────────────────

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
