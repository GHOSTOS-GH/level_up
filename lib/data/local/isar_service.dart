import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/combat_isar.dart';
import 'models/defi_isar.dart';
import 'models/message_isar.dart';
import 'models/rune_isar.dart';
import 'models/veilleur_isar.dart';

class IsarService {
  IsarService._();

  static Isar? _instance;

  static Future<Isar> getInstance() async {
    if (_instance != null && _instance!.isOpen) return _instance!;

    final dir = await getApplicationDocumentsDirectory();
    _instance = await Isar.open(
      [
        VeilleurIsarSchema,
        CombatIsarSchema,
        DefiIsarSchema,
        MessageIsarSchema,
        RuneIsarSchema,
      ],
      directory: dir.path,
      name: 'level_up_db',
    );
    return _instance!;
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }
}
