// To parse this JSON data, do
//
//     final complexModel = complexModelFromJson(jsonString);

import 'dart:convert';

class ComplexModel {
  String entityName;
  String instanceName;
  String id;
  String code;
  String name;
  List<Block> blocks;

  ComplexModel({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.name,
    this.blocks,
  });

  factory ComplexModel.fromJson(String str) =>
      ComplexModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComplexModel.fromMap(Map<String, dynamic> json) => ComplexModel(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        name: json["name"],
        blocks: List<Block>.from(json["blocks"].map((x) => Block.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "name": name,
        "blocks": List<dynamic>.from(blocks.map((x) => x.toMap())),
      };
}

class Block {
  String code;
  List<Section> sections;

  Block({
    this.code,
    this.sections,
  });

  factory Block.fromJson(String str) => Block.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Block.fromMap(Map<String, dynamic> json) => Block(
        code: json["code"],
        sections:
            List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "sections": List<dynamic>.from(sections.map((x) => x.toMap())),
      };
}

class Section {
  String entityName;
  String name;
  List<Apartment> apartments;

  Section({
    this.entityName,
    this.name,
    this.apartments,
  });

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        entityName: json["_entityName"],
        name: json["name"],
        apartments: List<Apartment>.from(
            json["apartments"].map((x) => Apartment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "name": name,
        "apartments": List<dynamic>.from(apartments.map((x) => x.toMap())),
      };
}

class Apartment {
  String entityName;
  String code;

  Apartment({
    this.entityName,
    this.code,
  });

  factory Apartment.fromJson(String str) => Apartment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Apartment.fromMap(Map<String, dynamic> json) => Apartment(
        entityName: json["_entityName"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "code": code,
      };
}
