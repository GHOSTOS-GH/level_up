import '../entities/combat.dart';
import '../entities/combat_result.dart';
import '../entities/defi.dart';
import '../entities/narrative_entities.dart';
import '../entities/rune.dart';
import '../entities/veilleur.dart';
import '../entities/programme_template.dart';
import '../entities/seance_programmee.dart';

// ─── Veilleur ────────────────────────────────────────────────────────────────

abstract class VeilleurRepository {
  Future<Veilleur> getVeilleur();
  Future<void> saveVeilleur(Veilleur veilleur);
}

// ─── Combat ───────────────────────────────────────────────────────────────────

abstract class CombatRepository {
  Future<List<Combat>> getAllCombats();
  Future<List<Combat>> getCombatsByExercise(String exercise);
  Future<Combat?> getCombatById(int id);
  Future<int> saveCombat(Combat combat);
  Future<void> deleteCombat(int id);
  Future<HistoriqueStats> getHistoriqueStats();
}

// ─── Défi ─────────────────────────────────────────────────────────────────────

abstract class DefiRepository {
  Future<Defi> getTodayDefi();
  Future<void> saveDefi(Defi defi);
}

// ─── Message secret ───────────────────────────────────────────────────────────

abstract class MessageRepository {
  Future<List<MessageSecret>> getAllMessages();
  Future<MessageSecret?> revealNextMessage(int streakDays);
  Future<void> saveMessage(MessageSecret message);
  Future<void> initializeMessages(List<MessageSecret> messages);
}

// ─── Rune ─────────────────────────────────────────────────────────────────────

abstract class RuneRepository {
  Future<List<Rune>> getAllRunes();
  Future<void> saveRune(Rune rune);
  Future<void> initializeRunes(List<Rune> runes);
  Future<int> countActiveRunes();
}

// ─── Export de données ────────────────────────────────────────────────────────

abstract class DataExportRepository {
  Future<String> exportToJson();
  Future<void> importFromJson(String jsonContent);
}

// ─── Programme (templates hebdomadaires récurrents) ────────────────────────

abstract class ProgrammeRepository {
  /// Les 7 jours (lundi → dimanche). Toujours complet (initialisé au seed).
  Future<List<JourTemplate>> getAllTemplates();

  Future<JourTemplate> getTemplateForDay(int dayOfWeek);

  Future<void> saveTemplate(JourTemplate template);

  /// Seed initial : crée les 7 jours par défaut si absents.
  Future<void> initializeTemplates(List<JourTemplate> defaults);
}

// ─── Séances programmées (instances datées) ────────────────────────────────

abstract class SeanceRepository {
  Future<SeanceProgrammee?> getSeanceForDate(DateTime date);

  Future<SeanceProgrammee> saveSeance(SeanceProgrammee seance);

  /// Pour le calendrier : toutes les séances entre deux dates (inclusives).
  Future<List<SeanceProgrammee>> getSeancesInRange(DateTime start, DateTime end);

  Future<void> deleteSeance(DateTime date);
}
