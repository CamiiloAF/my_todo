import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo/core/exceptions/failure.dart';
import 'package:my_todo/features/tasks/domain/entities/task.dart';
import 'package:my_todo/features/tasks/domain/entities/task_filter_options.dart';
import 'package:my_todo/features/tasks/domain/repositories/tasks_repository_contract.dart';
import 'package:my_todo/features/tasks/presentation/state_managers/tasks_cubit.dart';

import 'tasks_cubit_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<TasksRepositoryContract>(),
  ],
)
void main() {
  late MockTasksRepositoryContract mockTasksRepositoryContract;
  late TasksCubit tasksCubit;

  setUp(() {
    mockTasksRepositoryContract = MockTasksRepositoryContract();
    tasksCubit = TasksCubit(mockTasksRepositoryContract);
  });

  tearDown(() {
    tasksCubit.close();
  });

  group('loadTasks', () {
    blocTest<TasksCubit, TasksState>(
      'emits [LoadingTasks, TasksLoaded] when tasks are loaded successfully',
      build: () {
        when(mockTasksRepositoryContract.getTasks()).thenAnswer(
          (final _) async => [const Task(id: 1, title: 'Test Task')],
        );
        return tasksCubit;
      },
      act: (final cubit) => cubit.loadTasks(),
      expect: () => [
        const LoadingTasks(),
        const TasksLoaded([Task(id: 1, title: 'Test Task')]),
      ],
    );

    blocTest<TasksCubit, TasksState>(
      'emits [LoadingTasks, TasksErrors] when loading tasks fails',
      build: () {
        when(mockTasksRepositoryContract.getTasks())
            .thenThrow(Failure('Failed to load tasks'));
        return tasksCubit;
      },
      act: (final cubit) => cubit.loadTasks(),
      expect: () =>
          [const LoadingTasks(), const TasksErrors('Failed to load tasks')],
    );
  });

  group(
    'filterTasksByCompletion',
    () {
      final tasks = [
        const Task(id: 1, title: 'Test Task', completed: true),
        const Task(id: 2, title: 'Another Task'),
      ];

      blocTest<TasksCubit, TasksState>(
        'emits [TasksLoaded] with all tasks when filter is set to all',
        build: () => tasksCubit,
        setUp: () async {
          when(mockTasksRepositoryContract.getTasks()).thenAnswer(
            (final _) async => tasks,
          );
          await tasksCubit.loadTasks();
        },
        seed: () => const TasksStateInitial(),
        act: (final cubit) =>
            cubit.filterTasksByCompletion(TaskFilterOptions.all),
        expect: () => [
          TasksLoaded(tasks),
        ],
      );

      blocTest<TasksCubit, TasksState>(
        'emits [TasksLoaded] with only completed tasks when filter is set to completed',
        build: () => tasksCubit,
        setUp: () async {
          when(mockTasksRepositoryContract.getTasks()).thenAnswer(
            (final _) async => tasks,
          );
          await tasksCubit.loadTasks();
        },
        act: (final cubit) =>
            cubit.filterTasksByCompletion(TaskFilterOptions.completed),
        expect: () => [
          TasksLoaded([
            tasks[0],
          ]),
        ],
      );

      blocTest<TasksCubit, TasksState>(
        'emits [TasksLoaded] with only pending tasks when filter is set to pending',
        build: () {
          return tasksCubit;
        },
        setUp: () async {
          when(mockTasksRepositoryContract.getTasks()).thenAnswer(
            (final _) async => tasks,
          );
          await tasksCubit.loadTasks();
        },
        act: (final cubit) =>
            cubit.filterTasksByCompletion(TaskFilterOptions.pending),
        expect: () => [
          TasksLoaded([
            tasks[1],
          ]),
        ],
      );
    },
  );

  group(
    'addTask',
    () {
      const task = Task(id: 1, title: 'Test Task');

      blocTest<TasksCubit, TasksState>(
        'emits [SavingTask, SavedTask, TasksLoaded] when a task is added successfully',
        build: () {
          when(mockTasksRepositoryContract.addTask(any)).thenAnswer(
            (final _) async => task,
          );
          return tasksCubit;
        },
        act: (final cubit) => cubit.addTask(task),
        expect: () => [
          const SavingTask(),
          const SavedTask(),
          const TasksLoaded([task]),
        ],
      );

      blocTest<TasksCubit, TasksState>(
        'emits [SavingTask, TasksErrors, TasksLoaded] when adding a task fails',
        build: () {
          when(mockTasksRepositoryContract.addTask(any))
              .thenThrow(Failure('Failed to add task'));
          return tasksCubit;
        },
        act: (final cubit) => cubit.addTask(task),
        expect: () => [
          const SavingTask(),
          const TasksErrors('Failed to add task'),
          const TasksLoaded([]),
        ],
      );
    },
  );

  group(
    'updateTask',
    () {
      const task = Task(id: 1, title: 'Test Task');

      blocTest<TasksCubit, TasksState>(
        'emits [SavingTask, SavedTask, TasksLoaded] when a task is updated successfully',
        build: () {
          when(mockTasksRepositoryContract.updateTask(any)).thenAnswer(
            (final _) async => task,
          );
          return tasksCubit;
        },
        setUp: () async {
          when(mockTasksRepositoryContract.getTasks()).thenAnswer(
            (final _) async => [task],
          );
          await tasksCubit.loadTasks();
        },
        act: (final cubit) => cubit.updateTask(task),
        expect: () => [
          const SavingTask(),
          const SavedTask(),
          const TasksLoaded([task]),
        ],
      );

      blocTest<TasksCubit, TasksState>(
        'emits [SavingTask, TasksErrors, TasksLoaded] when updating a task fails',
        build: () {
          when(mockTasksRepositoryContract.updateTask(any))
              .thenThrow(Failure('Failed to update task'));
          return tasksCubit;
        },
        act: (final cubit) => cubit.updateTask(task),
        expect: () => [
          const SavingTask(),
          const TasksErrors('Failed to update task'),
          const TasksLoaded([]),
        ],
      );
    },
  );

  group(
    'deleteTask',
    () {
      const taskId = 1;

      blocTest<TasksCubit, TasksState>(
        'emits [SavingTask, DeletedTask, TasksLoaded] when a task is deleted successfully',
        build: () {
          when(mockTasksRepositoryContract.deleteTask(any)).thenAnswer(
            (final _) async => taskId,
          );
          return tasksCubit;
        },
        setUp: () async {
          when(mockTasksRepositoryContract.getTasks()).thenAnswer(
            (final _) async => [const Task(id: 1, title: 'Test Task')],
          );
          await tasksCubit.loadTasks();
        },
        act: (final cubit) => cubit.deleteTask(taskId),
        expect: () => [
          const SavingTask(),
          const DeletedTask(),
          const TasksLoaded([]),
        ],
      );

      blocTest<TasksCubit, TasksState>(
        'emits [SavingTask, TasksErrors, TasksLoaded] when deleting a task fails',
        build: () {
          when(mockTasksRepositoryContract.deleteTask(any))
              .thenThrow(Failure('Failed to delete task'));
          return tasksCubit;
        },
        act: (final cubit) => cubit.deleteTask(taskId),
        expect: () => [
          const SavingTask(),
          const TasksErrors('Failed to delete task'),
          const TasksLoaded([]),
        ],
      );
    },
  );
}
