import '../../../domain/entities/combat.dart';
import '../../../domain/entities/defi.dart';
import '../../../domain/entities/narrative_entities.dart';
import '../../../domain/entities/rune.dart';
import '../../../domain/entities/veilleur.dart';
import '../local/models/combat_isar.dart';
import '../local/models/defi_isar.dart';
import '../local/models/message_isar.dart';
import '../local/models/rune_isar.dart';
import '../local/models/serie_combat_isar.dart';
import '../local/models/veilleur_isar.dart';

class EntityMapper {
  static Veilleur toVeilleur(VeilleurIsar isar) {
    return Veilleur(
      id: isar.id,
      nom: isar.nom,
      progression: isar.progression,
      niveau: isar.niveau,
      streakDays: isar.streakDays,
      lastCombatDate: isar.lastCombatDate,
      todayProgressGain: isar.todayProgressGain,
      lastProgressDate: isar.lastProgressDate,
      lastDeclineDate: isar.lastDeclineDate,
      totalCombats: isar.totalCombats,
      notificationHour: isar.notificationHour,
      notificationMinute: isar.notificationMinute,
      notificationsEnabled: isar.notificationsEnabled,
    );
  }

  static VeilleurIsar fromVeilleur(Veilleur entity) {
    return VeilleurIsar()
      ..id = entity.id
      ..nom = entity.nom
      ..progression = entity.progression
      ..niveau = entity.niveau
      ..streakDays = entity.streakDays
      ..lastCombatDate = entity.lastCombatDate
      ..todayProgressGain = entity.todayProgressGain
      ..lastProgressDate = entity.lastProgressDate
      ..lastDeclineDate = entity.lastDeclineDate
      ..totalCombats = entity.totalCombats
      ..notificationHour = entity.notificationHour
      ..notificationMinute = entity.notificationMinute
      ..notificationsEnabled = entity.notificationsEnabled;
  }

  static Combat toCombat(CombatIsar isar) {
    return Combat(
      id: isar.id,
      exercise: isar.exercise,
      date: isar.date,
      series: isar.series.map(toSerieCombat).toList(),
      durationMinutes: isar.durationMinutes,
      calories: isar.calories,
      progressionGain: isar.progressionGain,
      defiName: isar.defiName,
      coefficient: isar.coefficient,
    );
  }

  static CombatIsar fromCombat(Combat entity) {
    return CombatIsar()
      ..id = entity.id
      ..exercise = entity.exercise
      ..date = entity.date
      ..series = entity.series.map(fromSerieCombat).toList()
      ..durationMinutes = entity.durationMinutes
      ..calories = entity.calories
      ..progressionGain = entity.progressionGain
      ..defiName = entity.defiName
      ..coefficient = entity.coefficient;
  }

  static SerieCombat toSerieCombat(SerieCombatIsar isar) {
    return SerieCombat(
      index: isar.index,
      reps: isar.reps,
      completed: isar.completed,
    );
  }

  static SerieCombatIsar fromSerieCombat(SerieCombat entity) {
    return SerieCombatIsar()
      ..index = entity.index
      ..reps = entity.reps
      ..completed = entity.completed;
  }

  static Defi toDefi(DefiIsar isar) {
    return Defi(
      id: isar.id,
      dayOfWeek: isar.dayOfWeek,
      name: isar.name,
      exercise: isar.exercise,
      targetSets: isar.targetSets,
      targetReps: isar.targetReps,
      quote: isar.quote,
      bonusProgress: isar.bonusProgress,
      coefficient: isar.coefficient,
      date: isar.date,
    );
  }

  static DefiIsar fromDefi(Defi entity) {
    return DefiIsar()
      ..id = entity.id
      ..dayOfWeek = entity.dayOfWeek
      ..name = entity.name
      ..exercise = entity.exercise
      ..targetSets = entity.targetSets
      ..targetReps = entity.targetReps
      ..quote = entity.quote
      ..bonusProgress = entity.bonusProgress
      ..coefficient = entity.coefficient
      ..date = entity.date;
  }

  static MessageSecret toMessage(MessageIsar isar) {
    return MessageSecret(
      id: isar.id,
      content: isar.content,
      requiredStreak: isar.requiredStreak,
      revealed: isar.revealed,
      revealedAt: isar.revealedAt,
    );
  }

  static MessageIsar fromMessage(MessageSecret entity) {
    return MessageIsar()
      ..id = entity.id
      ..content = entity.content
      ..requiredStreak = entity.requiredStreak
      ..revealed = entity.revealed
      ..revealedAt = entity.revealedAt;
  }

  static Rune toRune(RuneIsar isar) {
    return Rune(
      id: isar.id,
      type: _parseRuneType(isar.type),
      name: isar.name,
      description: isar.description,
      unlocked: isar.unlocked,
      active: isar.active,
      remainingCombats: isar.remainingCombats,
      boostPercent: isar.boostPercent,
    );
  }

  static RuneIsar fromRune(Rune entity) {
    return RuneIsar()
      ..id = entity.id
      ..type = entity.type.name
      ..name = entity.name
      ..description = entity.description
      ..unlocked = entity.unlocked
      ..active = entity.active
      ..remainingCombats = entity.remainingCombats
      ..boostPercent = entity.boostPercent;
  }

  static RuneType _parseRuneType(String type) {
    return RuneType.values.firstWhere(
      (e) => e.name == type,
      orElse: () => RuneType.progressionBoost,
    );
  }
}
