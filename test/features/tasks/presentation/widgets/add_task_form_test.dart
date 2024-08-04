import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_todo/features/tasks/domain/entities/task.dart';
import 'package:my_todo/features/tasks/presentation/widgets/add_task_form.dart';

import 'add_task_form_test.mocks.dart';

abstract class AddTaskFunction {
  Future<void> call(final Task task);
}

@GenerateMocks([AddTaskFunction])
void main() {
  late MockAddTaskFunction mockAddTask;

  setUp(() {
    mockAddTask = MockAddTaskFunction();
  });

  testWidgets('AddTaskForm requests focus on init', (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddTaskForm(
            addTask: (final task) => mockAddTask(task),
          ),
        ),
      ),
    );

    expect(
      FocusScope.of(tester.element(find.byType(TextField))).hasFocus,
      isTrue,
    );
  });

  testWidgets('AddTaskForm saves task on submit', (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddTaskForm(addTask: (final task) => mockAddTask(task)),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    verify(mockAddTask(const Task(id: 0, title: 'New Task'))).called(1);
  });

  testWidgets('AddTaskForm saves task on button press', (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddTaskForm(addTask: (final task) => mockAddTask(task)),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(mockAddTask(const Task(id: 0, title: 'New Task'))).called(1);
  });

  testWidgets('AddTaskForm does not save empty task', (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddTaskForm(addTask: (final task) => mockAddTask(task)),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verifyNever(mockAddTask(const Task(id: 0, title: 'New Task')));
  });

  testWidgets('AddTaskForm pops context after saving task',
      (final tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddTaskForm(addTask: (final task) => mockAddTask(task)),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(find.byType(AddTaskForm), findsNothing);
  });
}
