import 'package:isar/isar.dart';

import '../../domain/entities/combat.dart';
import '../../domain/entities/combat_result.dart';
import '../../domain/repositories/combat_repository.dart';
import '../local/isar_service.dart';
import '../local/models/combat_isar.dart';
import '../mappers/entity_mapper.dart';

class CombatRepositoryImpl implements CombatRepository {
  CombatRepositoryImpl(this._isar);

  final Isar _isar;

  static Future<CombatRepositoryImpl> create() async {
    final isar = await IsarService.getInstance();
    return CombatRepositoryImpl(isar);
  }

  @override
  Future<List<Combat>> getAllCombats() async {
    final combats = await _isar.combatIsars.where().sortByDateDesc().findAll();
    return combats.map(EntityMapper.toCombat).toList();
  }

  @override
  Future<List<Combat>> getCombatsByExercise(String exercise) async {
    final combats = await _isar.combatIsars
        .filter()
        .exerciseEqualTo(exercise)
        .sortByDateDesc()
        .findAll();
    return combats.map(EntityMapper.toCombat).toList();
  }

  @override
  Future<Combat?> getCombatById(int id) async {
    final combat = await _isar.combatIsars.get(id);
    return combat != null ? EntityMapper.toCombat(combat) : null;
  }

  @override
  Future<int> saveCombat(Combat combat) async {
    return _isar.writeTxn(() async {
      return _isar.combatIsars.put(EntityMapper.fromCombat(combat));
    });
  }

  @override
  Future<void> deleteCombat(int id) async {
    await _isar.writeTxn(() async {
      await _isar.combatIsars.delete(id);
    });
  }

  @override
  Future<HistoriqueStats> getHistoriqueStats() async {
    final combats = await _isar.combatIsars.where().findAll();
    var totalSets = 0;
    var totalReps = 0;
    var totalCalories = 0.0;
    var totalMinutes = 0;

    for (final combat in combats) {
      totalSets += combat.series.length;
      totalReps += combat.series.fold(0, (sum, s) => sum + s.reps);
      totalCalories += combat.calories;
      totalMinutes += combat.durationMinutes;
    }

    return HistoriqueStats(
      totalCombats: combats.length,
      totalSets: totalSets,
      totalReps: totalReps,
      totalCalories: totalCalories,
      totalMinutes: totalMinutes,
    );
  }
}
