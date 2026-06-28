import '../../core/constants/app_constants.dart';

class CalculateStreakMultiplierUseCase {
  double call(int streakDays) {
    if (streakDays >= 31) return AppConstants.streakMultiplierTier5;
    if (streakDays >= 15) return AppConstants.streakMultiplierTier4;
    if (streakDays >= 8) return AppConstants.streakMultiplierTier3;
    if (streakDays >= 4) return AppConstants.streakMultiplierTier2;
    return AppConstants.streakMultiplierTier1;
  }
}
