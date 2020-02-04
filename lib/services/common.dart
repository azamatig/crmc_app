import 'package:crmc_app/data/dbData.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

List tables = ["CONTACTS", "CONTRACTS"];

Future<void> truncateDB() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var isCleaned = preferences.getBool('cleanedToday') ?? false;
  if (isCleaned) {
    return;
  }
  var day = preferences.getInt('cleanseDay') ?? 1;
  var today = int.parse(DateFormat('dd').format(DateTime.now()));
  if (today == day) {
    await clear();
    await preferences.setBool('cleanedToday', true);
  } else {
    await preferences.setBool('cleanedToday', false);
  }
}

clear() async {
  DBProvider provider = DBProvider.db;
  final db = await provider.database;
  tables.forEach((e) {
    db.delete(e);
  });
  return true;
}
