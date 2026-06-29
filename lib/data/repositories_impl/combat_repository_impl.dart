import '../../domain/entities/combat.dart';
import '../../domain/entities/combat_result.dart';
import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../mappers/entity_mapper.dart';

class CombatRepositoryImpl implements CombatRepository {
  @override
  Future<List<Combat>> getAllCombats() async {
    final box = HiveService.combatBox;
    final entries = box.toMap().entries
        .map((e) => EntityMapper.toCombat(e.key as int, e.value))
        .toList();
    entries.sort((a, b) => b.date.compareTo(a.date)); // sortByDateDesc
    return entries;
  }

  @override
  Future<List<Combat>> getCombatsByExercise(String exercise) async {
    final box = HiveService.combatBox;
    final entries = box.toMap().entries
        .where((e) => e.value.exercise == exercise)
        .map((e) => EntityMapper.toCombat(e.key as int, e.value))
        .toList();
    entries.sort((a, b) => b.date.compareTo(a.date));
    return entries;
  }

  @override
  Future<Combat?> getCombatById(int id) async {
    final h = HiveService.combatBox.get(id);
    return h != null ? EntityMapper.toCombat(id, h) : null;
  }

  @override
  Future<int> saveCombat(Combat combat) async {
    final box = HiveService.combatBox;
    // Auto-incrément : si id == 0 (nouveau), on génère un id
    final key = combat.id == 0 ? _nextId(box) : combat.id;
    await box.put(key, EntityMapper.fromCombat(combat));
    return key;
  }

  @override
  Future<void> deleteCombat(int id) async {
    await HiveService.combatBox.delete(id);
  }

  @override
  Future<HistoriqueStats> getHistoriqueStats() async {
    final combats = HiveService.combatBox.values;
    var totalSets = 0;
    var totalReps = 0;
    var totalCalories = 0.0;
    var totalMinutes = 0;

    for (final c in combats) {
      totalSets += c.series.length;
      totalReps += c.series.fold(0, (sum, s) => sum + s.reps);
      totalCalories += c.calories;
      totalMinutes += c.durationMinutes;
    }

    return HistoriqueStats(
      totalCombats: combats.length,
      totalSets: totalSets,
      totalReps: totalReps,
      totalCalories: totalCalories,
      totalMinutes: totalMinutes,
    );
  }

  int _nextId(dynamic box) {
    if (box.isEmpty) return 1;
    final keys = box.keys.cast<int>();
    return keys.reduce((a, b) => a > b ? a : b) + 1;
  }
}