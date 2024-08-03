import 'package:flutter/material.dart';

@immutable
class Task {
  const Task({
    required this.id,
    required this.title,
    this.completed = false,
  });

  factory Task.fromJson(final Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['completed'] == 1,
    );
  }

  final int id;
  final String title;
  final bool completed;

  Task copyWith({
    final int? id,
    final String? title,
    final bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ completed.hashCode;

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $title, completed: $completed}';
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completed': completed ? 1 : 0,
    };
  }
}
