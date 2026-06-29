import 'dart:convert';

import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../local/models/combat_hive.dart';
import '../local/models/defi_hive.dart';
import '../local/models/message_hive.dart';
import '../local/models/rune_hive.dart';
import '../local/models/serie_combat_hive.dart';
import '../local/models/veilleur_hive.dart';

class DataExportRepositoryImpl implements DataExportRepository {
  @override
  Future<String> exportToJson() async {
    final data = {
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'veilleur': HiveService.veilleurBox.toMap().entries
          .map((e) => _veilleurToJson(e.key as int, e.value))
          .toList(),
      'combats': HiveService.combatBox.toMap().entries
          .map((e) => _combatToJson(e.key as int, e.value))
          .toList(),
      'defis': HiveService.defiBox.toMap().entries
          .map((e) => _defiToJson(e.key as String, e.value))
          .toList(),
      'messages': HiveService.messageBox.toMap().entries
          .map((e) => _messageToJson(e.key as int, e.value))
          .toList(),
      'runes': HiveService.runeBox.toMap().entries
          .map((e) => _runeToJson(e.key as int, e.value))
          .toList(),
    };
    return const JsonEncoder.withIndent('  ').convert(data);
  }

  @override
  Future<void> importFromJson(String jsonContent) async {
    final data = jsonDecode(jsonContent) as Map<String, dynamic>;

    await HiveService.clearAll();

    for (final v in (data['veilleur'] as List? ?? [])) {
      final m = v as Map<String, dynamic>;
      await HiveService.veilleurBox.put(m['id'] as int, _veilleurFromJson(m));
    }
    for (final c in (data['combats'] as List? ?? [])) {
      final m = c as Map<String, dynamic>;
      await HiveService.combatBox.put(m['id'] as int, _combatFromJson(m));
    }
    for (final d in (data['defis'] as List? ?? [])) {
      final m = d as Map<String, dynamic>;
      await HiveService.defiBox.put(m['dateKey'] as String, _defiFromJson(m));
    }
    for (final msg in (data['messages'] as List? ?? [])) {
      final m = msg as Map<String, dynamic>;
      await HiveService.messageBox.put(m['id'] as int, _messageFromJson(m));
    }
    for (final r in (data['runes'] as List? ?? [])) {
      final m = r as Map<String, dynamic>;
      await HiveService.runeBox.put(m['id'] as int, _runeFromJson(m));
    }
  }

  // ── Serializers ────────────────────────────────────────────────────────────

  Map<String, dynamic> _veilleurToJson(int id, VeilleurHive v) => {
        'id': id,
        'nom': v.nom,
        'progression': v.progression,
        'niveau': v.niveau,
        'streakDays': v.streakDays,
        'lastCombatDate': v.lastCombatDate?.toIso8601String(),
        'todayProgressGain': v.todayProgressGain,
        'lastProgressDate': v.lastProgressDate?.toIso8601String(),
        'lastDeclineDate': v.lastDeclineDate?.toIso8601String(),
        'totalCombats': v.totalCombats,
        'notificationHour': v.notificationHour,
        'notificationMinute': v.notificationMinute,
        'notificationsEnabled': v.notificationsEnabled,
      };

  VeilleurHive _veilleurFromJson(Map<String, dynamic> j) => VeilleurHive()
    ..nom = j['nom'] as String
    ..progression = (j['progression'] as num).toDouble()
    ..niveau = j['niveau'] as int
    ..streakDays = j['streakDays'] as int
    ..lastCombatDate = j['lastCombatDate'] != null
        ? DateTime.parse(j['lastCombatDate'] as String)
        : null
    ..todayProgressGain = (j['todayProgressGain'] as num).toDouble()
    ..lastProgressDate = j['lastProgressDate'] != null
        ? DateTime.parse(j['lastProgressDate'] as String)
        : null
    ..lastDeclineDate = j['lastDeclineDate'] != null
        ? DateTime.parse(j['lastDeclineDate'] as String)
        : null
    ..totalCombats = j['totalCombats'] as int
    ..notificationHour = j['notificationHour'] as int
    ..notificationMinute = j['notificationMinute'] as int
    ..notificationsEnabled = j['notificationsEnabled'] as bool;

  Map<String, dynamic> _combatToJson(int id, CombatHive c) => {
        'id': id,
        'exercise': c.exercise,
        'date': c.date.toIso8601String(),
        'series': c.series
            .map((s) => {'index': s.index, 'reps': s.reps, 'completed': s.completed})
            .toList(),
        'durationMinutes': c.durationMinutes,
        'calories': c.calories,
        'progressionGain': c.progressionGain,
        'defiName': c.defiName,
        'coefficient': c.coefficient,
      };

  CombatHive _combatFromJson(Map<String, dynamic> j) => CombatHive()
    ..exercise = j['exercise'] as String
    ..date = DateTime.parse(j['date'] as String)
    ..series = (j['series'] as List)
        .map((s) {
          final m = s as Map<String, dynamic>;
          return SerieCombatHive()
            ..index = m['index'] as int
            ..reps = m['reps'] as int
            ..completed = m['completed'] as bool;
        })
        .toList()
    ..durationMinutes = j['durationMinutes'] as int
    ..calories = (j['calories'] as num).toDouble()
    ..progressionGain = (j['progressionGain'] as num).toDouble()
    ..defiName = j['defiName'] as String?
    ..coefficient = (j['coefficient'] as num).toDouble();

  Map<String, dynamic> _defiToJson(String dateKey, DefiHive d) => {
        'dateKey': dateKey,
        'dayOfWeek': d.dayOfWeek,
        'name': d.name,
        'exercise': d.exercise,
        'targetSets': d.targetSets,
        'targetReps': d.targetReps,
        'quote': d.quote,
        'bonusProgress': d.bonusProgress,
        'coefficient': d.coefficient,
        'date': d.date.toIso8601String(),
      };

  DefiHive _defiFromJson(Map<String, dynamic> j) => DefiHive()
    ..dayOfWeek = j['dayOfWeek'] as int
    ..name = j['name'] as String
    ..exercise = j['exercise'] as String
    ..targetSets = j['targetSets'] as int
    ..targetReps = j['targetReps'] as int
    ..quote = j['quote'] as String
    ..bonusProgress = (j['bonusProgress'] as num).toDouble()
    ..coefficient = (j['coefficient'] as num).toDouble()
    ..date = DateTime.parse(j['date'] as String);

  Map<String, dynamic> _messageToJson(int id, MessageHive m) => {
        'id': id,
        'content': m.content,
        'requiredStreak': m.requiredStreak,
        'revealed': m.revealed,
        'revealedAt': m.revealedAt?.toIso8601String(),
      };

  MessageHive _messageFromJson(Map<String, dynamic> j) => MessageHive()
    ..content = j['content'] as String
    ..requiredStreak = j['requiredStreak'] as int
    ..revealed = j['revealed'] as bool
    ..revealedAt = j['revealedAt'] != null
        ? DateTime.parse(j['revealedAt'] as String)
        : null;

  Map<String, dynamic> _runeToJson(int id, RuneHive r) => {
        'id': id,
        'type': r.type,
        'name': r.name,
        'description': r.description,
        'unlocked': r.unlocked,
        'active': r.active,
        'remainingCombats': r.remainingCombats,
        'boostPercent': r.boostPercent,
      };

  RuneHive _runeFromJson(Map<String, dynamic> j) => RuneHive()
    ..type = j['type'] as String
    ..name = j['name'] as String
    ..description = j['description'] as String
    ..unlocked = j['unlocked'] as bool
    ..active = j['active'] as bool
    ..remainingCombats = j['remainingCombats'] as int
    ..boostPercent = (j['boostPercent'] as num).toDouble();
}