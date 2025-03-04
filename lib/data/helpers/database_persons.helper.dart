import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'persons.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE persons (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            surname_first TEXT NOT NULL,
            surname_second TEXT,
            phone TEXT UNIQUE NOT NULL,
            email TEXT UNIQUE NOT NULL,
            date_of_birth TEXT NOT NULL,
            age INTEGER NOT NULL CHECK(age > 0),
            gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
            image_path TEXT
          )
        ''');
      },
    );
  }
}
