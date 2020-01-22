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
  int version;
  String upperFirstName;
  String firstName;
  String upperLastName;
  String legacyId;

  Contacts({
    this.entityName,
    this.instanceName,
    this.id,
    this.lastName,
    this.version,
    this.upperFirstName,
    this.firstName,
    this.upperLastName,
    this.legacyId,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        lastName: json["lastName"],
        version: json["version"],
        upperFirstName: json["upperFirstName"],
        firstName: json["firstName"],
        upperLastName: json["upperLastName"],
        legacyId: json["legacyID"],
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "lastName": lastName,
        "version": version,
        "upperFirstName": upperFirstName,
        "firstName": firstName,
        "upperLastName": upperLastName,
        "legacyID": legacyId,
      };
}
