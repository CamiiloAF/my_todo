import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/tasks/di/tasks_di.dart';
import '../local_storage/di/database_di.dart';

abstract class DIManager {
  static GetIt getIt = GetIt.instance;

  static void initializeDependencies({required final Database database}) {
    final dependencies = [
      DatabaseDI(database),
      TasksDI(),
    ];

    for (final dependency in dependencies) {
      dependency.initializeDependencies();
    }
  }
}
