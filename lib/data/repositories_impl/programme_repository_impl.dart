import '../../domain/entities/programme_template.dart';
import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../mappers/programme_mapper.dart';

class ProgrammeRepositoryImpl implements ProgrammeRepository {
  @override
  Future<List<JourTemplate>> getAllTemplates() async {
    final box = HiveService.templateBox;
    final list = box.values.map(ProgrammeMapper.toJourTemplate).toList();
    list.sort((a, b) => a.dayOfWeek.compareTo(b.dayOfWeek));
    return list;
  }

  @override
  Future<JourTemplate> getTemplateForDay(int dayOfWeek) async {
    final h = HiveService.templateBox.get(dayOfWeek);
    if (h == null) {
      throw StateError(
        'Template manquant pour dayOfWeek=$dayOfWeek. '
        'initializeTemplates() doit être appelé au démarrage.',
      );
    }
    return ProgrammeMapper.toJourTemplate(h);
  }

  @override
  Future<void> saveTemplate(JourTemplate template) async {
    await HiveService.templateBox.put(
      template.dayOfWeek,
      ProgrammeMapper.fromJourTemplate(template),
    );
  }

  @override
  Future<void> initializeTemplates(List<JourTemplate> defaults) async {
    final box = HiveService.templateBox;
    if (box.isNotEmpty) return;

    final entries = {
      for (final t in defaults) t.dayOfWeek: ProgrammeMapper.fromJourTemplate(t),
    };
    await box.putAll(entries);
  }
}
