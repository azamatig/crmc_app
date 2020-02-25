import 'package:crmc_app/models/base_result.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';

class NewContractRest {
  Auth provider;

  createContractRest() {
    provider = Auth();
  }

  createNewContract(String number, double amount, String id, String clientId,
      String now) async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    var url = restApiUrl + 'v2/entities/crm\$Contract?view=contract.edit';
    var body = """
     {
        "_entityName": "crmc\$Contract",
        "type": {
            "_entityName": "crm\$DicContractType",
            "id": "338e1a33-7aea-50cd-3721-00e854bef830"
        },
        "number": "$number",
        "paymentTerms": {
            "_entityName": "crmc\$DicPaymentTermsCrmc",
            "id": "1b738211-ef94-ebc6-8c46-ce64810903e2"
        },
        "saleDepartment": {
            "_entityName": "crmc\$DicSaleDepartment",
            "id": "7cc679e9-3dad-49e0-509d-06140b275290"
        },
        "startDate": "$now",
        "party": {
            "_entityName": "crm\$Party",
            "id": "$clientId"
        },
        "status": {
            "_entityName": "crmc\$DicContractStatus",
            "id": "1794e0dc-4e0c-bdac-22a1-62727a7431d2"
        },
        "responsible": {
            "_entityName": "base\$UserExt",
            "id": "94230c07-2712-2dfe-c586-6fef0ccb5f6b"
        },
        "currency": {
            "_entityName": "base\$DicCurrency",
            "_instanceName": "KZT",
            "id": "9c4815b4-721d-b015-3546-91aeeaed5bc7"
        },
        "amount": $amount,
        "apartment": {
            "_entityName": "crmc\$Apartment",
            "id": "$id",
            "realEstateType": {
                "_entityName": "crmc\$DicRealEstateType",
                "id": "f249e09f-92dc-dd5c-f873-6abaed389ad5"
            }
        },
        "documentPackageType": {
            "_entityName": "crmc\$DicDocumentType",
            "_instanceName": "Основной договор",
            "id": "8cd717ff-f50b-784d-4de7-7ffb7c1e0642",
            "agreementKinds": []
            
        },
            "signer": {
            "_entityName": "base\$UserExt",
            "_instanceName": "Тошматова Юлия Халилджановна [s35]",
            "id": "82dc7058-3897-d6cc-49c0-15ec753dab11",
            "group": {
                "_entityName": "sec\$Group",
                "_instanceName": "Company",
                "id": "0fa2b1a5-1d68-4d69-9fbd-dff348347f93"
            },
            "fullName": "Тошматова  Юлия  Халилджановна"
        }

    }
    """;
    var response = await client
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    BaseResult result = BaseResult.fromJson(response.body);
    return result;
  }
}
