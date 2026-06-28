import '../../domain/entities/defi.dart';

class DailyChallengeTemplate {
  const DailyChallengeTemplate({
    required this.dayOfWeek,
    required this.name,
    required this.exercise,
    required this.targetSets,
    required this.targetReps,
    required this.quote,
    required this.bonusProgress,
    required this.coefficient,
  });

  final int dayOfWeek;
  final String name;
  final String exercise;
  final int targetSets;
  final int targetReps;
  final String quote;
  final double bonusProgress;
  final double coefficient;
}

class DailyChallenges {
  DailyChallenges._();

  static const List<DailyChallengeTemplate> templates = [
    DailyChallengeTemplate(
      dayOfWeek: DateTime.monday,
      name: 'Cardiaque',
      exercise: 'Burpees',
      targetSets: 4,
      targetReps: 15,
      quote: 'Le cœur du Veilleur bat au rythme du Mur qui recule.',
      bonusProgress: 2.0,
      coefficient: 1.2,
    ),
    DailyChallengeTemplate(
      dayOfWeek: DateTime.tuesday,
      name: 'Force',
      exercise: 'Pompes',
      targetSets: 5,
      targetReps: 12,
      quote: 'Chaque muscle tendu est une pierre arrachée au Mur.',
      bonusProgress: 2.0,
      coefficient: 1.0,
    ),
    DailyChallengeTemplate(
      dayOfWeek: DateTime.wednesday,
      name: 'Souplesse',
      exercise: 'Squats',
      targetSets: 4,
      targetReps: 20,
      quote: 'La souplesse du corps ouvre les fissures de l\'ombre.',
      bonusProgress: 1.5,
      coefficient: 0.9,
    ),
    DailyChallengeTemplate(
      dayOfWeek: DateTime.thursday,
      name: 'Explosif',
      exercise: 'Jumping Jacks',
      targetSets: 5,
      targetReps: 25,
      quote: 'L\'explosion de force fait trembler les fondations.',
      bonusProgress: 2.5,
      coefficient: 1.1,
    ),
    DailyChallengeTemplate(
      dayOfWeek: DateTime.friday,
      name: 'Technique',
      exercise: 'Gainage',
      targetSets: 3,
      targetReps: 45,
      quote: 'La précision du Veilleur grave des runes dans la pierre.',
      bonusProgress: 2.0,
      coefficient: 0.8,
    ),
    DailyChallengeTemplate(
      dayOfWeek: DateTime.saturday,
      name: 'Complet',
      exercise: 'Circuit Mixte',
      targetSets: 6,
      targetReps: 10,
      quote: 'Le Mur cède devant la détermination totale.',
      bonusProgress: 3.0,
      coefficient: 1.3,
    ),
    DailyChallengeTemplate(
      dayOfWeek: DateTime.sunday,
      name: 'Repos',
      exercise: 'Étirements',
      targetSets: 3,
      targetReps: 30,
      quote: 'Même les Veilleurs doivent écouter le silence entre les batailles.',
      bonusProgress: 1.0,
      coefficient: 0.5,
    ),
  ];

  static DailyChallengeTemplate forDay(int dayOfWeek) {
    return templates.firstWhere(
      (t) => t.dayOfWeek == dayOfWeek,
      orElse: () => templates.first,
    );
  }

  static Defi toDefi(DailyChallengeTemplate template, DateTime date) {
    return Defi(
      id: date.millisecondsSinceEpoch,
      dayOfWeek: template.dayOfWeek,
      name: template.name,
      exercise: template.exercise,
      targetSets: template.targetSets,
      targetReps: template.targetReps,
      quote: template.quote,
      bonusProgress: template.bonusProgress,
      coefficient: template.coefficient,
      date: date,
    );
  }
}
