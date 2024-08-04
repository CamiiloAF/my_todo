import 'package:flutter_test/flutter_test.dart';
import 'package:my_todo/features/tasks/domain/entities/task.dart';

void main() {
  group('Task', () {
    test('should create a task with the given values', () {
      const task = Task(id: 1, title: 'Test', completed: true);

      expect(task.id, 1);
      expect(task.title, 'Test');
      expect(task.completed, true);
    });

    test('should create a task from JSON', () {
      const json = {
        'id': 1,
        'title': 'Test',
        'completed': 1,
      };

      final task = Task.fromJson(json);

      expect(task.id, 1);
      expect(task.title, 'Test');
      expect(task.completed, true);
    });

    test('should create a copy of a task with new values', () {
      const task = Task(id: 1, title: 'Test', completed: true);
      final copiedTask =
          task.copyWith(id: 2, title: 'New Test', completed: false);

      expect(copiedTask.id, 2);
      expect(copiedTask.title, 'New Test');
      expect(copiedTask.completed, false);
    });

    test('should compare two identical tasks as equal', () {
      const task1 = Task(id: 1, title: 'Test', completed: true);
      const task2 = Task(id: 1, title: 'Test', completed: true);

      expect(task1, task2);
    });

    test('should convert a task to JSON', () {
      const task = Task(id: 1, title: 'Test', completed: true);
      final json = task.toJson();

      expect(json, {
        'title': 'Test',
        'completed': 1,
      });
    });
  });
}
