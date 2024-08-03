import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_managers/tasks_cubit.dart';
import 'task_empty.dart';
import 'task_list_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

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
                  itemCount: tasks.length,
                  itemBuilder: (final context, final index) {
                    final task = tasks[index];

                    return TaskListItem(task: task);
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
