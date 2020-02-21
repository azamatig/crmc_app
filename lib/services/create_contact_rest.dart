import 'package:crmc_app/models/base_result.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';

class NewContactRest {
  Auth provider;

  createContactRest() {
    provider = Auth();
  }

  sendNewRequest(String upperName, String nationalIdentifier, String value,
      String placeOfBirth) async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    var url = restApiUrl + 'v2/entities/crm\$Party?view=party.edit';
    var body = """
  {
            "_entityName": "crm\$Party",
            "upperName": " ... ",
            "clientStatus": {
                 "_entityName": "base\$DicClientStatus",
                 "id": "eb5fc889-b79c-73da-5209-5aa1916d0d08",
                          },
            "partyType": "CONTACT",
            "contactInfo":[
                {
                 "_entityName": "base\$ContactInfo",
                 "active": true,
                 "type": {
                          "_entityName": "base\$DicContactInfoType",
                          "_instanceName": "Моб. телефон",
                          "id": "c16301f7-4dcf-db47-8914-0c351185881c",
                },
                "doNotDisturb": false,
                "value": $value
            }],
            "responsible":{
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
