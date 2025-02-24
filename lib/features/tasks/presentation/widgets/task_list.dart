import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_managers/tasks_cubit.dart';
import 'task_empty.dart';
import 'task_list_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      buildWhen: (final previous, final current) {
        return current is TasksLoaded ||
            current is TasksErrors ||
            current is LoadingTasks ||
            current is TasksStateInitial ||
            current is TasksLoaded;
      },
      builder: (final context, final state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (final tasks) => tasks.isNotEmpty
              ? ListView.builder(
                  key: const ValueKey('task_list_view'),
                  controller: scrollController,
                  itemCount: tasks.length,
                  itemBuilder: (final context, final index) {
                    final task = tasks[index];

                    return TaskListItem(
                      task: task,
                      key: ValueKey('task_${task.id}'),
                    );
                  },
                )
              : const EmptyListWidget(),
          error: (final message) => Center(
            child: Text(message),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
