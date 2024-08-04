import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo/features/tasks/domain/entities/task_filter_options.dart';
import 'package:my_todo/features/tasks/presentation/state_managers/tasks_cubit.dart';
import 'package:my_todo/features/tasks/presentation/widgets/task_filter.dart';

import 'task_filter_test.mocks.dart';

@GenerateMocks([TasksCubit])
void main() {
  late MockTasksCubit tasksCubit;

  setUp(() {
    tasksCubit = MockTasksCubit();
    when(tasksCubit.stream).thenAnswer((final _) => const Stream.empty());
  });

  testWidgets('TaskFilter displays all filter options', (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskFilter()),
        ),
      ),
    );

    await tester.tap(find.byType(DropdownButton<TaskFilterOptions>));
    await tester.pump();

    for (final option in TaskFilterOptions.values) {
      expect(find.text(option.text), findsAny);
    }
  });

  testWidgets('TaskFilter changes selected filter on selection',
      (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskFilter()),
        ),
      ),
    );

    await tester.tap(find.byType(DropdownButton<TaskFilterOptions>));
    await tester.pump();

    await tester.tap(find.text(TaskFilterOptions.completed.text).last);
    await tester.pump();

    expect(find.text(TaskFilterOptions.completed.text), findsOneWidget);
  });

  testWidgets('TaskFilter calls filterTasksByCompletion on selection',
      (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskFilter()),
        ),
      ),
    );

    await tester.tap(find.byType(DropdownButton<TaskFilterOptions>));
    await tester.pump();

    await tester.tap(find.text(TaskFilterOptions.completed.text).last);
    await tester.pump();

    verify(tasksCubit.filterTasksByCompletion(TaskFilterOptions.completed))
        .called(1);
  });

  testWidgets('TaskFilter retains selected filter after rebuild',
      (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskFilter()),
        ),
      ),
    );

    await tester.tap(find.byType(DropdownButton<TaskFilterOptions>));
    await tester.pump();

    await tester.tap(find.text(TaskFilterOptions.completed.text).last);
    await tester.pump();

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskFilter()),
        ),
      ),
    );

    expect(find.text(TaskFilterOptions.completed.text), findsOneWidget);
  });
}
