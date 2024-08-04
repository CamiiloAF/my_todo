import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo/features/tasks/presentation/widgets/add_task_fab.dart';

Future<void> main() async {
  testWidgets('FAB is initially visible', (final tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTaskFab(isFABVisible: true),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(
      tester
          .widget<AnimatedOpacity>(find.byKey(const ValueKey('fab_opacity')))
          .opacity,
      1.0,
    );
  });

  testWidgets('FAB is initially hidden', (final tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTaskFab(isFABVisible: false),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(
      tester
          .widget<AnimatedOpacity>(find.byKey(const ValueKey('fab_opacity')))
          .opacity,
      0.0,
    );
  });

  testWidgets('FAB visibility changes to hidden when pressed',
      (final tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTaskFab(isFABVisible: true),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(
      tester
          .widget<AnimatedOpacity>(find.byKey(const ValueKey('fab_opacity')))
          .opacity,
      0.0,
    );
  });

  testWidgets('FAB visibility changes to visible after modal is dismissed',
      (final tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTaskFab(isFABVisible: true),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();

    expect(
      tester
          .widget<AnimatedOpacity>(find.byKey(const ValueKey('fab_opacity')))
          .opacity,
      1.0,
    );
  });
}
