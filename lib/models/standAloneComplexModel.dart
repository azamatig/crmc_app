// To parse this JSON data, do
//
//     final complexModel = complexModelFromJson(jsonString);

import 'dart:convert';

List<ComplexModel> complexModelFromJson(String str) => List<ComplexModel>.from(
    json.decode(str).map((x) => ComplexModel.fromMap(x)));

String complexModelToJson(List<ComplexModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ComplexModel {
  String entityName;
  String instanceName;
  String id;
  String code;
  String streetAddress;
  String name;
  Address address;
  List<Block> blocks;

  bool isExpanded = false;

  ComplexModel({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.streetAddress,
    this.name,
    this.address,
    this.blocks,
  });

  factory ComplexModel.fromMap(Map<String, dynamic> json) => ComplexModel(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        streetAddress: json["streetAddress"],
        name: json["name"],
        address: Address.fromMap(json["address"]),
        blocks: List<Block>.from(json["blocks"].map((x) => Block.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "streetAddress": streetAddress,
        "name": name,
        "address": address.toMap(),
        "blocks": List<dynamic>.from(blocks.map((x) => x.toMap())),
      };
}

class Address {
  String entityName;
  String instanceName;
  String id;

  Address({
    this.entityName,
    this.instanceName,
    this.id,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
      };
}

class Block {
  String entityName;
  String instanceName;
  String id;
  String code;
  String cadastralNumber;
  DateTime endDate;
  String houseNumber;
  Status status;

  Block({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.cadastralNumber,
    this.endDate,
    this.houseNumber,
    this.status,
  });

  factory Block.fromMap(Map<String, dynamic> json) => Block(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        cadastralNumber: json["cadastralNumber"],
        endDate: DateTime.parse(json["endDate"]),
        houseNumber: json["houseNumber"],
        status: Status.fromMap(json["status"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "cadastralNumber": cadastralNumber,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "houseNumber": houseNumber,
        "status": status.toMap(),
      };
}

class Status {
  String entityName;
  String instanceName;
  String id;
  String languageValue;
  bool isSystemRecord;
  bool active;
  String langValue2;
  String langValue1;
  List<Section> sections;

  Status({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.isSystemRecord,
    this.active,
    this.langValue2,
    this.langValue1,
    this.sections,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
        sections:
            List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
        "sections": List<dynamic>.from(sections.map((x) => x.toMap())),
      };
}

class Section {
  String entityName;
  String instanceName;
  String id;
  List<dynamic> images;
  String name;
  int maxApartments;
  String legacyId;
  List<Apartment> apartments;

  Section({
    this.entityName,
    this.instanceName,
    this.id,
    this.images,
    this.name,
    this.maxApartments,
    this.legacyId,
    this.apartments,
  });

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        name: json["name"],
        maxApartments: json["maxApartments"],
        legacyId: json["legacyID"],
        apartments: List<Apartment>.from(
            json["apartments"].map((x) => Apartment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "name": name,
        "maxApartments": maxApartments,
        "legacyID": legacyId,
        "apartments": List<dynamic>.from(apartments.map((x) => x.toMap())),
      };
}

class Apartment {
  String entityName;
  String instanceName;
  String id;
  int rooms;
  String code;
  int totalPrice;
  int number;

  Apartment({
    this.entityName,
    this.instanceName,
    this.id,
    this.rooms,
    this.code,
    this.totalPrice,
    this.number,
  });

  factory Apartment.fromMap(Map<String, dynamic> json) => Apartment(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        rooms: json["rooms"],
        code: json["code"],
        totalPrice: json["totalPrice"],
        number: json["number"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "rooms": rooms,
        "code": code,
        "totalPrice": totalPrice,
        "number": number,
      };
}
