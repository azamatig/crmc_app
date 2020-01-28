// To parse this JSON data, do
//
//     final contracts = contractsFromJson(jsonString);

import 'dart:convert';

List<Contracts> contractsFromJson(String str) =>
    List<Contracts>.from(json.decode(str).map((x) => Contracts.fromJson(x)));

String contractsToJson(List<Contracts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contracts {
  String id;
  DateTime endDate;
  String mainContract;
  Type type;
  String number;
  String apartmentCode;
  bool signed;
  BuyerType buyerType;
  Party party;
  Status status;
  String amountAndCurrency;

  Contracts({
    this.id,
    this.endDate,
    this.mainContract,
    this.type,
    this.number,
    this.apartmentCode,
    this.signed,
    this.buyerType,
    this.party,
    this.status,
    this.amountAndCurrency,
  });

  factory Contracts.fromJson(Map<String, dynamic> json) => Contracts(
        id: json["id"],
        endDate: DateTime.parse(json["endDate"]),
        mainContract: json["mainContract"],
        type: Type.fromJson(json["type"]),
        number: json["number"],
        apartmentCode: json["apartmentCode"],
        signed: json["signed"],
        buyerType: BuyerType.fromJson(json["buyerType"]),
        party: Party.fromJson(json["party"]),
        status: Status.fromJson(json["status"]),
        amountAndCurrency: json["amountAndCurrency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "mainContract": mainContract,
        "type": type.toJson(),
        "number": number,
        "apartmentCode": apartmentCode,
        "signed": signed,
        "buyerType": buyerType.toJson(),
        "party": party.toJson(),
        "status": status.toJson(),
        "amountAndCurrency": amountAndCurrency,
      };
}

class BuyerType {
  String id;
  String partyType;
  String languageValue;

  BuyerType({
    this.id,
    this.partyType,
    this.languageValue,
  });

  factory BuyerType.fromJson(Map<String, dynamic> json) => BuyerType(
        id: json["id"],
        partyType: json["partyType"],
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "partyType": partyType,
        "languageValue": languageValue,
      };
}

class Party {
  String id;
  Responsible responsible;
  bool resident;
  String name;
  String nationalIdentifier;

  Party({
    this.id,
    this.responsible,
    this.resident,
    this.name,
    this.nationalIdentifier,
  });

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        id: json["id"],
        responsible: Responsible.fromJson(json["responsible"]),
        resident: json["resident"],
        name: json["name"],
        nationalIdentifier: json["nationalIdentifier"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "responsible": responsible.toJson(),
        "resident": resident,
        "name": name,
        "nationalIdentifier": nationalIdentifier,
      };
}

class Responsible {
  String instanceName;
  String id;
  String name;
  String shortName;

  Responsible({
    this.instanceName,
    this.id,
    this.name,
    this.shortName,
  });

  factory Responsible.fromJson(Map<String, dynamic> json) => Responsible(
        instanceName: json["_instanceName"],
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "_instanceName": instanceName,
        "id": id,
        "name": name,
        "shortName": shortName,
      };
}

class Status {
  String id;
  String code;
  String languageValue;

  Status({
    this.id,
    this.code,
    this.languageValue,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        code: json["code"],
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "languageValue": languageValue,
      };
}

class Type {
  String id;
  String code;
  String description1;
  String languageValue;

  Type({
    this.id,
    this.code,
    this.description1,
    this.languageValue,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        code: json["code"],
        description1: json["description1"],
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "description1": description1,
        "languageValue": languageValue,
      };
}
