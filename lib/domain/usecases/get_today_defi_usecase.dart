import '../../core/constants/daily_challenges.dart';
import '../../core/extensions/date_extensions.dart';
import '../entities/defi.dart';
import '../repositories/defi_repository.dart';

class GetTodayDefiUseCase {
  GetTodayDefiUseCase(this._repository);

  final DefiRepository _repository;

  Future<Defi> call() async {
    final now = DateTime.now();
    final today = now.dateOnly;
    final defi = await _repository.getTodayDefi();

    if (defi.date.dateOnly.isSameDay(today)) {
      return defi;
    }

    final template = DailyChallenges.forDay(now.weekday);
    final newDefi = DailyChallenges.toDefi(template, today);
    await _repository.saveDefi(newDefi);
    return newDefi;
  }
}
