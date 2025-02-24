import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo/features/tasks/presentation/widgets/task_empty.dart';

void main() {
  testWidgets('EmptyListWidget displays correct image and text',
      (final tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyListWidget(),
        ),
      ),
    );

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.text('No tasks were found'), findsOneWidget);
  });

  testWidgets('EmptyListWidget centers content vertically',
      (final tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyListWidget(),
        ),
      ),
    );

    final column = tester.widget<Column>(find.byType(Column));
    expect(column.mainAxisAlignment, MainAxisAlignment.center);
  });
}
