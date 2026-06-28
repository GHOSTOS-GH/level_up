import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_colors.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutes.entrainement)) return 1;
    if (location.startsWith(AppRoutes.historique)) return 2;
    if (location.startsWith(AppRoutes.parametres)) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final index = _currentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.surfaceElevated.withValues(alpha: 0.6)),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) {
            switch (i) {
              case 0:
                context.go(AppRoutes.mur);
              case 1:
                context.go(AppRoutes.entrainement);
              case 2:
                context.go(AppRoutes.historique);
              case 3:
                context.go(AppRoutes.parametres);
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.landscape), label: 'Le Mur'),
            BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Combat'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historique'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
          ],
        ),
      ),
    );
  }
}
