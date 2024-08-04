import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo/core/exceptions/failure.dart';
import 'package:my_todo/core/local_storage/database_tables.dart';
import 'package:my_todo/features/tasks/data/repositories/tasks_repository.dart';
import 'package:my_todo/features/tasks/domain/entities/task.dart';
import 'package:sqflite/sqflite.dart';

import 'tasks_repository_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<Database>(),
  ],
)
void main() {
  late TasksRepository repository;
  late MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    repository = TasksRepository(database: mockDatabase);
  });

  group('getTasks', () {
    test('returnsListOfTasksWhenQuerySucceeds', () async {
      when(mockDatabase.query(any)).thenAnswer(
        (final _) async => [
          {'id': 1, 'title': 'Task 1', 'completed': 1},
          {'id': 2, 'title': 'Task 2', 'completed': 0},
        ],
      );

      final result = await repository.getTasks();

      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].title, 'Task 1');
      expect(result[0].completed, true);

      expect(result[1].completed, false);
    });

    test('throwsFailureWhenQueryFails', () async {
      when(mockDatabase.query(DatabaseTables.tasks)).thenThrow(Exception());

      expect(() async => repository.getTasks(), throwsA(isA<Failure>()));
    });
  });

  group('addTask', () {
    const task = Task(id: -1, title: 'Task 1');

    test('returnsTaskWithIdWhenInsertSucceeds', () async {
      when(mockDatabase.insert(DatabaseTables.tasks, task.toJson()))
          .thenAnswer((final _) async => 1);

      final result = await repository.addTask(task);

      expect(result.id, 1);
      expect(result.title, task.title);
      expect(result.completed, false);
    });

    test('throwsFailureWhenInsertFails', () async {
      when(mockDatabase.insert(DatabaseTables.tasks, task.toJson()))
          .thenThrow(Exception());

      expect(
        () async => repository.addTask(task),
        throwsA(isA<Failure>()),
      );
    });
  });

  group('updateTask', () {
    const task = Task(id: -1, title: 'Task 1');

    test('completesSuccessfullyWhenUpdateSucceeds', () async {
      when(
        mockDatabase.update(
          DatabaseTables.tasks,
          task.toJson(),
          where: 'id = ?',
          whereArgs: [task.id],
        ),
      ).thenAnswer((final _) async => 1);

      await repository.updateTask(task);

      verify(
        mockDatabase.update(
          DatabaseTables.tasks,
          task.toJson(),
          where: 'id = ?',
          whereArgs: [task.id],
        ),
      ).called(1);
    });

    test('throwsFailureWhenUpdateFails', () async {
      when(
        mockDatabase.update(
          DatabaseTables.tasks,
          task.toJson(),
          where: 'id = ?',
          whereArgs: [task.id],
        ),
      ).thenThrow(Exception());

      expect(
        () async => repository.updateTask(task),
        throwsA(isA<Failure>()),
      );
    });
  });

  group('deleteTask', () {
    const taskId = 1;

    test('completesSuccessfullyWhenDeleteSucceeds', () async {
      when(
        mockDatabase.delete(
          DatabaseTables.tasks,
          where: 'id = ?',
          whereArgs: [taskId],
        ),
      ).thenAnswer((final _) async => 1);

      await repository.deleteTask(taskId);

      verify(
        mockDatabase.delete(
          DatabaseTables.tasks,
          where: 'id = ?',
          whereArgs: [taskId],
        ),
      ).called(1);
    });

    test('throwsFailureWhenDeleteFails', () async {
      when(
        mockDatabase.delete(
          DatabaseTables.tasks,
          where: 'id = ?',
          whereArgs: [taskId],
        ),
      ).thenThrow(Exception());

      expect(
        () async => repository.deleteTask(taskId),
        throwsA(isA<Failure>()),
      );
    });
  });
}
