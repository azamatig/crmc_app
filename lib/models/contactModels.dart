// To parse this JSON data, do
//
//     final contacts = contactsFromJson(jsonString);

import 'dart:convert';

List<Contacts> contactsFromJson(String str) =>
    List<Contacts>.from(json.decode(str).map((x) => Contacts.fromJson(x)));

String contactsToJson(List<Contacts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contacts {
  String entityName;
  String instanceName;
  String id;
  String upperName;
  List<Address> addresses;
  List<ContactInfo> contactInfo;
  ClientStatus clientStatus;
  String partyType;
  String nationalIdentifier;
  Responsible responsible;

  Contacts({
    this.entityName,
    this.instanceName,
    this.id,
    this.upperName,
    this.addresses,
    this.contactInfo,
    this.clientStatus,
    this.partyType,
    this.nationalIdentifier,
    this.responsible,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) {
    var list = json['contactInfo'] as List;
    List<ContactInfo> dataList =
        list.map((i) => ContactInfo.fromJson(i)).toList();
    return Contacts(
      entityName: json["_entityName"],
      instanceName: json["_instanceName"],
      id: json["id"],
      upperName: json["upperName"],
      addresses:
          List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
      contactInfo: dataList,
      clientStatus: ClientStatus.fromJson(json["clientStatus"]),
      partyType: json["partyType"],
      nationalIdentifier: json["nationalIdentifier"],
      responsible: Responsible.fromJson(json["responsible"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "upperName": upperName,
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
        "contactInfo": List<dynamic>.from(contactInfo.map((x) => x.toJson())),
        "clientStatus": clientStatus.toJson(),
        "partyType": partyType,
        "nationalIdentifier": nationalIdentifier,
        "responsible": responsible.toJson(),
      };
}

class Address {
  String entityName;
  String instanceName;
  String id;
  String legacyAddress;
  String streetAddressLang1;
  String streetAddressLang2;
  String streetAddress;
  String legacyId;

  Address({
    this.entityName,
    this.instanceName,
    this.id,
    this.legacyAddress,
    this.streetAddressLang1,
    this.streetAddressLang2,
    this.streetAddress,
    this.legacyId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        legacyAddress: json["legacyAddress"],
        streetAddressLang1: json["streetAddressLang1"],
        streetAddressLang2: json["streetAddressLang2"],
        streetAddress: json["streetAddress"],
        legacyId: json["legacyID"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "legacyAddress": legacyAddress,
        "streetAddressLang1": streetAddressLang1,
        "streetAddressLang2": streetAddressLang2,
        "streetAddress": streetAddress,
        "legacyID": legacyId,
      };
}

class ClientStatus {
  String entityName;
  String id;
  String languageValue;

  ClientStatus({
    this.entityName,
    this.id,
    this.languageValue,
  });

  factory ClientStatus.fromJson(Map<String, dynamic> json) => ClientStatus(
        entityName: json["_entityName"],
        id: json["id"],
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "id": id,
        "languageValue": languageValue,
      };
}

class ContactInfo {
  String entityName;
  String instanceName;
  String id;
  bool active;
  String valueUnformatted;
  bool doNotDisturb;
  String legacyId;
  String value;
  Type type;

  ContactInfo({
    this.entityName,
    this.instanceName,
    this.id,
    this.active,
    this.valueUnformatted,
    this.doNotDisturb,
    this.legacyId,
    this.value,
    this.type,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        active: json["active"],
        valueUnformatted: json["valueUnformatted"],
        doNotDisturb: json["doNotDisturb"],
        legacyId: json["legacyID"],
        value: json["value"],
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "active": active,
        "valueUnformatted": valueUnformatted,
        "doNotDisturb": doNotDisturb,
        "legacyID": legacyId,
        "value": value,
        "type": type == null ? null : type.toJson(),
      };
}

class Type {
  String entityName;
  String instanceName;
  String id;
  String code;
  String languageValue;
  int order;
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
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: json["langValue3"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "langValue3": langValue3,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

class Responsible {
  String entityName;
  String instanceName;
  String id;
  String lastName;
  String email;
  String innerNumber;
  String updatedBy;
  String fullName;
  String firstName;
  String mobilePhone;
  String name;
  String middleName;
  String position;
  String shortName;

  Responsible({
    this.entityName,
    this.instanceName,
    this.id,
    this.lastName,
    this.email,
    this.innerNumber,
    this.updatedBy,
    this.fullName,
    this.firstName,
    this.mobilePhone,
    this.name,
    this.middleName,
    this.position,
    this.shortName,
  });

  factory Responsible.fromJson(Map<String, dynamic> json) => Responsible(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        lastName: json["lastName"],
        email: json["email"],
        innerNumber: json["innerNumber"],
        updatedBy: json["updatedBy"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        mobilePhone: json["mobilePhone"],
        name: json["name"],
        middleName: json["middleName"],
        position: json["position"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "lastName": lastName,
        "email": email,
        "innerNumber": innerNumber,
        "updatedBy": updatedBy,
        "fullName": fullName,
        "firstName": firstName,
        "mobilePhone": mobilePhone,
        "name": name,
        "middleName": middleName,
        "position": position,
        "shortName": shortName,
      };
}
