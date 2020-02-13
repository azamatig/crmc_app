import 'package:crmc_app/models/base_result.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';

class NewContactRest {
  Auth provider;

  createContactRest() {
    provider = Auth();
  }

  sendNewRequest(String upperName, String nationalIdentifier) async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    var url = restApiUrl + 'v2/entities/crm\$Party?view=party.edit';
    var body = """
   {
            "_entityName": "crm\$Party",
            "upperName": " --- ",
            "clientStatus": {
                          "_entityName": "base\$DicClientStatus",
                          "id": "eb5fc889-b79c-73da-5209-5aa1916d0d08",
                          "code": "CLIENT",
                          "languageValue": "Существующий"
                          },
            "partyType": "CONTACT",
            "responsible": {
                          "id": "33ab3f26-12ac-276d-5975-f1f104295927"
                           },
            "resident": true,
            "active": true,
            "name": "$upperName",
            "nationalIdentifier": "$nationalIdentifier"
   }
        """;
    var response = await client
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    BaseResult result = BaseResult.fromJson(response.body);
    return result;
  }
}
