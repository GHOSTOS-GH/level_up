import 'package:flutter_riverpod/flutter_riverpod.dart';

// ─── Repositories ─────────────────────────────────────────────────────────────
import '../../data/repositories_impl/combat_repository_impl.dart';
import '../../data/repositories_impl/data_export_repository_impl.dart';
import '../../data/repositories_impl/defi_repository_impl.dart';
import '../../data/repositories_impl/message_repository_impl.dart';
import '../../data/repositories_impl/programme_repository_impl.dart'; // ADDED
import '../../data/repositories_impl/rune_repository_impl.dart';
import '../../data/repositories_impl/seance_repository_impl.dart'; // ADDED
import '../../data/repositories_impl/veilleur_repository_impl.dart';

// ─── Seed ──────────────────────────────────────────────────────────────────
import '../../data/seed/programme_seed_service.dart'; // ADDED
import '../../data/seed/seed_data_service.dart';

// ─── Domain ────────────────────────────────────────────────────────────────
import '../../domain/entities/seance_programmee.dart'; // ADDED
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/get_mur_state_usecase.dart';
import '../../domain/usecases/get_or_create_today_seance_usecase.dart'; // ADDED
import '../../domain/usecases/get_today_defi_usecase.dart';
import '../../domain/usecases/manage_programme_usecase.dart'; // ADDED
import '../../domain/usecases/progression_usecases.dart';
import '../../domain/usecases/streak_usecases.dart';
import '../../domain/usecases/validate_combat_usecase.dart';
import '../../domain/usecases/validate_exercice_seance_usecase.dart'; // ADDED

// ─── Repositories Providers ──────────────────────────────────────────────────

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

// ─── ADDED: Programme & Séance repositories ─────────────────────────────────
final programmeRepositoryProvider = Provider<ProgrammeRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

final seanceRepositoryProvider = Provider<SeanceRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

// ─── Use Cases ────────────────────────────────────────────────────────────────

final calculateProgressionProvider =
    Provider((ref) => CalculateProgressionUseCase());
final calculateStreakMultiplierProvider =
    Provider((ref) => CalculateStreakMultiplierUseCase());
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

// ─── ADDED: Programme use cases ──────────────────────────────────────────────

final getOrCreateTodaySeanceProvider = Provider((ref) {
  return GetOrCreateTodaySeanceUseCase(
    programmeRepository: ref.watch(programmeRepositoryProvider),
    seanceRepository: ref.watch(seanceRepositoryProvider),
  );
});

final validateExerciceSeanceProvider = Provider((ref) {
  return ValidateExerciceSeanceUseCase(
    seanceRepository: ref.watch(seanceRepositoryProvider),
    veilleurRepository: ref.watch(veilleurRepositoryProvider),
    messageRepository: ref.watch(messageRepositoryProvider),
    runeRepository: ref.watch(runeRepositoryProvider),
    validateCombat: ref.watch(validateCombatProvider),
    calculateStreakMultiplier: ref.watch(calculateStreakMultiplierProvider),
    applyProgressGain: ref.watch(applyProgressGainProvider),
  );
});

final manageProgrammeProvider = Provider((ref) {
  return ManageProgrammeUseCase(ref.watch(programmeRepositoryProvider));
});

final programmeSeedServiceProvider = Provider((ref) {
  return ProgrammeSeedService(ref.watch(programmeRepositoryProvider));
});

// ─── ADDED: Today Séance state ──────────────────────────────────────────────

final todaySeanceProvider =
    AsyncNotifierProvider<TodaySeanceNotifier, SeanceProgrammee>(
  TodaySeanceNotifier.new,
);

class TodaySeanceNotifier extends AsyncNotifier<SeanceProgrammee> {
  @override
  Future<SeanceProgrammee> build() {
    return ref.read(getOrCreateTodaySeanceProvider).call();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(getOrCreateTodaySeanceProvider).call(),
    );
  }

  void updateState(SeanceProgrammee seance) {
    state = AsyncData(seance);
  }
}

// ─── Seed services ──────────────────────────────────────────────────────────

final seedDataServiceProvider = Provider((ref) {
  return SeedDataService(
    messageRepository: ref.watch(messageRepositoryProvider),
    runeRepository: ref.watch(runeRepositoryProvider),
  );
});

// ─── AppInitializer ──────────────────────────────────────────────────────────

class AppInitializer {
  static Future<ProviderContainer> createContainer() async {
    // Hive est déjà initialisé dans main.dart avant cet appel.
    final veilleurRepo = VeilleurRepositoryImpl();
    final combatRepo   = CombatRepositoryImpl();
    final defiRepo     = DefiRepositoryImpl();
    final messageRepo  = MessageRepositoryImpl();
    final runeRepo     = RuneRepositoryImpl();
    final exportRepo   = DataExportRepositoryImpl();

    // ── ADDED: nouveaux repositories ──
    final programmeRepo = ProgrammeRepositoryImpl();
    final seanceRepo    = SeanceRepositoryImpl();

    final container = ProviderContainer(
      overrides: [
        veilleurRepositoryProvider.overrideWithValue(veilleurRepo),
        combatRepositoryProvider.overrideWithValue(combatRepo),
        defiRepositoryProvider.overrideWithValue(defiRepo),
        messageRepositoryProvider.overrideWithValue(messageRepo),
        runeRepositoryProvider.overrideWithValue(runeRepo),
        dataExportRepositoryProvider.overrideWithValue(exportRepo),
        // ── ADDED: overrides ──
        programmeRepositoryProvider.overrideWithValue(programmeRepo),
        seanceRepositoryProvider.overrideWithValue(seanceRepo),
      ],
    );

    // Seed existant
    await container.read(seedDataServiceProvider).seedIfNeeded();
    // ── ADDED: seed programme ──
    await container.read(programmeSeedServiceProvider).seedIfNeeded();

    return container;
  }
}