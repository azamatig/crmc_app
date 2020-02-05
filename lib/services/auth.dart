import 'package:crmc_app/data/crmDB.dart';
import 'package:crmc_app/models/dbCrmModel.dart';
import 'package:crmc_app/services/token.dart';
import 'package:oauth2/oauth2.dart';

class Auth {
  Client _client;

  Future<Client> get client async {
    if (_client != null) return _client;
    // if _client is null we instantiate it
    _client = await getFromSavedPerson();
    return _client;
  }

  authenticationRest(String login, String password) async {
    var res = await AccessToken().getAccessToken(login, password);
    if (checkIsTokenFalse(res)) {
      return res;
    }
    _client = res;
    var crm = CRM.forClient(id: 1, login: login, password: password);
    CrmDB().updateClient(crm);
    return _client;
  }

  getFromSavedPerson() async {
    var crm = await CrmDB().getCRM();
    var res = await AccessToken().getAccessToken(crm.login, crm.password);
    if (checkIsTokenFalse(res)) {
      return res;
    }
    _client = res;
    return _client;
  }

  bool checkIsTokenFalse(var res) {
    if (res is String) {
      return true;
    } else {
      return false;
    }
  }
}
