// To parse this JSON data, do
//
//     final complexModel = complexModelFromJson(jsonString);

import 'dart:convert';

List<ComplexModel> complexModelFromJson(String str) => List<ComplexModel>.from(
    json.decode(str).map((x) => ComplexModel.fromJson(x)));

String complexModelToJson(List<ComplexModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComplexModel {
  String entityName;
  String instanceName;
  String id;
  String code;
  String streetAddress;
  String name;
  Address address;
  List<Block> blocks;

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

  factory ComplexModel.fromJson(Map<String, dynamic> json) => ComplexModel(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        streetAddress: json["streetAddress"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        blocks: List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "streetAddress": streetAddress,
        "name": name,
        "address": address.toJson(),
        "blocks": List<dynamic>.from(blocks.map((x) => x.toJson())),
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
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
  String languageValue;
  bool isSystemRecord;
  bool active;
  String langValue2;
  String langValue1;
  List<Section> sections;

  Block({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.cadastralNumber,
    this.endDate,
    this.houseNumber,
    this.languageValue,
    this.isSystemRecord,
    this.active,
    this.langValue2,
    this.langValue1,
    this.sections,
  });

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        cadastralNumber: json["cadastralNumber"],
        endDate: DateTime.parse(json["endDate"]),
        houseNumber: json["houseNumber"],
        languageValue: json["languageValue"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "cadastralNumber": cadastralNumber,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "houseNumber": houseNumber,
        "languageValue": languageValue,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

class Section {
  String name;
  List<Apartment> apartments;

  Section({
    this.name,
    this.apartments,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        name: json["name"],
        apartments: List<Apartment>.from(
            json["apartments"].map((x) => Apartment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "apartments": List<dynamic>.from(apartments.map((x) => x.toJson())),
      };
}

class Apartment {
  String code;

  Apartment({
    this.code,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
