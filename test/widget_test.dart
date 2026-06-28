import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:level_up/main.dart';
import 'package:level_up/presentation/providers/providers.dart';

void main() {
  testWidgets('Level Up app smoke test', (WidgetTester tester) async {
    final container = await AppInitializer.createContainer();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const LevelUpApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Level Up !'), findsOneWidget);
  });
}