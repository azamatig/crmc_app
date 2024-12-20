import 'dart:async';
import 'dart:io';

import 'package:crmc_app/data/sql.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(crmDB);
      await db.execute(contacts);
      await db.execute(contracts);
      await db.rawInsert(
          "INSERT INTO CRMDB(id,login,password,userId) VALUES (1,'null', 'null','null')");
    });
  }
}
