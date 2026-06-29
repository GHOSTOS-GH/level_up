import '../../core/constants/app_constants.dart';
import '../../domain/entities/veilleur.dart';
import '../../domain/repositories/repositories.dart';
import '../local/hive_service.dart';
import '../mappers/entity_mapper.dart';

class VeilleurRepositoryImpl implements VeilleurRepository {
  // Hive n'a pas besoin d'injection : accès global via HiveService
  static const _key = AppConstants.veilleurSingletonId;

  @override
  Future<Veilleur> getVeilleur() async {
    final box = HiveService.veilleurBox;
    final existing = box.get(_key);

    if (existing != null) {
      return EntityMapper.toVeilleur(_key, existing);
    }

    // Premier lancement : création du profil par défaut
    final defaults = EntityMapper.fromVeilleur(
      Veilleur(
        id: _key,
        nom: 'Veilleur',
        progression: 0,
        niveau: 1,
        streakDays: 0,
        lastCombatDate: null,
        todayProgressGain: 0,
        lastProgressDate: null,
        lastDeclineDate: null,
        totalCombats: 0,
        notificationHour: 8,
        notificationMinute: 0,
        notificationsEnabled: false,
      ),
    );
    await box.put(_key, defaults);
    return EntityMapper.toVeilleur(_key, defaults);
  }

  @override
  Future<void> saveVeilleur(Veilleur veilleur) async {
    await HiveService.veilleurBox.put(_key, EntityMapper.fromVeilleur(veilleur));
  }
}