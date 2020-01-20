import 'package:crmc_app/models/dbCrmModel.dart';

import 'dbData.dart';

class CrmDB {
  CrmDB() {
    provider = DBProvider.db;
  }

  DBProvider provider;

  Future<CRM> getCRM() async {
    final db = await provider.database;
    var res = await db.query("CRMDB");
    CRM item =
        res.isNotEmpty ? res.map((c) => CRM.fromMap(c)).toList()[0] : null;
    return item;
  }

  Future<int> updateClient(CRM newCRM) async {
    final db = await provider.database;
    int res = await db.update("CRMDB", newCRM.toMap(), where: "id = 1");
    return res;
  }

  Future<int> setUserId(String userId) async {
    CRM crm = await getCRM();
    crm.userId = userId;
    return updateClient(crm);
  }
}
