import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../state_managers/tasks_cubit.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  late final FocusNode _focusNode;
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocListener<TasksCubit, TasksState>(
      listener: (final context, final state) {
        state.whenOrNull(
          saved: () {
            Navigator.of(context).pop();
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 8,
              ),
              child: TextField(
                focusNode: _focusNode,
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'Task name',
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (final _) async {
                  await saveTask();
                },
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check, color: Colors.teal,),
            onPressed: () async {
              await saveTask();
            },
          ),
        ],
      ),
    );
  }

  Future<void> saveTask() async {
    final taskName = _textController.value.text;

    final task = Task(id: 0, title: taskName);

    await context.read<TasksCubit>().addTask(task);
  }
}
