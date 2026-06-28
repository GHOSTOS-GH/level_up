import 'package:isar/isar.dart';

import '../../core/constants/daily_challenges.dart';
import '../../core/extensions/extensions.dart';
import '../../domain/entities/defi.dart';
import '../../domain/repositories/repositories.dart';
import '../local/isar_service.dart';
import '../local/models/defi_isar.dart';
import '../mappers/entity_mapper.dart';

class DefiRepositoryImpl implements DefiRepository {
  DefiRepositoryImpl(this._isar);

  final Isar _isar;

  static Future<DefiRepositoryImpl> create() async {
    final isar = await IsarService.getInstance();
    return DefiRepositoryImpl(isar);
  }

  @override
  Future<Defi> getTodayDefi() async {
    final today = DateTime.now().dateOnly;
    final existing = await _isar.defiIsars
        .filter()
        .dateEqualTo(today)
        .findFirst();

    if (existing != null) {
      return EntityMapper.toDefi(existing);
    }

    final template = DailyChallenges.forDay(today.weekday);
    final defi = DailyChallenges.toDefi(template, today);
    await saveDefi(defi);
    return defi;
  }

  @override
  Future<void> saveDefi(Defi defi) async {
    await _isar.writeTxn(() async {
      await _isar.defiIsars.put(EntityMapper.fromDefi(defi));
    });
  }
}
