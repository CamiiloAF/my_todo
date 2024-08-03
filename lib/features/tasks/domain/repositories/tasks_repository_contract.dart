import '../entities/task.dart';

abstract class TasksRepositoryContract {
  Future<List<Task>> getTasks();

  Future<Task> addTask(final Task task);

  Future<void> updateTask(final Task task);

  Future<void> deleteTask(final int taskId);
}
