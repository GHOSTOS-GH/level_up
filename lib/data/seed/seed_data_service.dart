import '../../core/constants/narrative_constants.dart';
import '../../domain/entities/narrative_entities.dart';
import '../../domain/entities/rune.dart';
import '../../domain/repositories/repositories.dart';

class SeedDataService {
  SeedDataService({
    required MessageRepository messageRepository,
    required RuneRepository runeRepository,
  })  : _messageRepository = messageRepository,
        _runeRepository = runeRepository;

  final MessageRepository _messageRepository;
  final RuneRepository _runeRepository;

  Future<void> seedIfNeeded() async {
    final messages = NarrativeConstants.secretMessages.asMap().entries.map((entry) {
      return MessageSecret(
        id: entry.key + 1,
        content: entry.value,
        requiredStreak: (entry.key + 1) * 3,
        revealed: false,
        revealedAt: null,
      );
    }).toList();

    await _messageRepository.initializeMessages(messages);

    const defaultRunes = [
      Rune(
        id: 1,
        type: RuneType.progressionBoost,
        name: 'Rune de Feu',
        description: '+10% progression sur 3 combats',
        unlocked: false,
        active: false,
        remainingCombats: 0,
        boostPercent: 10,
      ),
      Rune(
        id: 2,
        type: RuneType.streakShield,
        name: 'Rune de Bouclier',
        description: '+15% progression sur 3 combats',
        unlocked: false,
        active: false,
        remainingCombats: 0,
        boostPercent: 15,
      ),
      Rune(
        id: 3,
        type: RuneType.doubleBonus,
        name: 'Rune de Lumière',
        description: '+20% progression sur 3 combats',
        unlocked: false,
        active: false,
        remainingCombats: 0,
        boostPercent: 20,
      ),
    ];

    await _runeRepository.initializeRunes(defaultRunes);
  }
}
