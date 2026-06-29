import '../../core/constants/daily_challenges.dart';
import '../../core/extensions/extensions.dart';
import '../../domain/entities/defi.dart';
import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../mappers/entity_mapper.dart';

class DefiRepositoryImpl implements DefiRepository {
  @override
  Future<Defi> getTodayDefi() async {
    final today = DateTime.now().dateOnly;
    final key = _dateKey(today);
    final box = HiveService.defiBox;
    final existing = box.get(key);

    if (existing != null) {
      return EntityMapper.toDefi(box.keys.toList().indexOf(key), existing);
    }

    final template = DailyChallenges.forDay(today.weekday);
    final defi = DailyChallenges.toDefi(template, today);
    await saveDefi(defi);
    return defi;
  }

  @override
  Future<void> saveDefi(Defi defi) async {
    final key = _dateKey(defi.date);
    await HiveService.defiBox.put(key, EntityMapper.fromDefi(defi));
  }

  String _dateKey(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}