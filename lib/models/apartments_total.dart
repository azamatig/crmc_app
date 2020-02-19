// To parse this JSON data, do
//
//     final apartmentsList = apartmentsListFromJson(jsonString);

import 'dart:convert';

List<ApartmentsList> apartmentsListFromJson(String str) =>
    List<ApartmentsList>.from(
        json.decode(str).map((x) => ApartmentsList.fromMap(x)));

String apartmentsListToJson(List<ApartmentsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ApartmentsList {
  String entityName;
  String id;
  String code;
  ComplexBlockSection complexBlockSection;
  int number;

  ApartmentsList({
    this.entityName,
    this.id,
    this.code,
    this.complexBlockSection,
    this.number,
  });

  factory ApartmentsList.fromMap(Map<String, dynamic> json) => ApartmentsList(
        entityName: json["_entityName"],
        id: json["id"],
        code: json["code"],
        complexBlockSection:
            ComplexBlockSection.fromMap(json["complexBlockSection"]),
        number: json["number"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "code": code,
        "complexBlockSection": complexBlockSection.toMap(),
        "number": number,
      };
}

class ComplexBlockSection {
  String entityName;
  String id;
  ComplexBlock complexBlock;

  ComplexBlockSection({
    this.entityName,
    this.id,
    this.complexBlock,
  });

  factory ComplexBlockSection.fromMap(Map<String, dynamic> json) =>
      ComplexBlockSection(
        entityName: json["_entityName"],
        id: json["id"],
        complexBlock: ComplexBlock.fromMap(json["complexBlock"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "complexBlock": complexBlock.toMap(),
      };
}

class ComplexBlock {
  String entityName;
  String id;
  Complex complex;
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
        complex: Complex.fromMap(json["complex"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "id": id,
        "complex": complex.toMap(),
        "name": name,
      };
}

class Complex {
  String entityName;
  String id;
  String name;

  Complex({
    this.entityName,
    this.id,
    this.name,
  });

  factory Complex.fromMap(Map<String, dynamic> json) => Complex(
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
