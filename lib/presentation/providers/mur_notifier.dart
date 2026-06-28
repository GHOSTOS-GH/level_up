import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/combat_result.dart';
import '../../domain/entities/defi.dart';
import 'providers.dart';

final murStateProvider =
    AsyncNotifierProvider<MurNotifier, MurState>(MurNotifier.new);

class MurNotifier extends AsyncNotifier<MurState> {
  @override
  Future<MurState> build() async {
    return ref.read(getMurStateProvider)();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(getMurStateProvider)());
  }
}

final todayDefiProvider =
    AsyncNotifierProvider<TodayDefiNotifier, Defi>(TodayDefiNotifier.new);

class TodayDefiNotifier extends AsyncNotifier<Defi> {
  @override
  Future<Defi> build() async {
    return ref.read(getTodayDefiProvider)();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(getTodayDefiProvider)());
  }
}
