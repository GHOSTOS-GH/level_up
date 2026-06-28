import 'package:isar/isar.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/veilleur.dart';
import '../../domain/repositories/veilleur_repository.dart';
import '../local/isar_service.dart';
import '../local/models/veilleur_isar.dart';
import '../mappers/entity_mapper.dart';

class VeilleurRepositoryImpl implements VeilleurRepository {
  VeilleurRepositoryImpl(this._isar);

  final Isar _isar;

  static Future<VeilleurRepositoryImpl> create() async {
    final isar = await IsarService.getInstance();
    return VeilleurRepositoryImpl(isar);
  }

  @override
  Future<Veilleur> getVeilleur() async {
    final existing = await _isar.veilleurIsars.get(AppConstants.veilleurSingletonId);
    if (existing != null) {
      return EntityMapper.toVeilleur(existing);
    }

    final defaultVeilleur = VeilleurIsar()
      ..id = AppConstants.veilleurSingletonId
      ..nom = 'Veilleur'
      ..progression = 0
      ..niveau = 1
      ..streakDays = 0
      ..totalCombats = 0
      ..notificationHour = 8
      ..notificationMinute = 0
      ..notificationsEnabled = false;

    await _isar.writeTxn(() async {
      await _isar.veilleurIsars.put(defaultVeilleur);
    });

    return EntityMapper.toVeilleur(defaultVeilleur);
  }

  @override
  Future<void> saveVeilleur(Veilleur veilleur) async {
    await _isar.writeTxn(() async {
      await _isar.veilleurIsars.put(EntityMapper.fromVeilleur(veilleur));
    });
  }
}
