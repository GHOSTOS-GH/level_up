import 'package:hive_ce_flutter/hive_flutter.dart';

import 'models/combat_hive.dart';
import 'models/defi_hive.dart';
import 'models/message_hive.dart';
import 'models/rune_hive.dart';
import 'models/serie_combat_hive.dart';
import 'models/veilleur_hive.dart';

class HiveService {
  HiveService._();

  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;

    await Hive.initFlutter();

    // Enregistrement des adapters (ordre = typeId croissant)
    Hive.registerAdapter(SerieCombatHiveAdapter());  // typeId: 0
    Hive.registerAdapter(VeilleurHiveAdapter());      // typeId: 1
    Hive.registerAdapter(CombatHiveAdapter());        // typeId: 2
    Hive.registerAdapter(DefiHiveAdapter());          // typeId: 3
    Hive.registerAdapter(MessageHiveAdapter());       // typeId: 4
    Hive.registerAdapter(RuneHiveAdapter());          // typeId: 5

    // Ouverture des boîtes
    await Future.wait([
      Hive.openBox<VeilleurHive>('veilleur'),
      Hive.openBox<CombatHive>('combats'),
      Hive.openBox<DefiHive>('defis'),
      Hive.openBox<MessageHive>('messages'),
      Hive.openBox<RuneHive>('runes'),
    ]);

    _initialized = true;
  }

  static Box<VeilleurHive> get veilleurBox => Hive.box<VeilleurHive>('veilleur');
  static Box<CombatHive>   get combatBox   => Hive.box<CombatHive>('combats');
  static Box<DefiHive>     get defiBox     => Hive.box<DefiHive>('defis');
  static Box<MessageHive>  get messageBox  => Hive.box<MessageHive>('messages');
  static Box<RuneHive>     get runeBox     => Hive.box<RuneHive>('runes');

  static Future<void> clearAll() async {
    await Future.wait([
      veilleurBox.clear(),
      combatBox.clear(),
      defiBox.clear(),
      messageBox.clear(),
      runeBox.clear(),
    ]);
  }
}