// To parse this JSON data, do
//
//     final apartments = apartmentsFromJson(jsonString);

import 'dart:convert';

Apartments apartmentsFromJson(String str) =>
    Apartments.fromMap(json.decode(str));

String apartmentsToJson(Apartments data) => json.encode(data.toMap());

class Apartments {
  String entityName;
  DateTime endDate;
  PaymentTerms type;
  String number;
  String apartmentCode;
  PaymentTerms paymentTerms;
  PaymentTerms saleDepartment;
  DateTime dateCompletion;
  DateTime startDate;
  Party party;
  Status status;
  int apartmentNumber;
  String note;
  bool mortgage;
  Responsible responsible;
  Currency currency;
  int amount;
  Apartment apartment;
  DocumentPackageType documentPackageType;
  Signer signer;

  Apartments({
    this.entityName,
    this.endDate,
    this.type,
    this.number,
    this.apartmentCode,
    this.paymentTerms,
    this.saleDepartment,
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
    this.apartment,
    this.documentPackageType,
    this.signer,
  });

  factory Apartments.fromMap(Map<String, dynamic> json) => Apartments(
        entityName: json["_entityName"],
        endDate: DateTime.parse(json["endDate"]),
        type: PaymentTerms.fromMap(json["type"]),
        number: json["number"],
        apartmentCode: json["apartmentCode"],
        paymentTerms: PaymentTerms.fromMap(json["paymentTerms"]),
        saleDepartment: PaymentTerms.fromMap(json["saleDepartment"]),
        dateCompletion: DateTime.parse(json["dateCompletion"]),
        startDate: DateTime.parse(json["startDate"]),
        party: Party.fromMap(json["party"]),
        status: Status.fromMap(json["status"]),
        apartmentNumber: json["apartmentNumber"],
        note: json["note"],
        mortgage: json["mortgage"],
        responsible: Responsible.fromMap(json["responsible"]),
        currency: Currency.fromMap(json["currency"]),
        amount: json["amount"],
        apartment: Apartment.fromMap(json["apartment"]),
        documentPackageType:
            DocumentPackageType.fromMap(json["documentPackageType"]),
        signer: Signer.fromMap(json["signer"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "type": type.toMap(),
        "number": number,
        "apartmentCode": apartmentCode,
        "paymentTerms": paymentTerms.toMap(),
        "saleDepartment": saleDepartment.toMap(),
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
        "apartment": apartment.toMap(),
        "documentPackageType": documentPackageType.toMap(),
        "signer": signer.toMap(),
      };
}

class Apartment {
  String entityName;
  String id;
  int rooms;
  String code;
  ComplexBlockSection complexBlockSection;
  int livingArea;
  int number;
  int price;
  RealEstateType realEstateType;
  int floor;
  String factFloor;
  double area;

  Apartment({
    this.entityName,
    this.id,
    this.rooms,
    this.code,
    this.complexBlockSection,
    this.livingArea,
    this.number,
    this.price,
    this.realEstateType,
    this.floor,
    this.factFloor,
    this.area,
  });

  factory Apartment.fromMap(Map<String, dynamic> json) => Apartment(
        entityName: json["_entityName"],
        id: json["id"],
        rooms: json["rooms"],
        code: json["code"],
        complexBlockSection:
            ComplexBlockSection.fromMap(json["complexBlockSection"]),
        livingArea: json["livingArea"],
        number: json["number"],
        price: json["price"],
        realEstateType: RealEstateType.fromMap(json["realEstateType"]),
        floor: json["floor"],
        factFloor: json["factFloor"],
        area: json["area"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "rooms": rooms,
        "code": code,
        "complexBlockSection": complexBlockSection.toMap(),
        "livingArea": livingArea,
        "number": number,
        "price": price,
        "realEstateType": realEstateType.toMap(),
        "floor": floor,
        "factFloor": factFloor,
        "area": area,
      };
}

class ComplexBlockSection {
  String entityName;
  String id;
  ComplexBlock complexBlock;
  int order;

  ComplexBlockSection({
    this.entityName,
    this.id,
    this.complexBlock,
    this.order,
  });

  factory ComplexBlockSection.fromMap(Map<String, dynamic> json) =>
      ComplexBlockSection(
        entityName: json["_entityName"],
        id: json["id"],
        complexBlock: ComplexBlock.fromMap(json["complexBlock"]),
        order: json["order"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "complexBlock": complexBlock.toMap(),
        "order": order,
      };
}

class ComplexBlock {
  String entityName;
  String id;
  Group complex;
  String name;

  ComplexBlock({
    this.entityName,
    this.id,
    this.complex,
    this.name,
  });

  factory ComplexBlock.fromMap(Map<String, dynamic> json) => ComplexBlock(
        entityName: json["_entityName"],
        id: json["id"],
        complex: Group.fromMap(json["complex"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "complex": complex.toMap(),
        "name": name,
      };
}

class Group {
  String entityName;
  String id;
  String name;

  Group({
    this.entityName,
    this.id,
    this.name,
  });

  factory Group.fromMap(Map<String, dynamic> json) => Group(
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

class RealEstateType {
  String entityName;
  String id;
  String languageValue;

  RealEstateType({
    this.entityName,
    this.id,
    this.languageValue,
  });

  factory RealEstateType.fromMap(Map<String, dynamic> json) => RealEstateType(
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
  String langValue1;

  Currency({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.langValue1,
  });

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "langValue1": langValue1,
      };
}

class DocumentPackageType {
  String entityName;
  String id;
  String code;
  List<dynamic> agreementKinds;
  String languageValue;
  String category;

  DocumentPackageType({
    this.entityName,
    this.id,
    this.code,
    this.agreementKinds,
    this.languageValue,
    this.category,
  });

  factory DocumentPackageType.fromMap(Map<String, dynamic> json) =>
      DocumentPackageType(
        entityName: json["_entityName"],
        id: json["id"],
        code: json["code"],
        agreementKinds:
            List<dynamic>.from(json["agreementKinds"].map((x) => x)),
        languageValue: json["languageValue"],
        category: json["category"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "code": code,
        "agreementKinds": List<dynamic>.from(agreementKinds.map((x) => x)),
        "languageValue": languageValue,
        "category": category,
      };
}

class Party {
  String entityName;
  String id;
  String name;
  String nationalIdentifier;

  Party({
    this.entityName,
    this.id,
    this.name,
    this.nationalIdentifier,
  });

  factory Party.fromMap(Map<String, dynamic> json) => Party(
        entityName: json["_entityName"],
        id: json["id"],
        name: json["name"],
        nationalIdentifier: json["nationalIdentifier"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "name": name,
        "nationalIdentifier": nationalIdentifier,
      };
}

class PaymentTerms {
  String entityName;
  String id;

  PaymentTerms({
    this.entityName,
    this.id,
  });

  factory PaymentTerms.fromMap(Map<String, dynamic> json) => PaymentTerms(
        entityName: json["_entityName"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
      };
}

class Responsible {
  String entityName;
  String id;
  String fullName;
  String shortName;

  Responsible({
    this.entityName,
    this.id,
    this.fullName,
    this.shortName,
  });

  factory Responsible.fromMap(Map<String, dynamic> json) => Responsible(
        entityName: json["_entityName"],
        id: json["id"],
        fullName: json["fullName"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "fullName": fullName,
        "shortName": shortName,
      };
}

class Signer {
  String entityName;
  String id;
  Group group;
  String fullName;
  String shortName;

  Signer({
    this.entityName,
    this.id,
    this.group,
    this.fullName,
    this.shortName,
  });

  factory Signer.fromMap(Map<String, dynamic> json) => Signer(
        entityName: json["_entityName"],
        id: json["id"],
        group: Group.fromMap(json["group"]),
        fullName: json["fullName"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "group": group.toMap(),
        "fullName": fullName,
        "shortName": shortName,
      };
}

class Status {
  String entityName;
  String instanceName;
  String id;
  String languageValue;

  Status({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
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
