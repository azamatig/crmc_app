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
  String lastName;
  dynamic annualIncome;
  dynamic educationType;
  dynamic experience;
  dynamic birthPlace;
  dynamic activityKind;
  dynamic segment;
  Currency currency;
  dynamic resident;
  dynamic upperMiddleName;
  dynamic nickName;
  dynamic sex;
  dynamic dateOfBirth;
  dynamic childCount;
  String upperFirstName;
  String firstName;
  List<dynamic> bazisClubCards;
  dynamic nationality;
  String upperLastName;
  String legacyId;
  dynamic campaign;
  dynamic middleName;
  dynamic nationalIdentifier;
  dynamic party;
  dynamic maritalStatus;

  Contacts({
    this.entityName,
    this.instanceName,
    this.id,
    this.lastName,
    this.annualIncome,
    this.educationType,
    this.experience,
    this.birthPlace,
    this.activityKind,
    this.segment,
    this.currency,
    this.resident,
    this.upperMiddleName,
    this.nickName,
    this.sex,
    this.dateOfBirth,
    this.childCount,
    this.upperFirstName,
    this.firstName,
    this.bazisClubCards,
    this.nationality,
    this.upperLastName,
    this.legacyId,
    this.campaign,
    this.middleName,
    this.nationalIdentifier,
    this.party,
    this.maritalStatus,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        lastName: json["lastName"],
        annualIncome: json["annualIncome"],
        educationType: json["educationType"],
        experience: json["experience"],
        birthPlace: json["birthPlace"],
        activityKind: json["activityKind"],
        segment: json["segment"],
        currency: Currency.fromJson(json["currency"]),
        resident: json["resident"],
        upperMiddleName: json["upperMiddleName"],
        nickName: json["nickName"],
        sex: json["sex"],
        dateOfBirth: json["dateOfBirth"],
        childCount: json["childCount"],
        upperFirstName: json["upperFirstName"],
        firstName: json["firstName"],
        bazisClubCards:
            List<dynamic>.from(json["bazisClubCards"].map((x) => x)),
        nationality: json["nationality"],
        upperLastName: json["upperLastName"],
        legacyId: json["legacyID"],
        campaign: json["campaign"],
        middleName: json["middleName"],
        nationalIdentifier: json["nationalIdentifier"],
        party: json["party"],
        maritalStatus: json["maritalStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "lastName": lastName,
        "annualIncome": annualIncome,
        "educationType": educationType,
        "experience": experience,
        "birthPlace": birthPlace,
        "activityKind": activityKind,
        "segment": segment,
        "currency": currency.toJson(),
        "resident": resident,
        "upperMiddleName": upperMiddleName,
        "nickName": nickName,
        "sex": sex,
        "dateOfBirth": dateOfBirth,
        "childCount": childCount,
        "upperFirstName": upperFirstName,
        "firstName": firstName,
        "bazisClubCards": List<dynamic>.from(bazisClubCards.map((x) => x)),
        "nationality": nationality,
        "upperLastName": upperLastName,
        "legacyID": legacyId,
        "campaign": campaign,
        "middleName": middleName,
        "nationalIdentifier": nationalIdentifier,
        "party": party,
        "maritalStatus": maritalStatus,
      };
}

class Currency {
  String entityName;
  String instanceName;
  String id;
  dynamic description4;
  dynamic description5;
  String code;
  dynamic endDate;
  String description2;
  String description3;
  String description1;
  String languageValue;
  int order;
  bool isSystemRecord;
  dynamic langValue5;
  dynamic langValue4;
  String langValue3;
  bool active;
  String langValue2;
  dynamic legacyId;
  String langValue1;
  dynamic startDate;

  Currency({
    this.entityName,
    this.instanceName,
    this.id,
    this.description4,
    this.description5,
    this.code,
    this.endDate,
    this.description2,
    this.description3,
    this.description1,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.langValue5,
    this.langValue4,
    this.langValue3,
    this.active,
    this.langValue2,
    this.legacyId,
    this.langValue1,
    this.startDate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        description4: json["description4"],
        description5: json["description5"],
        code: json["code"],
        endDate: json["endDate"],
        description2: json["description2"],
        description3: json["description3"],
        description1: json["description1"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        langValue5: json["langValue5"],
        langValue4: json["langValue4"],
        langValue3: json["langValue3"],
        active: json["active"],
        langValue2: json["langValue2"],
        legacyId: json["legacyID"],
        langValue1: json["langValue1"],
        startDate: json["startDate"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "description4": description4,
        "description5": description5,
        "code": code,
        "endDate": endDate,
        "description2": description2,
        "description3": description3,
        "description1": description1,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "langValue5": langValue5,
        "langValue4": langValue4,
        "langValue3": langValue3,
        "active": active,
        "langValue2": langValue2,
        "legacyID": legacyId,
        "langValue1": langValue1,
        "startDate": startDate,
      };
}
