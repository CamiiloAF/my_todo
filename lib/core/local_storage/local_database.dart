import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_tables.dart';

abstract class LocalDatabase {
  static Future<Database> initializeDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (final db, final version) {
        return db.execute(
          'CREATE TABLE ${DatabaseTables.tasks}(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, completed INTEGER NOT NULL DEFAULT 0)',
        );
      },
      version: 1,
    );
  }
}
