import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/exceptions/failure.dart';
import '../../domain/entities/task.dart';
import '../../domain/entities/task_filter_options.dart';
import '../../domain/repositories/tasks_repository_contract.dart';

part 'tasks_cubit.freezed.dart';
part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this._tasksRepository) : super(const TasksStateInitial());

  final TasksRepositoryContract _tasksRepository;
  List<Task> _tasks = [];

  TaskFilterOptions? _currentFilter;

  Future<void> loadTasks() async {
    emit(const LoadingTasks());

    try {
      _tasks = await _tasksRepository.getTasks();

      emitLoaded();
    } on Failure catch (e) {
      emit(TasksErrors(e.message));
    }
  }

  void filterTasksByCompletion(final TaskFilterOptions option) {
    _currentFilter = option;

    if (option == TaskFilterOptions.all) {
      emitLoaded();
      return;
    }

    final filteredTasks = _tasks
        .where(
          (final task) =>
              task.completed == (option == TaskFilterOptions.completed),
        )
        .toList();

    emit(TasksLoaded(filteredTasks));
  }

  Future<void> addTask(final Task task) async {
    emit(const SavingTask());

    try {
      final newTask = await _tasksRepository.addTask(task);

      _tasks.add(newTask);

      emit(const SavedTask());
    } on Failure catch (e) {
      emit(TasksErrors(e.message));
    } finally {
      emitLoaded();
    }
  }

  Future<void> updateTask(final Task task) async {
    emit(const SavingTask());

    try {
      await _tasksRepository.updateTask(task);

      final index = _tasks.indexWhere((final element) => element.id == task.id);

      _tasks[index] = task;

      emit(const SavedTask());
    } on Failure catch (e) {
      emit(TasksErrors(e.message));
    } finally {
      emitLoaded();
    }
  }

  Future<void> deleteTask(final int taskId) async {
    emit(const SavingTask());

    try {
      await _tasksRepository.deleteTask(taskId);

      _tasks.removeWhere((final element) => element.id == taskId);

      emit(const DeletedTask());
    } on Failure catch (e) {
      emit(TasksErrors(e.message));
    } finally {
      emitLoaded();
    }
  }

  void emitLoaded() {
    if (_currentFilter != TaskFilterOptions.all) {
      filterTasksByCompletion(_currentFilter ?? TaskFilterOptions.all);
      return;
    }
    emit(TasksLoaded(_tasks));
  }
}
