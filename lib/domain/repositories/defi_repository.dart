import '../entities/defi.dart';

abstract class DefiRepository {
  Future<Defi> getTodayDefi();
  Future<void> saveDefi(Defi defi);
}
