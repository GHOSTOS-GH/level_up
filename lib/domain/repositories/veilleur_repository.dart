import '../entities/veilleur.dart';

abstract class VeilleurRepository {
  Future<Veilleur> getVeilleur();
  Future<void> saveVeilleur(Veilleur veilleur);
}
