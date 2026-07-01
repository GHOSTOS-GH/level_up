import '../../core/extensions/extensions.dart';
import '../entities/seance_programmee.dart';
import '../repositories/repositories.dart';
import '../../data/mappers/programme_mapper.dart';

class GetOrCreateTodaySeanceUseCase {
  GetOrCreateTodaySeanceUseCase({
    required ProgrammeRepository programmeRepository,
    required SeanceRepository seanceRepository,
  })  : _programmeRepository = programmeRepository,
        _seanceRepository = seanceRepository;

  final ProgrammeRepository _programmeRepository;
  final SeanceRepository _seanceRepository;

  Future<SeanceProgrammee> call([DateTime? forDate]) async {
    final date = (forDate ?? DateTime.now()).dateOnly;

    final existing = await _seanceRepository.getSeanceForDate(date);
    if (existing != null) return existing;

    // Pas encore de séance pour ce jour → génération depuis le template hebdo.
    final template = await _programmeRepository.getTemplateForDay(date.weekday);
    final generated = ProgrammeMapper.generateSeanceFromTemplate(template, date);
    return _seanceRepository.saveSeance(generated);
  }
}
