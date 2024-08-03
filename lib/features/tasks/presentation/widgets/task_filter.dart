import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task_filter_options.dart';
import '../state_managers/tasks_cubit.dart';

class TaskFilter extends StatefulWidget {
  const TaskFilter({super.key});

  @override
  State<TaskFilter> createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {
  final List<TaskFilterOptions> _filterOptions = TaskFilterOptions.values;
  TaskFilterOptions _selectedFilter = TaskFilterOptions.all;

  @override
  Widget build(final BuildContext context) {
    return DropdownButton<TaskFilterOptions>(
      value: _selectedFilter,
      icon: const Icon(Icons.filter_list),
      onChanged: (final newValue) {
        setState(() {
          _selectedFilter = newValue!;
        });
        context.read<TasksCubit>().filterTasksByCompletion(_selectedFilter);
      },
      items: _filterOptions
          .map<DropdownMenuItem<TaskFilterOptions>>((final value) {
        return DropdownMenuItem<TaskFilterOptions>(
          value: value,
          child: Text(value.text),
        );
      }).toList(),
    );
  }
}
