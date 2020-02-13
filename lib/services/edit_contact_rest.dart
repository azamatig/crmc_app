import 'package:crmc_app/models/base_result.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';

class EditContactRest {
  final String id;
  Auth provider;

  EditContactRest(this.id);

  editContactRest() {
    provider = Auth();
  }

  editContact(String nationalIdentifier) async {
    Auth provider;
    provider = Auth();
    var myId = id;
    final client = await provider.client;
    var url = restApiUrl + 'v2/entities/crm\$Party/$myId?view=party.edit';
    var body = """
    {
    "_entityName": "crm\$Party",
    "upperName": "",
    "partyType": "CONTACT",
    "nationalIdentifier": $nationalIdentifier,
    "resident": true,
    "active": true
}
        """;
    var response = await client
        .put(url, body: body, headers: {'Content-Type': 'application/json'});
    BaseResult result = BaseResult.fromJson(response.body);
    return result;
  }
}
