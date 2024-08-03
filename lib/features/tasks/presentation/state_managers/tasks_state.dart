part of 'tasks_cubit.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = TasksStateInitial;

  const factory TasksState.loading() = LoadingTasks;

  const factory TasksState.saving() = SavingTask;

  const factory TasksState.saved() = SavedTask;

  const factory TasksState.deleted() = DeletedTask;

  const factory TasksState.error(final String message) = TasksErrors;

  const factory TasksState.loaded(
    final List<Task> tasks,
  ) = TasksLoaded;
}
