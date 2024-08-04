import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo/features/tasks/domain/entities/task.dart';
import 'package:my_todo/features/tasks/presentation/state_managers/tasks_cubit.dart';
import 'package:my_todo/features/tasks/presentation/widgets/task_list_item.dart';

import '../state_managers/tasks_cubit_test.mocks.dart';

void main() {
  const task = Task(id: 1, title: 'Test Task');
  late TasksCubit tasksCubit;

  setUp(() {
    final repository = MockTasksRepositoryContract();
    when(repository.getTasks()).thenAnswer((final _) async => [task]);

    tasksCubit = TasksCubit(repository);
  });

  testWidgets('TaskListItem displays task title', (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskListItem(task: task)),
        ),
      ),
    );

    expect(find.text('Test Task'), findsOneWidget);
  });

  testWidgets('TaskListItem calls deleteTask on dismiss', (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskListItem(task: task)),
        ),
      ),
    );

    await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
    await tester.pumpAndSettle();

    verify(tasksCubit.deleteTask(task.id)).called(1);
  });

  testWidgets('TaskListItem updates task completion on tap',
      (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit..loadTasks(),
          child: const Material(child: TaskListItem(task: task)),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('task_list_item_inkwell')));
    await tester.pumpAndSettle();

    verify(tasksCubit.updateTask(task.copyWith(completed: true))).called(1);
  });

  testWidgets('TaskListItem updates task completion on checkbox change',
      (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit..loadTasks(),
          child: const Material(child: TaskListItem(task: task)),
        ),
      ),
    );

    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    verify(tasksCubit.updateTask(task.copyWith(completed: true))).called(1);
  });

  testWidgets('TaskListItem shows red background on dismiss',
      (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => tasksCubit,
          child: const Material(child: TaskListItem(task: task)),
        ),
      ),
    );

    await tester.drag(find.byType(Dismissible), const Offset(-50, 0));
    await tester.pump();

    final dismissibleContainerFinder =
        find.byKey(const Key('dismissible_container_1'));

    expect(
      (tester.widget(dismissibleContainerFinder) as Container).color,
      Colors.red,
    );
  });
}
