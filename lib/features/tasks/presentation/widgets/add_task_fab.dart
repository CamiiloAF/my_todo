import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../state_managers/tasks_cubit.dart';
import 'add_task_form.dart';

class AddTaskFab extends StatefulWidget {
  const AddTaskFab({required this.isFABVisible, super.key});

  final bool isFABVisible;

  @override
  State<AddTaskFab> createState() => _AddTaskFabState();
}

class _AddTaskFabState extends State<AddTaskFab> {
  bool _isFABVisible = true;

  @override
  void initState() {
    _isFABVisible = widget.isFABVisible;
    super.initState();
  }

  @override
  void didUpdateWidget(final AddTaskFab oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isFABVisible = widget.isFABVisible;
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedOpacity(
      key: const ValueKey('fab_opacity'),
      duration: const Duration(milliseconds: 300),
      opacity: _isFABVisible ? 1 : 0,
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _changeFABVisibility(isVisible: false);

          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(),
            isScrollControlled: true,
            builder: (final _) => AddTaskForm(
              addTask: _addTask,
            ),
          ).whenComplete(
            () => _changeFABVisibility(isVisible: true),
          );
        },
      ),
    );
  }

  void _changeFABVisibility({required final bool isVisible}) {
    setState(() {
      _isFABVisible = isVisible;
    });
  }

  Future<void> _addTask(final Task task) {
    return context.read<TasksCubit>().addTask(task);
  }
}
