import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di_manager.dart';
import '../../domain/repositories/tasks_repository_contract.dart';
import '../state_managers/tasks_cubit.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/task_filter.dart';
import '../widgets/task_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => TasksCubit(
        DIManager.getIt<TasksRepositoryContract>(),
      )..loadTasks(),
      child: BlocListener<TasksCubit, TasksState>(
        listener: (final context, final state) {
          state.whenOrNull(
            error: (final message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tasks'),
          ),
          floatingActionButton: const AddTaskFab(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: const TaskFilter(),
              ),
              Expanded(child: const TaskList()),
            ],
          ),
        ),
      ),
    );
  }
}
