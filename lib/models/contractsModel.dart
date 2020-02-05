// To parse this JSON data, do
//
//     final contracts = contractsFromJson(jsonString);

import 'dart:convert';

List<Contracts> contractsFromJson(String str) =>
    List<Contracts>.from(json.decode(str).map((x) => Contracts.fromMap(x)));

String contractsToJson(List<Contracts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Contracts {
  String entityName;
  String id;
  DateTime endDate;
  Type type;
  String number;
  String apartmentCode;
  PaymentTerms paymentTerms;
  bool registrationInMio;
  bool signed;
  SaleDepartment saleDepartment;
  String legacyId;
  DateTime dateCompletion;
  DateTime startDate;
  Party party;
  Status status;
  int apartmentNumber;
  String note;
  bool mortgage;
  Responsible responsible;
  Currency currency;
  double amount;
  double contractPrice;
  Apartment apartment;

  Contracts({
    this.entityName,
    this.id,
    this.endDate,
    this.type,
    this.number,
    this.apartmentCode,
    this.paymentTerms,
    this.registrationInMio,
    this.signed,
    this.saleDepartment,
    this.legacyId,
    this.dateCompletion,
    this.startDate,
    this.party,
    this.status,
    this.apartmentNumber,
    this.note,
    this.mortgage,
    this.responsible,
    this.currency,
    this.amount,
    this.contractPrice,
    this.apartment,
  });

  factory Contracts.fromMap(Map<String, dynamic> json) => Contracts(
        entityName: json["_entityName"],
        id: json["id"],
        endDate: DateTime.parse(json["endDate"]),
        type: Type.fromMap(json["type"]),
        number: json["number"],
        apartmentCode: json["apartmentCode"],
        paymentTerms: PaymentTerms.fromMap(json["paymentTerms"]),
        registrationInMio: json["registrationInMIO"],
        signed: json["signed"],
        saleDepartment: SaleDepartment.fromMap(json["saleDepartment"]),
        legacyId: json["legacyID"],
        dateCompletion: DateTime.parse(json["dateCompletion"]),
        startDate: DateTime.parse(json["startDate"]),
        party: Party.fromMap(json["party"]),
        status: Status.fromMap(json["status"]),
        apartmentNumber: json["apartmentNumber"],
        note: json["note"],
        mortgage: json["mortgage"],
        responsible: Responsible.fromMap(json["responsible"]),
        currency: Currency.fromMap(json["currency"]),
        amount: json["amount"].toDouble(),
        contractPrice: json["contractPrice"].toDouble(),
        apartment: Apartment.fromMap(json["apartment"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "type": type.toMap(),
        "number": number,
        "apartmentCode": apartmentCode,
        "paymentTerms": paymentTerms.toMap(),
        "registrationInMIO": registrationInMio,
        "signed": signed,
        "saleDepartment": saleDepartment.toMap(),
        "legacyID": legacyId,
        "dateCompletion":
            "${dateCompletion.year.toString().padLeft(4, '0')}-${dateCompletion.month.toString().padLeft(2, '0')}-${dateCompletion.day.toString().padLeft(2, '0')}",
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "party": party.toMap(),
        "status": status.toMap(),
        "apartmentNumber": apartmentNumber,
        "note": note,
        "mortgage": mortgage,
        "responsible": responsible.toMap(),
        "currency": currency.toMap(),
        "amount": amount,
        "contractPrice": contractPrice,
        "apartment": apartment.toMap(),
      };
}

class Apartment {
  String entityName;
  String instanceName;
  String id;
  String code;
  String description;
  ComplexBlockSection complexBlockSection;
  Status realEstateType;
  String factFloor;

  Apartment({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.description,
    this.complexBlockSection,
    this.realEstateType,
    this.factFloor,
  });

  factory Apartment.fromMap(Map<String, dynamic> json) => Apartment(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        description: json["description"],
        complexBlockSection:
            ComplexBlockSection.fromMap(json["complexBlockSection"]),
        realEstateType: Status.fromMap(json["realEstateType"]),
        factFloor: json["factFloor"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "description": description,
        "complexBlockSection": complexBlockSection.toMap(),
        "realEstateType": realEstateType.toMap(),
        "factFloor": factFloor,
      };
}

class ComplexBlockSection {
  String entityName;
  String instanceName;
  String id;
  ComplexBlock complexBlock;
  int order;

  ComplexBlockSection({
    this.entityName,
    this.instanceName,
    this.id,
    this.complexBlock,
    this.order,
  });

  factory ComplexBlockSection.fromMap(Map<String, dynamic> json) =>
      ComplexBlockSection(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        complexBlock: ComplexBlock.fromMap(json["complexBlock"]),
        order: json["order"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "complexBlock": complexBlock.toMap(),
        "order": order,
      };
}

class ComplexBlock {
  String entityName;
  String instanceName;
  String id;
  Complex complex;
  String name;

  ComplexBlock({
    this.entityName,
    this.instanceName,
    this.id,
    this.complex,
    this.name,
  });

  factory ComplexBlock.fromMap(Map<String, dynamic> json) => ComplexBlock(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        complex: Complex.fromMap(json["complex"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "complex": complex.toMap(),
        "name": name,
      };
}

class Complex {
  String entityName;
  String id;
  String name;

  Complex({
    this.entityName,
    this.id,
    this.name,
  });

  factory Complex.fromMap(Map<String, dynamic> json) => Complex(
        entityName: json["_entityName"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "name": name,
      };
}

class Status {
  String entityName;
  String id;
  String languageValue;

  Status({
    this.entityName,
    this.id,
    this.languageValue,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        entityName: json["_entityName"],
        id: json["id"],
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "languageValue": languageValue,
      };
}

class Currency {
  String entityName;
  String instanceName;
  String id;
  String code;
  String description2;
  String description3;
  String description1;
  String languageValue;
  bool isSystemRecord;
  String langValue3;
  bool active;
  String langValue2;
  String langValue1;

  Currency({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.description2,
    this.description3,
    this.description1,
    this.languageValue,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        description2: json["description2"],
        description3: json["description3"],
        description1: json["description1"],
        languageValue: json["languageValue"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: json["langValue3"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "description2": description2,
        "description3": description3,
        "description1": description1,
        "languageValue": languageValue,
        "isSystemRecord": isSystemRecord,
        "langValue3": langValue3,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

class Party {
  String entityName;
  String instanceName;
  String id;
  String name;
  String nationalIdentifier;

  Party({
    this.entityName,
    this.instanceName,
    this.id,
    this.name,
    this.nationalIdentifier,
  });

  factory Party.fromMap(Map<String, dynamic> json) => Party(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        name: json["name"],
        nationalIdentifier: json["nationalIdentifier"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "name": name,
        "nationalIdentifier": nationalIdentifier,
      };
}

class PaymentTerms {
  String entityName;
  String id;
  String languageValue;
  bool active;
  String langValue1;

  PaymentTerms({
    this.entityName,
    this.id,
    this.languageValue,
    this.active,
    this.langValue1,
  });

  factory PaymentTerms.fromMap(Map<String, dynamic> json) => PaymentTerms(
        entityName: json["_entityName"],
        id: json["id"],
        languageValue: json["languageValue"],
        active: json["active"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "languageValue": languageValue,
        "active": active,
        "langValue1": langValue1,
      };
}

class Responsible {
  String entityName;
  String instanceName;
  String id;
  String lastName;
  String fullName;
  String firstName;
  String name;
  String middleName;
  String shortName;

  Responsible({
    this.entityName,
    this.instanceName,
    this.id,
    this.lastName,
    this.fullName,
    this.firstName,
    this.name,
    this.middleName,
    this.shortName,
  });

  factory Responsible.fromMap(Map<String, dynamic> json) => Responsible(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        name: json["name"],
        middleName: json["middleName"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "lastName": lastName,
        "fullName": fullName,
        "firstName": firstName,
        "name": name,
        "middleName": middleName,
        "shortName": shortName,
      };
}

class SaleDepartment {
  String entityName;
  String instanceName;
  String id;
  String languageValue;

  SaleDepartment({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
  });

  factory SaleDepartment.fromMap(Map<String, dynamic> json) => SaleDepartment(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
      };
}

class Type {
  String entityName;
  String instanceName;
  String id;
  String code;
  String description1;
  String languageValue;
  bool isSystemRecord;
  String langValue3;
  bool active;
  String langValue2;
  String langValue1;

  Type({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.description1,
    this.languageValue,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        description1: json["description1"],
        languageValue: json["languageValue"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: json["langValue3"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "description1": description1,
        "languageValue": languageValue,
        "isSystemRecord": isSystemRecord,
        "langValue3": langValue3,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}
