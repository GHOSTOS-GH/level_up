import '../../domain/entities/combat.dart';
import '../../domain/entities/defi.dart';
import '../../domain/entities/narrative_entities.dart';
import '../../domain/entities/rune.dart';
import '../../domain/entities/veilleur.dart';
import '../local/models/combat_hive.dart';
import '../local/models/defi_hive.dart';
import '../local/models/message_hive.dart';
import '../local/models/rune_hive.dart';
import '../local/models/serie_combat_hive.dart';
import '../local/models/veilleur_hive.dart';

class EntityMapper {
  // ── Veilleur ──────────────────────────────────────────────────────────────

  static Veilleur toVeilleur(int id, VeilleurHive h) {
    return Veilleur(
      id: id,
      nom: h.nom,
      progression: h.progression,
      niveau: h.niveau,
      streakDays: h.streakDays,
      lastCombatDate: h.lastCombatDate,
      todayProgressGain: h.todayProgressGain,
      lastProgressDate: h.lastProgressDate,
      lastDeclineDate: h.lastDeclineDate,
      totalCombats: h.totalCombats,
      notificationHour: h.notificationHour,
      notificationMinute: h.notificationMinute,
      notificationsEnabled: h.notificationsEnabled,
    );
  }

  static VeilleurHive fromVeilleur(Veilleur e) {
    return VeilleurHive()
      ..nom = e.nom
      ..progression = e.progression
      ..niveau = e.niveau
      ..streakDays = e.streakDays
      ..lastCombatDate = e.lastCombatDate
      ..todayProgressGain = e.todayProgressGain
      ..lastProgressDate = e.lastProgressDate
      ..lastDeclineDate = e.lastDeclineDate
      ..totalCombats = e.totalCombats
      ..notificationHour = e.notificationHour
      ..notificationMinute = e.notificationMinute
      ..notificationsEnabled = e.notificationsEnabled;
  }

  // ── Combat ────────────────────────────────────────────────────────────────

  static Combat toCombat(int id, CombatHive h) {
    return Combat(
      id: id,
      exercise: h.exercise,
      date: h.date,
      series: h.series.map(toSerieCombat).toList(),
      durationMinutes: h.durationMinutes,
      calories: h.calories,
      progressionGain: h.progressionGain,
      defiName: h.defiName,
      coefficient: h.coefficient,
    );
  }

  static CombatHive fromCombat(Combat e) {
    return CombatHive()
      ..exercise = e.exercise
      ..date = e.date
      ..series = e.series.map(fromSerieCombat).toList()
      ..durationMinutes = e.durationMinutes
      ..calories = e.calories
      ..progressionGain = e.progressionGain
      ..defiName = e.defiName
      ..coefficient = e.coefficient;
  }

  static SerieCombat toSerieCombat(SerieCombatHive h) {
    return SerieCombat(index: h.index, reps: h.reps, completed: h.completed);
  }

  static SerieCombatHive fromSerieCombat(SerieCombat e) {
    return SerieCombatHive()
      ..index = e.index
      ..reps = e.reps
      ..completed = e.completed;
  }

  // ── Défi ──────────────────────────────────────────────────────────────────

  static Defi toDefi(int id, DefiHive h) {
    return Defi(
      id: id,
      dayOfWeek: h.dayOfWeek,
      name: h.name,
      exercise: h.exercise,
      targetSets: h.targetSets,
      targetReps: h.targetReps,
      quote: h.quote,
      bonusProgress: h.bonusProgress,
      coefficient: h.coefficient,
      date: h.date,
    );
  }

  static DefiHive fromDefi(Defi e) {
    return DefiHive()
      ..dayOfWeek = e.dayOfWeek
      ..name = e.name
      ..exercise = e.exercise
      ..targetSets = e.targetSets
      ..targetReps = e.targetReps
      ..quote = e.quote
      ..bonusProgress = e.bonusProgress
      ..coefficient = e.coefficient
      ..date = e.date;
  }

  // ── Message ───────────────────────────────────────────────────────────────

  static MessageSecret toMessage(int id, MessageHive h) {
    return MessageSecret(
      id: id,
      content: h.content,
      requiredStreak: h.requiredStreak,
      revealed: h.revealed,
      revealedAt: h.revealedAt,
    );
  }

  static MessageHive fromMessage(MessageSecret e) {
    return MessageHive()
      ..content = e.content
      ..requiredStreak = e.requiredStreak
      ..revealed = e.revealed
      ..revealedAt = e.revealedAt;
  }

  // ── Rune ──────────────────────────────────────────────────────────────────

  static Rune toRune(int id, RuneHive h) {
    return Rune(
      id: id,
      type: _parseRuneType(h.type),
      name: h.name,
      description: h.description,
      unlocked: h.unlocked,
      active: h.active,
      remainingCombats: h.remainingCombats,
      boostPercent: h.boostPercent,
    );
  }

  static RuneHive fromRune(Rune e) {
    return RuneHive()
      ..type = e.type.name
      ..name = e.name
      ..description = e.description
      ..unlocked = e.unlocked
      ..active = e.active
      ..remainingCombats = e.remainingCombats
      ..boostPercent = e.boostPercent;
  }

  static RuneType _parseRuneType(String type) {
    return RuneType.values.firstWhere(
      (e) => e.name == type,
      orElse: () => RuneType.progressionBoost,
    );
  }
}