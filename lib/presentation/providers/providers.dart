import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories_impl/combat_repository_impl.dart';
import '../../data/repositories_impl/data_export_repository_impl.dart';
import '../../data/repositories_impl/defi_repository_impl.dart';
import '../../data/repositories_impl/message_repository_impl.dart';
import '../../data/repositories_impl/rune_repository_impl.dart';
import '../../data/repositories_impl/veilleur_repository_impl.dart';
import '../../data/seed/seed_data_service.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/get_mur_state_usecase.dart';
import '../../domain/usecases/get_today_defi_usecase.dart';
import '../../domain/usecases/progression_usecases.dart';
import '../../domain/usecases/streak_usecases.dart';
import '../../domain/usecases/validate_combat_usecase.dart';

// ─── Repositories ─────────────────────────────────────────────────────────────

final veilleurRepositoryProvider = Provider<VeilleurRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

final combatRepositoryProvider = Provider<CombatRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

final defiRepositoryProvider = Provider<DefiRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

final runeRepositoryProvider = Provider<RuneRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

final dataExportRepositoryProvider = Provider<DataExportRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

// ─── Use cases ────────────────────────────────────────────────────────────────

final calculateProgressionProvider = Provider((ref) => CalculateProgressionUseCase());
final calculateStreakMultiplierProvider = Provider((ref) => CalculateStreakMultiplierUseCase());
final updateStreakProvider = Provider((ref) => UpdateStreakUseCase());
final applyDailyDeclineProvider = Provider((ref) => ApplyDailyDeclineUseCase());
final applyProgressGainProvider = Provider((ref) => ApplyProgressGainUseCase());

final getTodayDefiProvider = Provider((ref) {
  return GetTodayDefiUseCase(ref.watch(defiRepositoryProvider));
});

final getMurStateProvider = Provider((ref) {
  return GetMurStateUseCase(
    veilleurRepository: ref.watch(veilleurRepositoryProvider),
    applyDailyDecline: ref.watch(applyDailyDeclineProvider),
    calculateStreakMultiplier: ref.watch(calculateStreakMultiplierProvider),
    updateStreak: ref.watch(updateStreakProvider),
  );
});

final validateCombatProvider = Provider((ref) {
  return ValidateCombatUseCase(
    veilleurRepository: ref.watch(veilleurRepositoryProvider),
    combatRepository: ref.watch(combatRepositoryProvider),
    messageRepository: ref.watch(messageRepositoryProvider),
    runeRepository: ref.watch(runeRepositoryProvider),
    calculateProgression: ref.watch(calculateProgressionProvider),
    calculateStreakMultiplier: ref.watch(calculateStreakMultiplierProvider),
    updateStreak: ref.watch(updateStreakProvider),
    applyProgressGain: ref.watch(applyProgressGainProvider),
  );
});

final activateRuneProvider = Provider((ref) {
  return ActivateRuneUseCase(ref.watch(runeRepositoryProvider));
});

final seedDataServiceProvider = Provider((ref) {
  return SeedDataService(
    messageRepository: ref.watch(messageRepositoryProvider),
    runeRepository: ref.watch(runeRepositoryProvider),
  );
});

// ─── Initializer ─────────────────────────────────────────────────────────────

class AppInitializer {
  static Future<ProviderContainer> createContainer() async {
    final veilleurRepo = await VeilleurRepositoryImpl.create();
    final combatRepo = await CombatRepositoryImpl.create();
    final defiRepo = await DefiRepositoryImpl.create();
    final messageRepo = await MessageRepositoryImpl.create();
    final runeRepo = await RuneRepositoryImpl.create();
    final exportRepo = await DataExportRepositoryImpl.create();

    final container = ProviderContainer(
      overrides: [
        veilleurRepositoryProvider.overrideWithValue(veilleurRepo),
        combatRepositoryProvider.overrideWithValue(combatRepo),
        defiRepositoryProvider.overrideWithValue(defiRepo),
        messageRepositoryProvider.overrideWithValue(messageRepo),
        runeRepositoryProvider.overrideWithValue(runeRepo),
        dataExportRepositoryProvider.overrideWithValue(exportRepo),
      ],
    );

    await container.read(seedDataServiceProvider).seedIfNeeded();
    return container;
  }
}
