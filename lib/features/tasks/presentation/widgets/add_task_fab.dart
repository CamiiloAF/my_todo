import 'package:flutter/material.dart';

import 'add_task_form.dart';

class AddTaskFab extends StatefulWidget {
  const AddTaskFab({super.key});

  @override
  State<AddTaskFab> createState() => _AddTaskFabState();
}

class _AddTaskFabState extends State<AddTaskFab> {
  bool isFABVisible = true;

  @override
  Widget build(final BuildContext context) {
    return Visibility(
      visible: isFABVisible,
      child: FloatingActionButton(
        backgroundColor: Colors.tealAccent[100],
        child: const Icon(Icons.add),

        onPressed: () {
          setState(() {
            isFABVisible = false;
          });

          showBottomSheet(
            context: context,
            builder: (final context) => const AddTaskForm(),
          ).closed.then((final value) {
            setState(() {
              isFABVisible = true;
            });
          });
        },
      ),
    );
  }
}
