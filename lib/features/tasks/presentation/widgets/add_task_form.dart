import 'package:flutter/material.dart';

import '../../domain/entities/task.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({required this.addTask, super.key});

  final Future<void> Function(Task task) addTask;

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
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
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
            icon: const Icon(
              Icons.check,
              color: Colors.teal,
            ),
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

    if (taskName.isEmpty) {
      Navigator.pop(context);
      return;
    }

    final task = Task(id: 0, title: taskName);

    await widget.addTask(task);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
