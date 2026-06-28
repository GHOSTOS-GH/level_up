import '../../domain/entities/chapitre.dart';
import '../../domain/entities/palier_narratif.dart';

class NarrativeConstants {
  NarrativeConstants._();

  static PalierNarratif palierForStreak(int streakDays) {
    if (streakDays >= 31) {
      return const PalierNarratif(
        minDays: 31,
        maxDays: 999,
        title: 'La Lumière Perce',
        emoji: '✨',
        description: 'La lumière perce à travers le Mur. Les secrets sont à portée de main.',
      );
    }
    if (streakDays >= 15) {
      return const PalierNarratif(
        minDays: 15,
        maxDays: 30,
        title: 'La Fissure S\'ouvre',
        emoji: '💀',
        description: 'Une fissure majeure se dessine. Le Mur vacille sous vos efforts.',
      );
    }
    if (streakDays >= 8) {
      return const PalierNarratif(
        minDays: 8,
        maxDays: 14,
        title: 'Le Mur Tremble',
        emoji: '🌊',
        description: 'Les vibrations de vos combats font trembler le Mur.',
      );
    }
    if (streakDays >= 4) {
      return const PalierNarratif(
        minDays: 4,
        maxDays: 7,
        title: 'Les Ombres Dansent',
        emoji: '👻',
        description: 'Les ombres reculent devant votre persévérance.',
      );
    }
    return const PalierNarratif(
      minDays: 1,
      maxDays: 3,
      title: 'La Brume s\'épaissit',
      emoji: '🌫️',
      description: 'La brume se lève. Chaque combat compte pour percer l\'obscurité.',
    );
  }

  static Chapitre chapitreForLevel(int level) {
    if (level >= 76) {
      return const Chapitre(
        name: 'L\'Ascension',
        minLevel: 76,
        maxLevel: 999,
        emoji: '🏔️',
      );
    }
    if (level >= 51) {
      return const Chapitre(
        name: 'La Révélation',
        minLevel: 51,
        maxLevel: 75,
        emoji: '🔮',
      );
    }
    if (level >= 26) {
      return const Chapitre(
        name: 'La Quête',
        minLevel: 26,
        maxLevel: 50,
        emoji: '⚔️',
      );
    }
    if (level >= 11) {
      return const Chapitre(
        name: 'La Résistance',
        minLevel: 11,
        maxLevel: 25,
        emoji: '🛡️',
      );
    }
    return const Chapitre(
      name: 'L\'Éveil',
      minLevel: 1,
      maxLevel: 10,
      emoji: '🌅',
    );
  }

  static int levelFromTotalCombats(int totalCombats) {
    return (totalCombats ~/ 3) + 1;
  }

  static const List<String> secretMessages = [
    'Le Mur garde la mémoire de tous ceux qui ont faibli avant vous.',
    'Chaque fissure révèle un fragment de la vérité oubliée.',
    'Les runes anciennes murmurent : la constance est la clé.',
    'Au-delà du Mur, d\'autres Veilleurs attendent le signal.',
    'La lumière ne perce qu\'à ceux qui refusent l\'abandon.',
    'Le déclin quotidien est l\'épreuve ultime de la volonté.',
    'Sept jours de feu forgent la première rune sacrée.',
    'Le dimanche n\'est pas une faiblesse, c\'est une stratégie.',
    'Les ombres dansent, mais elles ne gagnent jamais.',
    'Votre nom sera gravé dans la pierre quand le Mur tombera.',
  ];
}
