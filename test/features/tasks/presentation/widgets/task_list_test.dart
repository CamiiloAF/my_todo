import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo/features/tasks/domain/entities/task.dart';
import 'package:my_todo/features/tasks/presentation/state_managers/tasks_cubit.dart';
import 'package:my_todo/features/tasks/presentation/widgets/task_empty.dart';
import 'package:my_todo/features/tasks/presentation/widgets/task_list.dart';
import 'package:my_todo/features/tasks/presentation/widgets/task_list_item.dart';

import 'task_filter_test.mocks.dart';

void main() {
  late MockTasksCubit mockTasksCubit;

  setUp(() {
    mockTasksCubit = MockTasksCubit();
    when(mockTasksCubit.stream).thenAnswer((final _) => const Stream.empty());
  });

  testWidgets('TaskList displays CircularProgressIndicator when loading',
      (final tester) async {
    when(mockTasksCubit.state).thenReturn(const LoadingTasks());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => mockTasksCubit,
          child: TaskList(scrollController: ScrollController()),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('TaskList displays tasks when loaded', (final tester) async {
    final tasks = [const Task(id: 1, title: 'Task 1')];
    when(mockTasksCubit.state).thenReturn(TasksLoaded(tasks));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => mockTasksCubit,
          child: Material(child: TaskList(scrollController: ScrollController())),
        ),
      ),
    );

    expect(find.byType(TaskListItem), findsOneWidget);
    expect(find.text('Task 1'), findsOneWidget);
  });

  testWidgets('TaskList displays EmptyListWidget when no tasks',
      (final tester) async {
    when(mockTasksCubit.state).thenReturn(const TasksLoaded([]));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => mockTasksCubit,
          child: TaskList(scrollController: ScrollController()),
        ),
      ),
    );

    expect(find.byType(EmptyListWidget), findsOneWidget);
  });

  testWidgets('TaskList displays error message when error occurs',
      (final tester) async {
    when(mockTasksCubit.state).thenReturn(const TasksErrors('Error loading tasks'));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TasksCubit>(
          create: (final _) => mockTasksCubit,
          child: TaskList(scrollController: ScrollController()),
        ),
      ),
    );

    expect(find.text('Error loading tasks'), findsOneWidget);
  });
}
