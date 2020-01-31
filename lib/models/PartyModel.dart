// To parse this JSON data, do
//
//     final partyEntity = partyEntityFromJson(jsonString);

import 'dart:convert';

List<PartyEntity> partyEntityFromJson(String str) => List<PartyEntity>.from(
    json.decode(str).map((x) => PartyEntity.fromJson(x)));

String partyEntityToJson(List<PartyEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PartyEntity {
  String id;
  ClientStatus clientStatus;
  String partyType;
  Responsible responsible;
  bool resident;
  bool active;
  String name;
  String nationalIdentifier;

  PartyEntity({
    this.id,
    this.clientStatus,
    this.partyType,
    this.responsible,
    this.resident,
    this.active,
    this.name,
    this.nationalIdentifier,
  });

  factory PartyEntity.fromJson(Map<String, dynamic> json) => PartyEntity(
        id: json["id"],
        clientStatus: ClientStatus.fromJson(json["clientStatus"]),
        partyType: json["partyType"],
        responsible: Responsible.fromJson(json["responsible"]),
        resident: json["resident"],
        active: json["active"],
        name: json["name"],
        nationalIdentifier: json["nationalIdentifier"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientStatus": clientStatus.toJson(),
        "partyType": partyType,
        "responsible": responsible.toJson(),
        "resident": resident,
        "active": active,
        "name": name,
        "nationalIdentifier": nationalIdentifier,
      };
}

class ClientStatus {
  String id;
  String languageValue;

  ClientStatus({
    this.id,
    this.languageValue,
  });

  factory ClientStatus.fromJson(Map<String, dynamic> json) => ClientStatus(
        id: json["id"],
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "languageValue": languageValue,
      };
}

class Responsible {
  String id;
  String fullName;
  String shortName;

  Responsible({
    this.id,
    this.fullName,
    this.shortName,
  });

  factory Responsible.fromJson(Map<String, dynamic> json) => Responsible(
        id: json["id"],
        fullName: json["fullName"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "shortName": shortName,
      };
}
