import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await _getDatabase();
    return _db!;
  }

  Future<void> init() async {
    await database;
  }

  Future<Database> _getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final path = '$databaseDirPath/kairo.db';

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // DEBUG TIDAK BISA SAVE GAMBAR DALAM BENTUK BYTES
        // UBAH KE PATH SEBELUM SAVE KE SQFLITE
        await db.execute('''
          CREATE TABLE predicted_trashes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            class_name TEXT,
            confidence TEXT,
            image TEXT 
            created_at TEXT
          )
        ''');
      },
    );

    return database;
  }
}
