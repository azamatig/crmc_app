import 'package:crmc_app/data/crm_db.dart';
import 'package:pedantic/pedantic.dart' show unawaited;

import 'db_data.dart';

class UtilsDB {
  UtilsDB() {
    provider = DBProvider.db;
  }

  DBProvider provider;

  Future<List<dynamic>> getAll({item, table, name}) async {
    final db = await provider.database;
    var res = await db.query('$table');
    List<dynamic> list = res.isNotEmpty
        ? res.map((c) => item.fromJson(c["$name"])).toList()
        : [];
    return list;
  }

  insertNew({item, table, name}) async {
    final db = await provider.database;
    var isExist;
    await db
        .query("$table", where: "id = ?", whereArgs: [item.id])
        .then((val) => {isExist = val.first})
        .catchError((_) => isExist = null);
    if (isExist != null) {
      var res = await update(item: item, table: table, name: name);
      return res;
    }
    var timely = await CrmDB().getCRM();
    var res = await db.rawInsert("INSERT INTO $table(id,userId,$name) "
        "VALUES('${item.id}','${timely.userId}',"
        "'${item.toJson()}')");
    return res;
  }

  update({item, table, name}) async {
    final db = await provider.database;
    var res = await db.rawUpdate(
        """  UPDATE $table SET $name = '${item.toJson()}' WHERE id='${item.id}' """);
    if (res == 0) {
      unawaited(insertNew(item: item, table: table, name: name));
    }
    return res;
  }

  truncate({table, name}) async {
    final db = await provider.database;
    await createTable(table: table, name: name);
    await db.delete(table);
  }

  createTable({table, name}) async {
    final db = await provider.database;
    var res = true;
    await db.execute("""
        CREATE TABLE $table (
          id TEXT PRIMARY KEY,
          userId TEXT,
          $name TEXT
        )
        """).catchError((e) => {});
    return res;
  }
}
