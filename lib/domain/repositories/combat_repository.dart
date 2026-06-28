import '../entities/combat.dart';
import '../entities/combat_result.dart';

abstract class CombatRepository {
  Future<List<Combat>> getAllCombats();
  Future<List<Combat>> getCombatsByExercise(String exercise);
  Future<Combat?> getCombatById(int id);
  Future<int> saveCombat(Combat combat);
  Future<void> deleteCombat(int id);
  Future<HistoriqueStats> getHistoriqueStats();
}
