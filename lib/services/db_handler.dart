import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqf_lite_app/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHandler extends ChangeNotifier {
  Database? _database;

  static final DBHandler instance = DBHandler();
  static const String databaseName = 'hardik1.db';
  static const tableName = "hardikTable";
  static const int databaseVersion = 1;
  List<UserModel> _list = [];
  List<UserModel> get list => _list;

  static const columnid = "id";
  static const columnname = "name";
  static const columnage = "age";

  Future<Database?> get database async {
    _database ??= await initDb();
    return _database;
  }

  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    _database = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) {
        db.execute('''
CREATE TABLE $tableName(
$columnid INTEGER PRIMARY KEY,
$columnname TEXT NOT NULL,
$columnage INTEGER NOT NULL
)
''');
      },
    );
    return _database;
  }

  Future insertData(UserModel userModel) async {
    Database? db = await instance.database;
    return await db!.insert(tableName, userModel.toMap());
  }

  readData() async {
    _list = [];
    Database? db = await instance.database;
    List<Map<String, dynamic>> readlist = await db!.query(tableName);

    for (int i = 0; i < readlist.length; i++) {
      _list.add(UserModel.fromMap(readlist[i]));
    }
    debugPrint("-----?? $list");
    return list;
    // return readlist.map((map) => UserModel.fromMap(map)).toList();
  }

  updateData(UserModel userModel) async {
    Database? db = await instance.database;
    return await db!.update(tableName, userModel.toMap(),
        where: "id = ?", whereArgs: [userModel.id]);
  }

  Future deleteData(int id) async {
    Database? db = await instance.database;
    return await db!.delete(tableName, where: 'id =?', whereArgs: [id]);
  }

  Future clearTable(String tableName) async {
    Database? db = await database;
    return await db!.delete(tableName);
  }
}
