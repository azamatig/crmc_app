// To parse this JSON data, do
//
//     final complexBlocks = complexBlocksFromJson(jsonString);

import 'dart:convert';

class ComplexBlocks {
  String entityName;
  String instanceName;
  String id;
  String name;

  ComplexBlocks({
    this.entityName,
    this.instanceName,
    this.id,
    this.name,
  });

  factory ComplexBlocks.fromJson(String str) =>
      ComplexBlocks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComplexBlocks.fromMap(Map<String, dynamic> json) => ComplexBlocks(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "name": name,
      };
}
