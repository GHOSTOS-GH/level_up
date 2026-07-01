import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../hive_registrar.g.dart';
import 'models/combat_hive.dart';
import 'models/defi_hive.dart';
import 'models/jour_template_hive.dart';
import 'models/message_hive.dart';
import 'models/rune_hive.dart';
import 'models/seance_programmee_hive.dart';
import 'models/veilleur_hive.dart';

class HiveService {
  HiveService._();

  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;

    await Hive.initFlutter();

    // hive_registrar.g.dart (généré par build_runner) enregistre TOUS les
    // adapters (Combat, Defi, Message, Rune, Serie, Veilleur,
    // ExerciceTemplate, JourTemplate, ExerciceSeance, SeanceProgrammee).
    Hive.registerAdapters();

    await Future.wait([
      Hive.openBox<VeilleurHive>('veilleur'),
      Hive.openBox<CombatHive>('combats'),
      Hive.openBox<DefiHive>('defis'), // legacy — conservé pour migration/rollback
      Hive.openBox<MessageHive>('messages'),
      Hive.openBox<RuneHive>('runes'),
      Hive.openBox<JourTemplateHive>('programme_templates'),
      Hive.openBox<SeanceProgrammeeHive>('seances'),
    ]);

    _initialized = true;
  }

  static Box<VeilleurHive>          get veilleurBox  => Hive.box<VeilleurHive>('veilleur');
  static Box<CombatHive>            get combatBox    => Hive.box<CombatHive>('combats');
  static Box<DefiHive>              get defiBox      => Hive.box<DefiHive>('defis');
  static Box<MessageHive>           get messageBox   => Hive.box<MessageHive>('messages');
  static Box<RuneHive>              get runeBox      => Hive.box<RuneHive>('runes');
  static Box<JourTemplateHive>      get templateBox  => Hive.box<JourTemplateHive>('programme_templates');
  static Box<SeanceProgrammeeHive>  get seanceBox    => Hive.box<SeanceProgrammeeHive>('seances');

  static Future<void> clearAll() async {
    await Future.wait([
      veilleurBox.clear(),
      combatBox.clear(),
      defiBox.clear(),
      messageBox.clear(),
      runeBox.clear(),
      templateBox.clear(),
      seanceBox.clear(),
    ]);
  }
}
