import 'package:isar/isar.dart';

import '../../domain/entities/rune.dart';
import '../../domain/repositories/rune_repository.dart';
import '../local/isar_service.dart';
import '../local/models/rune_isar.dart';
import '../mappers/entity_mapper.dart';

class RuneRepositoryImpl implements RuneRepository {
  RuneRepositoryImpl(this._isar);

  final Isar _isar;

  static Future<RuneRepositoryImpl> create() async {
    final isar = await IsarService.getInstance();
    return RuneRepositoryImpl(isar);
  }

  @override
  Future<List<Rune>> getAllRunes() async {
    final runes = await _isar.runeIsars.where().findAll();
    return runes.map(EntityMapper.toRune).toList();
  }

  @override
  Future<void> saveRune(Rune rune) async {
    await _isar.writeTxn(() async {
      await _isar.runeIsars.put(EntityMapper.fromRune(rune));
    });
  }

  @override
  Future<void> initializeRunes(List<Rune> runes) async {
    final count = await _isar.runeIsars.count();
    if (count > 0) return;

    await _isar.writeTxn(() async {
      await _isar.runeIsars.putAll(
        runes.map(EntityMapper.fromRune).toList(),
      );
    });
  }

  @override
  Future<int> countActiveRunes() async {
    return _isar.runeIsars.filter().activeEqualTo(true).count();
  }
}
