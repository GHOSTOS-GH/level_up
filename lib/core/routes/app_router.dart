import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/combat_result.dart';
import '../../presentation/screens/entrainement/entrainement_screen.dart';
import '../../presentation/screens/fissure/fissure_screen.dart';
import '../../presentation/screens/historique/historique_screen.dart';
import '../../presentation/screens/mur/mur_screen.dart';
import '../../presentation/screens/parametres/parametres_screen.dart';
import '../../presentation/screens/shell/main_shell.dart';

class AppRoutes {
  AppRoutes._();

  static const String mur = '/';
  static const String entrainement = '/entrainement';
  static const String historique = '/historique';
  static const String parametres = '/parametres';
  static const String fissure = '/fissure';
}

CustomTransitionPage<void> _fadeSlidePage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final fade = CurvedAnimation(parent: animation, curve: Curves.easeOut);
      final slide = Tween<Offset>(
        begin: const Offset(0, 0.05),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: child),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.mur,
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.mur,
          pageBuilder: (context, state) => _fadeSlidePage(
            key: state.pageKey,
            child: const MurScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.entrainement,
          pageBuilder: (context, state) => _fadeSlidePage(
            key: state.pageKey,
            child: const EntrainementScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.historique,
          pageBuilder: (context, state) => _fadeSlidePage(
            key: state.pageKey,
            child: const HistoriqueScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.parametres,
          pageBuilder: (context, state) => _fadeSlidePage(
            key: state.pageKey,
            child: const ParametresScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.fissure,
      pageBuilder: (context, state) {
        final result = state.extra as CombatResult;
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: FissureScreen(result: result),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.85, end: 1).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
                ),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      },
    ),
  ],
);
