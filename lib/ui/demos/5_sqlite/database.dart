
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static const _databaseName = "my_database.db";
  static const _databaseVersion = 1;

  static const table = 'my_table';
  static const columnId = '_id';
  static const name = 'name';
  static const age = 'age';

  late Database _database;

  Future<void> init() async {
    final folder = await getApplicationDocumentsDirectory();
    final path = join(folder.path, _databaseName);
    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        
      },
    );
    print(path);

  }

  Future<void> _onCreate(Database db, int version) async {
    final sql = '''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $name TEXT NOT NULL,
        $age INTEGER NOT NULL
      )
    ''';
  }
}