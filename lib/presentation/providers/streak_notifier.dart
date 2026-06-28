import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/rune.dart';
import 'mur_notifier.dart';
import 'providers.dart';

final runesProvider = AsyncNotifierProvider<RunesNotifier, List<Rune>>(RunesNotifier.new);

class RunesNotifier extends AsyncNotifier<List<Rune>> {
  @override
  Future<List<Rune>> build() async {
    return ref.read(runeRepositoryProvider).getAllRunes();
  }

  Future<Rune?> activateRune(int runeId) async {
    final activated = await ref.read(activateRuneProvider).call(runeId);
    if (activated != null) {
      await refresh();
    }
    return activated;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(runeRepositoryProvider).getAllRunes(),
    );
  }
}

final streakInfoProvider = Provider<StreakInfo>((ref) {
  final murState = ref.watch(murStateProvider);
  return murState.when(
    data: (state) => StreakInfo(
      streakDays: state.streakDays,
      multiplier: state.streakMultiplier,
      palierTitle: state.palier.title,
      palierEmoji: state.palier.emoji,
    ),
    loading: () => const StreakInfo(),
    error: (_, __) => const StreakInfo(),
  );
});

class StreakInfo {
  const StreakInfo({
    this.streakDays = 0,
    this.multiplier = 1.0,
    this.palierTitle = 'La Brume s\'épaissit',
    this.palierEmoji = '🌫️',
  });

  final int streakDays;
  final double multiplier;
  final String palierTitle;
  final String palierEmoji;
}
