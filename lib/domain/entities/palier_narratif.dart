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
