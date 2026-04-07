
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "my_database.db";
  static const _databaseVersion = 1;

  static const table = 'my_table';
  static const columnId = '_id';
  static const name = 'name';
  static const age = 'age';
  Future<void> init() async {
    final folder = await getApplicationDocumentsDirectory();
    final path = '$folder/$_databaseName';
    print(path);

  }
}