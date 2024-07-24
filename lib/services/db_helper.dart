import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  // varibales
  static const String dbName = 'myDatabase.db';
  static const int dbVesrion = 1;
  static const dbTable = "myTable";
  static const columnId = "id";
  static const columnName = "name";

// constructor
  static final DataBaseHelper instance = DataBaseHelper();

  // databse initializ
  static Database? _dataBase;
  Future<Database?> get database async {
    _dataBase ??= await initDb();
    return _dataBase;
  }

  initDb() async {
    Directory direcotry = await getApplicationDocumentsDirectory();
    String path = join(direcotry.path, dbName);
    return await openDatabase(
      path,
      version: dbVesrion,
      onCreate: onCreate,
    );
  }

  Future onCreate(Database db, int version) async {
    db.execute('''
CREATE TABLE $dbTable(
$columnId INTEGER PRIMARY KEY,
$columnName TEXT NOT NULL
)
 ''');
  }

//insert
  Future insertRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(dbTable, row);
  }

// read or query
  Future<List<Map<String, dynamic>>> queryDataBase() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  // update
  Future<int> upadateRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(dbTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // delete
  Future<int> deleteRecord(int id) async {
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$columnId = ?', whereArgs: [id]);
  }
}
