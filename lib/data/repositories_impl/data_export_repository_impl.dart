import 'dart:convert';

import 'package:isar/isar.dart';

import '../../domain/repositories/data_export_repository.dart';
import '../local/isar_service.dart';
import '../local/models/combat_isar.dart';
import '../local/models/defi_isar.dart';
import '../local/models/message_isar.dart';
import '../local/models/rune_isar.dart';
import '../local/models/serie_combat_isar.dart';
import '../local/models/veilleur_isar.dart';

class DataExportRepositoryImpl implements DataExportRepository {
  DataExportRepositoryImpl(this._isar);

  final Isar _isar;

  static Future<DataExportRepositoryImpl> create() async {
    final isar = await IsarService.getInstance();
    return DataExportRepositoryImpl(isar);
  }

  @override
  Future<String> exportToJson() async {
    final veilleur = await _isar.veilleurIsars.where().findAll();
    final combats = await _isar.combatIsars.where().findAll();
    final defis = await _isar.defiIsars.where().findAll();
    final messages = await _isar.messageIsars.where().findAll();
    final runes = await _isar.runeIsars.where().findAll();

    final data = {
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'veilleur': veilleur.map(_veilleurToJson).toList(),
      'combats': combats.map(_combatToJson).toList(),
      'defis': defis.map(_defiToJson).toList(),
      'messages': messages.map(_messageToJson).toList(),
      'runes': runes.map(_runeToJson).toList(),
    };

    return const JsonEncoder.withIndent('  ').convert(data);
  }

  @override
  Future<void> importFromJson(String jsonContent) async {
    final data = jsonDecode(jsonContent) as Map<String, dynamic>;

    await _isar.writeTxn(() async {
      await _isar.clear();

      final veilleurs = (data['veilleur'] as List?) ?? [];
      for (final v in veilleurs) {
        await _isar.veilleurIsars.put(_veilleurFromJson(v as Map<String, dynamic>));
      }

      final combats = (data['combats'] as List?) ?? [];
      for (final c in combats) {
        await _isar.combatIsars.put(_combatFromJson(c as Map<String, dynamic>));
      }

      final defis = (data['defis'] as List?) ?? [];
      for (final d in defis) {
        await _isar.defiIsars.put(_defiFromJson(d as Map<String, dynamic>));
      }

      final messages = (data['messages'] as List?) ?? [];
      for (final m in messages) {
        await _isar.messageIsars.put(_messageFromJson(m as Map<String, dynamic>));
      }

      final runes = (data['runes'] as List?) ?? [];
      for (final r in runes) {
        await _isar.runeIsars.put(_runeFromJson(r as Map<String, dynamic>));
      }
    });
  }

  Map<String, dynamic> _veilleurToJson(VeilleurIsar v) => {
        'id': v.id,
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

  VeilleurIsar _veilleurFromJson(Map<String, dynamic> json) {
    return VeilleurIsar()
      ..id = json['id'] as int
      ..nom = json['nom'] as String
      ..progression = (json['progression'] as num).toDouble()
      ..niveau = json['niveau'] as int
      ..streakDays = json['streakDays'] as int
      ..lastCombatDate = json['lastCombatDate'] != null
          ? DateTime.parse(json['lastCombatDate'] as String)
          : null
      ..todayProgressGain = (json['todayProgressGain'] as num).toDouble()
      ..lastProgressDate = json['lastProgressDate'] != null
          ? DateTime.parse(json['lastProgressDate'] as String)
          : null
      ..lastDeclineDate = json['lastDeclineDate'] != null
          ? DateTime.parse(json['lastDeclineDate'] as String)
          : null
      ..totalCombats = json['totalCombats'] as int
      ..notificationHour = json['notificationHour'] as int
      ..notificationMinute = json['notificationMinute'] as int
      ..notificationsEnabled = json['notificationsEnabled'] as bool;
  }

  Map<String, dynamic> _combatToJson(CombatIsar c) => {
        'id': c.id,
        'exercise': c.exercise,
        'date': c.date.toIso8601String(),
        'series': c.series
            .map((s) => {
                  'index': s.index,
                  'reps': s.reps,
                  'completed': s.completed,
                })
            .toList(),
        'durationMinutes': c.durationMinutes,
        'calories': c.calories,
        'progressionGain': c.progressionGain,
        'defiName': c.defiName,
        'coefficient': c.coefficient,
      };

  CombatIsar _combatFromJson(Map<String, dynamic> json) {
    return CombatIsar()
      ..id = json['id'] as int
      ..exercise = json['exercise'] as String
      ..date = DateTime.parse(json['date'] as String)
      ..series = (json['series'] as List)
          .map((s) {
            final m = s as Map<String, dynamic>;
            return SerieCombatIsar()
              ..index = m['index'] as int
              ..reps = m['reps'] as int
              ..completed = m['completed'] as bool;
          })
          .toList()
      ..durationMinutes = json['durationMinutes'] as int
      ..calories = (json['calories'] as num).toDouble()
      ..progressionGain = (json['progressionGain'] as num).toDouble()
      ..defiName = json['defiName'] as String?
      ..coefficient = (json['coefficient'] as num).toDouble();
  }

  Map<String, dynamic> _defiToJson(DefiIsar d) => {
        'id': d.id,
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

  DefiIsar _defiFromJson(Map<String, dynamic> json) {
    return DefiIsar()
      ..id = json['id'] as int
      ..dayOfWeek = json['dayOfWeek'] as int
      ..name = json['name'] as String
      ..exercise = json['exercise'] as String
      ..targetSets = json['targetSets'] as int
      ..targetReps = json['targetReps'] as int
      ..quote = json['quote'] as String
      ..bonusProgress = (json['bonusProgress'] as num).toDouble()
      ..coefficient = (json['coefficient'] as num).toDouble()
      ..date = DateTime.parse(json['date'] as String);
  }

  Map<String, dynamic> _messageToJson(MessageIsar m) => {
        'id': m.id,
        'content': m.content,
        'requiredStreak': m.requiredStreak,
        'revealed': m.revealed,
        'revealedAt': m.revealedAt?.toIso8601String(),
      };

  MessageIsar _messageFromJson(Map<String, dynamic> json) {
    return MessageIsar()
      ..id = json['id'] as int
      ..content = json['content'] as String
      ..requiredStreak = json['requiredStreak'] as int
      ..revealed = json['revealed'] as bool
      ..revealedAt = json['revealedAt'] != null
          ? DateTime.parse(json['revealedAt'] as String)
          : null;
  }

  Map<String, dynamic> _runeToJson(RuneIsar r) => {
        'id': r.id,
        'type': r.type,
        'name': r.name,
        'description': r.description,
        'unlocked': r.unlocked,
        'active': r.active,
        'remainingCombats': r.remainingCombats,
        'boostPercent': r.boostPercent,
      };

  RuneIsar _runeFromJson(Map<String, dynamic> json) {
    return RuneIsar()
      ..id = json['id'] as int
      ..type = json['type'] as String
      ..name = json['name'] as String
      ..description = json['description'] as String
      ..unlocked = json['unlocked'] as bool
      ..active = json['active'] as bool
      ..remainingCombats = json['remainingCombats'] as int
      ..boostPercent = (json['boostPercent'] as num).toDouble();
  }
}
