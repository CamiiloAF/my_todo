import 'package:sqflite/sqflite.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/local_storage/database_tables.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/tasks_repository_contract.dart';

class TasksRepository implements TasksRepositoryContract {
  TasksRepository({
    required final Database database,
  }) : _database = database;

  final Database _database;

  @override
  Future<List<Task>> getTasks() async {
    try {
      final result = await _database.query(DatabaseTables.tasks);

      return result.map((final e) => Task.fromJson(e)).toList();
    } catch (_) {
      throw Failure('We could not get the tasks');
    }
  }

  @override
  Future<Task> addTask(final Task task) async {
    try {
      final savedId =
          await _database.insert(DatabaseTables.tasks, task.toJson());

      return task.copyWith(id: savedId);
    } catch (_) {
      throw Failure('We could not save the task');
    }
  }

  @override
  Future<void> updateTask(final Task task) async {
    try {
      await _database.update(
        DatabaseTables.tasks,
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch (_) {
      throw Failure('We could not update the task');
    }
  }

  @override
  Future<void> deleteTask(final int taskId) async {
    try {
      await _database.delete(
        DatabaseTables.tasks,
        where: 'id = ?',
        whereArgs: [taskId],
      );
    } catch (_) {
      throw Failure('We could not delete the task');
    }
  }
}
