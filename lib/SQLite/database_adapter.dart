import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "workouts.db";
  static const _databaseVersion = 1;

  static const table = 'workouts';

  static const columnId = 'id';
  static const columnDate = 'date';
  static const columnRun = 'run';
  static const columnCrunches = 'crunches';
  static const columnSquats = 'squats';
  static const columnPushups = 'pushups';

  // Singleton instance
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Open the database
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, _databaseName),
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnDate TEXT NOT NULL,
            $columnRun INTEGER,
            $columnCrunches INTEGER,
            $columnSquats INTEGER,
            $columnPushups INTEGER
          )
        ''');
      },
    );
  }

  // Insert a new workout
  Future<int> insertWorkout({
    required String date,
    int? run,
    int? crunches,
    int? squats,
    int? pushups,
  }) async {
    final db = await database;
    return await db.insert(table, {
      columnDate: date,
      columnRun: run,
      columnCrunches: crunches,
      columnSquats: squats,
      columnPushups: pushups,
    });
  }

  Future<void> updateOrInsertField({
    required String date,
    required String field, // Название поля, например 'run'
    required int value,
  }) async {
    final db = await database;

    // Проверим, есть ли запись на сегодня
    final existing = await db.query(
      table,
      where: 'date = ?',
      whereArgs: [date],
    );

    if (existing.isNotEmpty) {
      // Обновляем только нужное поле
      await db.update(
        table,
        {field: value},
        where: 'date = ?',
        whereArgs: [date],
      );
    } else {
      // Вставляем новую строку с одним полем
      await db.insert(table, {
        'date': date,
        field: value,
      });
    }
  }


  // Get all workouts (or you could add filtering by date if needed)
  Future<List<Map<String, dynamic>>> getAllWorkouts() async {
    final db = await database;
    return await db.query(table);
  }
}

