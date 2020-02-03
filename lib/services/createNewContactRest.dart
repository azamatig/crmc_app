import 'package:crmc_app/models/PartyModel.dart';
import 'package:crmc_app/models/baseResult.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';

class NewContactRest {
  Auth provider;

  createContactRest() {
    provider = Auth();
  }

  sendNewRequest(PartyEntity newContact) async {
    final client = await provider.client;
    var url = restApiUrl + 'v2/entities/crm\$Party?view=party.edit';
    var body = """
  {
        "_entityName": "crm\$Party",
        "addresses": [],
        "upperName": "",
        "contactInfo": [],
        "clientStatus": {
              "_entityName": "base\$DicClientStatus",
              "id": "eb5fc889-b79c-73da-5209-5aa1916d0d08",
              "code": "CLIENT",
              "languageValue": "Существующий",
      },
        "partyType": "CONTACT",
        "responsible": {
              "_entityName": "base\$UserExt",
              "id": "33ab3f26-12ac-276d-5975-f1f104295927",
              "language": "ru",
              "email": "a.bedareva@bazis.kz",
              "shortName": "Алёна  Бедарева"
      },
        "contact": {
              "_entityName": "crmc\$Contact",
              "lastName": "Штестов ",
              "birthPlace": "",
              "residentCountry": {
                    "_entityName": "base\$DicCountry",
                    "id": "fa84d3b8-1951-7750-6314-3a57a1b81106",
                    "languageValue": "Казахстан",
      },
        "currency": {
               "_entityName": "base\$DicCurrency",
               "_instanceName": "KZT",
               "id": "9c4815b4-721d-b015-3546-91aeeaed5bc7",
               "code": "KZT",
               "langValue1": "KZT"
      },
        "resident": true,
        "upperMiddleName": "",
        "sex": {
               "_entityName": "base\$DicSex",
               "id": "f727e8cb-b978-7991-fb35-7df570e66beb",
               "code": "MALE"
      },
        "dateOfBirth": "1984-05-31",
        "version": 1,
        "upperFirstName": "",
        "firstName": "Павел ",
        "bazisClubCards": [],
        "upperLastName": "",
        "middleName": "Сергеевич",
      },
        "resident": true,
        "contactIdentityDocuments": [],
        "active": true,
        "name": "${newContact.name}",
        "nationalIdentifier": "${newContact.nationalIdentifier}",
  }
        """;
    var response = await client
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    BaseResult result = BaseResult.fromJson(response.body);
    return result;
  }
}
