import 'package:flutter/material.dart';

import '../../domain/entities/task_filter_options.dart';

class TaskFilter extends StatefulWidget {
  const TaskFilter({Key? key}) : super(key: key);

  @override
  _TaskFilterState createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {
  final List<TaskFilterOptions> _filterOptions = TaskFilterOptions.values;
  TaskFilterOptions _selectedFilter = TaskFilterOptions.all;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TaskFilterOptions>(
      value: _selectedFilter,
      icon: const Icon(Icons.filter_list),
      onChanged: (TaskFilterOptions? newValue) {
        setState(() {
          _selectedFilter = newValue!;
        });
      },
      items: _filterOptions
          .map<DropdownMenuItem<TaskFilterOptions>>((TaskFilterOptions value) {
        return DropdownMenuItem<TaskFilterOptions>(
          value: value,
          child: Text(value.text),
        );
      }).toList(),
    );
  }
}
