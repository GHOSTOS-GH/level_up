import '../entities/rune.dart';

abstract class RuneRepository {
  Future<List<Rune>> getAllRunes();
  Future<void> saveRune(Rune rune);
  Future<void> initializeRunes(List<Rune> runes);
  Future<int> countActiveRunes();
}
