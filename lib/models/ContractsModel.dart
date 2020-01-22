// To parse this JSON data, do
//
//     final deals = dealsFromJson(jsonString);

import 'dart:convert';

List<Deals> dealsFromJson(String str) =>
    List<Deals>.from(json.decode(str).map((x) => Deals.fromJson(x)));

String dealsToJson(List<Deals> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Deals {
  String entityName;
  String instanceName;
  String id;
  String number;
  String apartmentCode;
  int version;
  String name;
  String legacyId;

  Deals({
    this.entityName,
    this.instanceName,
    this.id,
    this.number,
    this.apartmentCode,
    this.version,
    this.name,
    this.legacyId,
  });

  factory Deals.fromJson(Map<String, dynamic> json) => Deals(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        number: json["number"],
        apartmentCode: json["apartmentCode"],
        version: json["version"],
        name: json["name"],
        legacyId: json["legacyID"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "number": number,
        "apartmentCode": apartmentCode,
        "version": version,
        "name": name,
        "legacyID": legacyId,
      };
}
