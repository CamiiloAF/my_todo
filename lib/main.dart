import 'package:flutter/material.dart';

import 'core/di/di_manager.dart';
import 'core/local_storage/local_database.dart';
import 'features/tasks/presentation/pages/tasks_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await LocalDatabase.initializeDatabase();

  DIManager.initializeDependencies(database: database);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Tasks App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TasksPage(),
    );
  }
}
