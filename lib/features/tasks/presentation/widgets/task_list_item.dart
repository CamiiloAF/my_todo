import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../state_managers/tasks_cubit.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(final BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (final direction) {
        context.read<TasksCubit>().deleteTask(task.id);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: task.completed ? Colors.grey[300] : Colors.white,
        child: InkWell(
          onTap: () async {
            final cubit = context.read<TasksCubit>();
            await _updateTask(value: !task.completed, cubit: cubit);
          },
          child: ListTile(
            title: Text(task.title),
            leading: Checkbox(
              value: task.completed,
              onChanged: (final value) async {
                final cubit = context.read<TasksCubit>();
                await _updateTask(value: value, cubit: cubit);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateTask({
    required final bool? value,
    required final TasksCubit cubit,
  }) async {
    final taskToUpdate = task.copyWith(completed: value);
    await cubit.updateTask(taskToUpdate);
  }
}
