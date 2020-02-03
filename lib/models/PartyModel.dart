// To parse this JSON data, do
//
//     final partyEntity = partyEntityFromJson(jsonString);

import 'dart:convert';

List<PartyEntity> partyEntityFromJson(String str) =>
    List<PartyEntity>.from(json.decode(str).map((x) => PartyEntity.fromMap(x)));

String partyEntityToJson(List<PartyEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PartyEntity {
  String entityName;
  String instanceName;
  String id;
  ClientStatus clientStatus;
  String partyType;
  Responsible responsible;
  bool resident;
  bool active;
  String name;
  String nationalIdentifier;

  PartyEntity({
    this.entityName,
    this.instanceName,
    this.id,
    this.clientStatus,
    this.partyType,
    this.responsible,
    this.resident,
    this.active,
    this.name,
    this.nationalIdentifier,
  });

  factory PartyEntity.fromMap(Map<String, dynamic> json) => PartyEntity(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        clientStatus: ClientStatus.fromMap(json["clientStatus"]),
        partyType: json["partyType"],
        responsible: Responsible.fromMap(json["responsible"]),
        resident: json["resident"],
        active: json["active"],
        name: json["name"],
        nationalIdentifier: json["nationalIdentifier"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "clientStatus": clientStatus.toMap(),
        "partyType": partyType,
        "responsible": responsible.toMap(),
        "resident": resident,
        "active": active,
        "name": name,
        "nationalIdentifier": nationalIdentifier,
      };
}

class ClientStatus {
  String entityName;
  String instanceName;
  String id;
  String languageValue;

  ClientStatus({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
  });

  factory ClientStatus.fromMap(Map<String, dynamic> json) => ClientStatus(
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

class Responsible {
  String entityName;
  String instanceName;
  String id;
  String lastName;
  String login;
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
    this.login,
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
        login: json["login"],
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
        "login": login,
        "fullName": fullName,
        "firstName": firstName,
        "name": name,
        "middleName": middleName,
        "shortName": shortName,
      };
}
