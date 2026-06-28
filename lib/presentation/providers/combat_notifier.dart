import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/combat.dart';
import '../../domain/entities/combat_result.dart';
import '../../domain/entities/defi.dart';
import '../../domain/usecases/progression_usecases.dart';
import 'mur_notifier.dart';
import 'providers.dart';

class ActiveCombatState {
  const ActiveCombatState({
    required this.exercise,
    required this.series,
    required this.coefficient,
    required this.defiName,
    required this.defiBonus,
    required this.elapsedSeconds,
    required this.restSecondsRemaining,
    required this.isResting,
    required this.isValidating,
  });

  final String exercise;
  final List<SerieCombat> series;
  final double coefficient;
  final String? defiName;
  final double defiBonus;
  final int elapsedSeconds;
  final int restSecondsRemaining;
  final bool isResting;
  final bool isValidating;

  int get totalSets => series.length;
  int get totalReps => series.fold(0, (sum, s) => sum + s.reps);
  int get completedSets => series.where((s) => s.completed).length;

  double estimatedCalories(CalculateProgressionUseCase calc) =>
      calc.estimateCalories(totalReps);

  ActiveCombatState copyWith({
    String? exercise,
    List<SerieCombat>? series,
    double? coefficient,
    String? defiName,
    double? defiBonus,
    int? elapsedSeconds,
    int? restSecondsRemaining,
    bool? isResting,
    bool? isValidating,
  }) {
    return ActiveCombatState(
      exercise: exercise ?? this.exercise,
      series: series ?? this.series,
      coefficient: coefficient ?? this.coefficient,
      defiName: defiName ?? this.defiName,
      defiBonus: defiBonus ?? this.defiBonus,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      restSecondsRemaining: restSecondsRemaining ?? this.restSecondsRemaining,
      isResting: isResting ?? this.isResting,
      isValidating: isValidating ?? this.isValidating,
    );
  }
}

final combatNotifierProvider =
    NotifierProvider<CombatNotifier, ActiveCombatState?>(CombatNotifier.new);

class CombatNotifier extends Notifier<ActiveCombatState?> {
  Timer? _elapsedTimer;
  Timer? _restTimer;

  @override
  ActiveCombatState? build() {
    ref.onDispose(_disposeTimers);
    return null;
  }

  void _disposeTimers() {
    _elapsedTimer?.cancel();
    _restTimer?.cancel();
  }

  void startFromDefi(Defi defi) {
    _disposeTimers();
    final series = List.generate(
      defi.targetSets,
      (i) => SerieCombat(index: i + 1, reps: defi.targetReps, completed: false),
    );

    state = ActiveCombatState(
      exercise: defi.exercise,
      series: series,
      coefficient: defi.coefficient,
      defiName: defi.name,
      defiBonus: defi.bonusProgress,
      elapsedSeconds: 0,
      restSecondsRemaining: 0,
      isResting: false,
      isValidating: false,
    );

    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final current = state;
      if (current != null && !current.isResting) {
        state = current.copyWith(elapsedSeconds: current.elapsedSeconds + 1);
      }
    });
  }

  void setExercise(String exercise) {
    final current = state;
    if (current == null) return;
    state = current.copyWith(exercise: exercise);
  }

  void addSerie({int reps = 10}) {
    final current = state;
    if (current == null) return;
    final newIndex = current.series.length + 1;
    state = current.copyWith(
      series: [
        ...current.series,
        SerieCombat(index: newIndex, reps: reps, completed: false),
      ],
    );
  }

  void removeSerie(int index) {
    final current = state;
    if (current == null) return;
    final updated = current.series.where((s) => s.index != index).toList();
    for (var i = 0; i < updated.length; i++) {
      updated[i] = updated[i].copyWith(index: i + 1);
    }
    state = current.copyWith(series: updated);
  }

  void updateSerieReps(int index, int reps) {
    final current = state;
    if (current == null) return;
    state = current.copyWith(
      series: current.series
          .map((s) => s.index == index ? s.copyWith(reps: reps) : s)
          .toList(),
    );
  }

  void toggleSerieCompleted(int index, {int restDuration = 60}) {
    final current = state;
    if (current == null) return;

    final serie = current.series.firstWhere((s) => s.index == index);
    final willComplete = !serie.completed;

    state = current.copyWith(
      series: current.series
          .map((s) => s.index == index ? s.copyWith(completed: willComplete) : s)
          .toList(),
    );

    if (willComplete) {
      startRest(restDuration);
    }
  }

  void startRest(int seconds) {
    final current = state;
    if (current == null) return;

    _restTimer?.cancel();
    state = current.copyWith(
      isResting: true,
      restSecondsRemaining: seconds,
    );

    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final s = state;
      if (s == null) {
        timer.cancel();
        return;
      }
      if (s.restSecondsRemaining <= 1) {
        timer.cancel();
        state = s.copyWith(isResting: false, restSecondsRemaining: 0);
      } else {
        state = s.copyWith(restSecondsRemaining: s.restSecondsRemaining - 1);
      }
    });
  }

  void skipRest() {
    _restTimer?.cancel();
    final current = state;
    if (current == null) return;
    state = current.copyWith(isResting: false, restSecondsRemaining: 0);
  }

  Future<CombatResult?> validateCombat() async {
    final current = state;
    if (current == null || current.isValidating) return null;

    state = current.copyWith(isValidating: true);

    try {
      final result = await ref.read(validateCombatProvider).call(
            exercise: current.exercise,
            series: current.series,
            durationMinutes: (current.elapsedSeconds / 60).ceil().clamp(1, 999),
            coefficient: current.coefficient,
            defiName: current.defiName,
            defiBonus: current.defiBonus,
          );

      _disposeTimers();
      state = null;

      await ref.read(murStateProvider.notifier).refresh();
      await ref.read(todayDefiProvider.notifier).refresh();

      return result;
    } finally {
      final s = state;
      if (s != null) {
        state = s.copyWith(isValidating: false);
      }
    }
  }

  void abandonCombat() {
    _disposeTimers();
    state = null;
  }
}
