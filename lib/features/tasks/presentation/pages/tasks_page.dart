import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di_manager.dart';
import '../../domain/repositories/tasks_repository_contract.dart';
import '../state_managers/tasks_cubit.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/task_filter.dart';
import '../widgets/task_list.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final ScrollController _scrollController = ScrollController();
  bool isFABVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isFABVisible = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          isFABVisible = true;
        });
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => TasksCubit(
        DIManager.getIt<TasksRepositoryContract>(),
      )..loadTasks(),
      child: BlocListener<TasksCubit, TasksState>(
        listener: (final context, final state) {
          state.whenOrNull(
            loaded: (final _) => setState(
              () => isFABVisible = true,
            ),
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
          floatingActionButton: AddTaskFab(isFABVisible: isFABVisible),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: TaskFilter(),
              ),
              Expanded(
                child: TaskList(
                  scrollController: _scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
