import 'package:crmc_app/models/base_result.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';

class NewContractRest {
  Auth provider;

  createContractRest() {
    provider = Auth();
  }

  createNewContract(String number, double amount) async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    var url = restApiUrl + 'v2/entities/crm\Contract?view=contract.edit';
    var body = """
    {
        "_entityName": "crmc\$Contract",
        "endDate": "2020-03-31",
        "type": {
            "_entityName": "crm\$DicContractType",
            "id": "338e1a33-7aea-50cd-3721-00e854bef830"
        },
        "number": $number,
        "apartmentCode": "1А",
        "paymentTerms": {
            "_entityName": "crmc\$DicPaymentTermsCrmc",
            "id": "1b738211-ef94-ebc6-8c46-ce64810903e2"
        },
        "saleDepartment": {
            "_entityName": "crmc\$DicSaleDepartment",
            "id": "7cc679e9-3dad-49e0-509d-06140b275290"
        },

        "dateCompletion": "2020-03-31",
        "startDate": "2019-01-21",
        "party": {
            "_entityName": "crm\$Party",
            "id": "1d7d507b-221d-6542-e95a-f8da7f0cd622",
            "name": "Егеубаева Несибгуль Тогайбаевна",
            "nationalIdentifier": "580125401816"
        },
        "status": {
            "_entityName": "crmc\$DicContractStatus",
            "_instanceName": "Действующий",
            "id": "1794e0dc-4e0c-bdac-22a1-62727a7431d2",
            "languageValue": "Действующий"
        },
        "apartmentNumber": 44,
        "note": "",
        "mortgage": false,
        "responsible": {
            "_entityName": "base\$UserExt",
            "id": "94230c07-2712-2dfe-c586-6fef0ccb5f6b",
            "fullName": "Авкешова  Асель  Бакытовна",
            "shortName": "Асель  Авкешова"
        },
        "currency": {
            "_entityName": "base\$DicCurrency",
            "_instanceName": "KZT",
            "id": "9c4815b4-721d-b015-3546-91aeeaed5bc7",
            "code": "KZT",
            "langValue1": "KZT"
        },
        "amount": $amount,
        "apartment": {
            "_entityName": "crmc\$Apartment",
            "id": "af4e46a2-58dc-ec28-2041-7351ed5e8e39",
            "rooms": 1,
            "code": "1А",
            "complexBlockSection": {
                "_entityName": "crmc\$ComplexBlockSection",
                "id": "aed46e84-6bb3-1a8a-7139-4569d0f7e02a",
                "complexBlock": {
                    "_entityName": "crmc\$ComplexBlock",
                    "id": "d881ab27-0717-78aa-311f-de0fad384c7f",
                    "complex": {
                        "_entityName": "crmc\$Complex",
                        "id": "af7a0578-d87b-c50e-057d-51fc335f704b",
                        "name": "Вишневый сад"
                    },
                    "name": "Пятно 4"
                },
                "order": 1
            },
            "livingArea": 0.0,
            "number": 44,
            "price": 0.0,
            "realEstateType": {
                "_entityName": "crmc\$DicRealEstateType",
                "id": "f249e09f-92dc-dd5c-f873-6abaed389ad5",
                "languageValue": "Квартира"
            },
            "floor": 8,
            "factFloor": "8",
            "area": 39.2
        },
        "documentPackageType": {
            "_entityName": "crmc\$DicDocumentType",
            "id": "8cd717ff-f50b-784d-4de7-7ffb7c1e0642",
            "code": "MAIN_CONTRACT",
            "agreementKinds": [],
            "languageValue": "Основной договор",
            "category": "CONTRACT"
        },
        "signer": {
            "_entityName": "base\$UserExt",
            "id": "82dc7058-3897-d6cc-49c0-15ec753dab11",
            "group": {
                "_entityName": "sec\$Group",
                "id": "0fa2b1a5-1d68-4d69-9fbd-dff348347f93",
                "name": "Company"
            },
            "fullName": "Тошматова  Юлия  Халилджановна",
            "shortName": "Юлия  Тошматова"
        }
    }
    """;
    var response = await client
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    BaseResult result = BaseResult.fromJson(response.body);
    return result;
  }
}
