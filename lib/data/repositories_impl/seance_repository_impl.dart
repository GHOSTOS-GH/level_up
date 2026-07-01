import '../../domain/entities/seance_programmee.dart';
import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../mappers/programme_mapper.dart';

class SeanceRepositoryImpl implements SeanceRepository {
  @override
  Future<SeanceProgrammee?> getSeanceForDate(DateTime date) async {
    final key = _dateKey(date);
    final h = HiveService.seanceBox.get(key);
    if (h == null) return null;
    return ProgrammeMapper.toSeance(key.hashCode, h);
  }

  @override
  Future<SeanceProgrammee> saveSeance(SeanceProgrammee seance) async {
    final key = _dateKey(seance.date);
    await HiveService.seanceBox.put(key, ProgrammeMapper.fromSeance(seance));
    return seance.copyWith(id: key.hashCode);
  }

  @override
  Future<List<SeanceProgrammee>> getSeancesInRange(DateTime start, DateTime end) async {
    final box = HiveService.seanceBox;
    final result = <SeanceProgrammee>[];

    for (final entry in box.toMap().entries) {
      final h = entry.value;
      final d = DateTime(h.date.year, h.date.month, h.date.day);
      final s = DateTime(start.year, start.month, start.day);
      final e = DateTime(end.year, end.month, end.day);
      if (!d.isBefore(s) && !d.isAfter(e)) {
        result.add(ProgrammeMapper.toSeance((entry.key as String).hashCode, h));
      }
    }

    result.sort((a, b) => a.date.compareTo(b.date));
    return result;
  }

  @override
  Future<void> deleteSeance(DateTime date) async {
    await HiveService.seanceBox.delete(_dateKey(date));
  }

  String _dateKey(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}
