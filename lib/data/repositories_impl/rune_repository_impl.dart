import '../../domain/entities/rune.dart';
import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../mappers/entity_mapper.dart';

class RuneRepositoryImpl implements RuneRepository {
  @override
  Future<List<Rune>> getAllRunes() async {
    final box = HiveService.runeBox;
    return box.toMap().entries
        .map((e) => EntityMapper.toRune(e.key as int, e.value))
        .toList();
  }

  @override
  Future<void> saveRune(Rune rune) async {
    await HiveService.runeBox.put(rune.id, EntityMapper.fromRune(rune));
  }

  @override
  Future<void> initializeRunes(List<Rune> runes) async {
    final box = HiveService.runeBox;
    if (box.isNotEmpty) return;

    final entries = {for (final r in runes) r.id: EntityMapper.fromRune(r)};
    await box.putAll(entries);
  }

  @override
  Future<int> countActiveRunes() async {
    return HiveService.runeBox.values.where((r) => r.active).length;
  }
}