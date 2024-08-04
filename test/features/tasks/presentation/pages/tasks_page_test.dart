import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo/core/di/di_manager.dart';
import 'package:my_todo/features/tasks/presentation/pages/tasks_page.dart';

import '../../data/repositories/tasks_repository_test.mocks.dart';

Future<void> main() async {
  group('TasksPage', () {
    late MockDatabase database;

    setUp(() {
      final tasks = List.generate(
        1000,
        (final index) => {
          'id': index,
          'title': 'Task ${index + 1}',
          'completed': 0,
        },
      );

      database = MockDatabase();

      when(database.query(any)).thenAnswer(
        (final _) async => tasks,
      );

      DIManager.initializeDependencies(database: database);
    });

    testWidgets('FAB visibility changes on scroll', (final tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TasksPage(),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.pumpAndSettle();

      final listFinder = find.byType(Scrollable);
      final itemFinderWhenScrollDown = find.byKey(const ValueKey('task_10'));
      final itemFinderWhenScrollUp = find.byKey(const ValueKey('task_1'));

      await tester.scrollUntilVisible(
        itemFinderWhenScrollDown,
        500,
        scrollable: listFinder,
      );

      expect(
        tester
            .widget<AnimatedOpacity>(find.byKey(const ValueKey('fab_opacity')))
            .opacity,
        0,
      );

      await tester.scrollUntilVisible(
        itemFinderWhenScrollUp,
        -500,
        scrollable: listFinder,
      );

      expect(
        tester
            .widget<AnimatedOpacity>(find.byKey(const ValueKey('fab_opacity')))
            .opacity,
        1,
      );
    });
  });
}
