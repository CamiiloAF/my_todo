import 'package:sqflite/sqflite.dart';

import '../../../core/di/dependency_injector.dart';
import '../../../core/di/di_manager.dart';

class DatabaseDI implements DependencyInjector {
  DatabaseDI(this.database);

  final Database database;

  @override
  void initializeDependencies() {
    DIManager.getIt.registerSingleton<Database>(database);
  }
}
