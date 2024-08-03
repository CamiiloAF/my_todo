import 'package:sqflite/sqflite.dart';

import '../../../core/di/dependency_injector.dart';
import '../../../core/di/di_manager.dart';
import '../data/repositories/tasks_repository.dart';
import '../domain/repositories/tasks_repository_contract.dart';

class TasksDI implements DependencyInjector {
  @override
  void initializeDependencies() {
    DIManager.getIt.registerSingleton<TasksRepositoryContract>(
      TasksRepository(database: DIManager.getIt<Database>()),
    );
  }
}
