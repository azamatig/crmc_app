// To parse this JSON data, do
//
//     final complex = complexFromJson(jsonString);

import 'dart:convert';

List<Complex> complexFromJson(String str) =>
    List<Complex>.from(json.decode(str).map((x) => Complex.fromMap(x)));

String complexToJson(List<Complex> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Complex {
  String entityName;
  String instanceName;
  String id;
  String code;
  DateTime endDate;
  int number;
  ComplexAddress address;
  List<Block> blocks;
  bool active;
  Grade grade;
  String name;
  String legacyId;
  DateTime startDate;
  BlockStatus status;

  Complex({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.endDate,
    this.number,
    this.address,
    this.blocks,
    this.active,
    this.grade,
    this.name,
    this.legacyId,
    this.startDate,
    this.status,
  });

  factory Complex.fromMap(Map<String, dynamic> json) => Complex(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        endDate: DateTime.parse(json["endDate"]),
        number: json["number"],
        address: ComplexAddress.fromMap(json["address"]),
        blocks: List<Block>.from(json["blocks"].map((x) => Block.fromMap(x))),
        active: json["active"],
        grade: Grade.fromMap(json["grade"]),
        name: json["name"],
        legacyId: json["legacyID"],
        startDate: DateTime.parse(json["startDate"]),
        status: BlockStatus.fromMap(json["status"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "number": number,
        "address": address.toMap(),
        "blocks": List<dynamic>.from(blocks.map((x) => x.toMap())),
        "active": active,
        "grade": grade.toMap(),
        "name": name,
        "legacyID": legacyId,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "status": status.toMap(),
      };
}

class ComplexAddress {
  String entityName;
  String instanceName;
  String id;
  Grade country;
  AddressCity city;
  String streetAddressLang1;
  AddressCityDistrict cityDistrict;
  String streetAddress;
  AddressRegion region;

  ComplexAddress({
    this.entityName,
    this.instanceName,
    this.id,
    this.country,
    this.city,
    this.streetAddressLang1,
    this.cityDistrict,
    this.streetAddress,
    this.region,
  });

  factory ComplexAddress.fromMap(Map<String, dynamic> json) => ComplexAddress(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        country: Grade.fromMap(json["country"]),
        city: AddressCity.fromMap(json["city"]),
        streetAddressLang1: json["streetAddressLang1"],
        cityDistrict: AddressCityDistrict.fromMap(json["cityDistrict"]),
        streetAddress: json["streetAddress"],
        region: AddressRegion.fromMap(json["region"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "country": country.toMap(),
        "city": city.toMap(),
        "streetAddressLang1": streetAddressLang1,
        "cityDistrict": cityDistrict.toMap(),
        "streetAddress": streetAddress,
        "region": region.toMap(),
      };
}

class AddressCity {
  CityEntityName entityName;
  String instanceName;
  String id;
  String languageValue;
  bool isSystemRecord;
  bool active;
  String settlementLang1;
  String settlementLang2;
  String code;
  LangValue3 settlementLang3;
  LangValue3 langValue3;
  String langValue2;
  String langValue1;

  AddressCity({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.isSystemRecord,
    this.active,
    this.settlementLang1,
    this.settlementLang2,
    this.code,
    this.settlementLang3,
    this.langValue3,
    this.langValue2,
    this.langValue1,
  });

  factory AddressCity.fromMap(Map<String, dynamic> json) => AddressCity(
        entityName: cityEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        settlementLang1: json["settlementLang1"],
        settlementLang2: json["settlementLang2"],
        code: json["code"],
        settlementLang3: langValue3Values.map[json["settlementLang3"]],
        langValue3: langValue3Values.map[json["langValue3"]],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": cityEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "settlementLang1": settlementLang1,
        "settlementLang2": settlementLang2,
        "code": code,
        "settlementLang3": langValue3Values.reverse[settlementLang3],
        "langValue3": langValue3Values.reverse[langValue3],
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

enum CityEntityName { CRM_DIC_CITY_CRM }

final cityEntityNameValues =
    EnumValues({"crm\u0024DicCityCrm": CityEntityName.CRM_DIC_CITY_CRM});

enum LangValue3 { KARAGANDA, ALMATY, NUR_SULTAN }

final langValue3Values = EnumValues({
  "Almaty": LangValue3.ALMATY,
  "Karaganda": LangValue3.KARAGANDA,
  "Nur-Sultan": LangValue3.NUR_SULTAN
});

class AddressCityDistrict {
  CityDistrictEntityName entityName;
  String instanceName;
  String id;
  String languageValue;
  int order;
  bool isSystemRecord;
  bool active;
  String langValue2;
  String langValue1;

  AddressCityDistrict({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory AddressCityDistrict.fromMap(Map<String, dynamic> json) =>
      AddressCityDistrict(
        entityName: cityDistrictEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": cityDistrictEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

enum CityDistrictEntityName { BASE_DIC_CITY_DISTRICT }

final cityDistrictEntityNameValues = EnumValues({
  "base\u0024DicCityDistrict": CityDistrictEntityName.BASE_DIC_CITY_DISTRICT
});

class Grade {
  String entityName;
  String instanceName;
  String id;
  String languageValue;
  int order;
  bool isSystemRecord;
  String langValue3;
  bool active;
  String langValue2;
  String langValue1;

  Grade({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory Grade.fromMap(Map<String, dynamic> json) => Grade(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: json["langValue3"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "langValue3": langValue3,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

class AddressRegion {
  RegionEntityName entityName;
  String instanceName;
  String id;
  String code;
  String languageValue;
  int order;
  bool isSystemRecord;
  bool active;
  String langValue2;
  String langValue1;

  AddressRegion({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory AddressRegion.fromMap(Map<String, dynamic> json) => AddressRegion(
        entityName: regionEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": regionEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

enum RegionEntityName { BASE_DIC_REGION }

final regionEntityNameValues =
    EnumValues({"base\u0024DicRegion": RegionEntityName.BASE_DIC_REGION});

class Block {
  String entityName;
  String instanceName;
  String id;
  String code;
  String cadastralNumber;
  DateTime endDate;
  String houseNumber;
  Type type;
  String adminHtml;
  int floors;
  String investorPermissionNumber;
  BlockAddress address;
  String clientHtml;
  bool active;
  DateTime commissioningDate;
  List<Section> sections;
  DateTime investorPermissionDate;
  String name;
  String legacyId;
  DateTime commissioningAgreementDate;
  BlockStatus status;
  String landArea;
  String level;
  String mark;

  Block({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.cadastralNumber,
    this.endDate,
    this.houseNumber,
    this.type,
    this.adminHtml,
    this.floors,
    this.investorPermissionNumber,
    this.address,
    this.clientHtml,
    this.active,
    this.commissioningDate,
    this.sections,
    this.investorPermissionDate,
    this.name,
    this.legacyId,
    this.commissioningAgreementDate,
    this.status,
    this.landArea,
    this.level,
    this.mark,
  });

  factory Block.fromMap(Map<String, dynamic> json) => Block(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        cadastralNumber: json["cadastralNumber"],
        endDate: DateTime.parse(json["endDate"]),
        houseNumber: json["houseNumber"] == null ? null : json["houseNumber"],
        type: Type.fromMap(json["type"]),
        adminHtml: json["adminHtml"],
        floors: json["floors"] == null ? null : json["floors"],
        investorPermissionNumber: json["investorPermissionNumber"],
        address: BlockAddress.fromMap(json["address"]),
        clientHtml: json["clientHtml"],
        active: json["active"],
        commissioningDate: DateTime.parse(json["commissioningDate"]),
        sections:
            List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
        investorPermissionDate: DateTime.parse(json["investorPermissionDate"]),
        name: json["name"],
        legacyId: json["legacyID"],
        commissioningAgreementDate:
            DateTime.parse(json["commissioningAgreementDate"]),
        status: BlockStatus.fromMap(json["status"]),
        landArea: json["landArea"] == null ? null : json["landArea"],
        level: json["level"] == null ? null : json["level"],
        mark: json["mark"] == null ? null : json["mark"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "cadastralNumber": cadastralNumber,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "houseNumber": houseNumber == null ? null : houseNumber,
        "type": type.toMap(),
        "adminHtml": adminHtml,
        "floors": floors == null ? null : floors,
        "investorPermissionNumber": investorPermissionNumber,
        "address": address.toMap(),
        "clientHtml": clientHtml,
        "active": active,
        "commissioningDate":
            "${commissioningDate.year.toString().padLeft(4, '0')}-${commissioningDate.month.toString().padLeft(2, '0')}-${commissioningDate.day.toString().padLeft(2, '0')}",
        "sections": List<dynamic>.from(sections.map((x) => x.toMap())),
        "investorPermissionDate":
            "${investorPermissionDate.year.toString().padLeft(4, '0')}-${investorPermissionDate.month.toString().padLeft(2, '0')}-${investorPermissionDate.day.toString().padLeft(2, '0')}",
        "name": name,
        "legacyID": legacyId,
        "commissioningAgreementDate":
            "${commissioningAgreementDate.year.toString().padLeft(4, '0')}-${commissioningAgreementDate.month.toString().padLeft(2, '0')}-${commissioningAgreementDate.day.toString().padLeft(2, '0')}",
        "status": status.toMap(),
        "landArea": landArea == null ? null : landArea,
        "level": level == null ? null : level,
        "mark": mark == null ? null : mark,
      };
}

class BlockAddress {
  String entityName;
  String instanceName;
  String id;
  Country country;
  AddressCity city;
  String streetAddressLang1;
  AddressCityDistrict cityDistrict;
  String streetAddress;
  AddressRegion region;

  BlockAddress({
    this.entityName,
    this.instanceName,
    this.id,
    this.country,
    this.city,
    this.streetAddressLang1,
    this.cityDistrict,
    this.streetAddress,
    this.region,
  });

  factory BlockAddress.fromMap(Map<String, dynamic> json) => BlockAddress(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        country: Country.fromMap(json["country"]),
        city: AddressCity.fromMap(json["city"]),
        streetAddressLang1: json["streetAddressLang1"],
        cityDistrict: AddressCityDistrict.fromMap(json["cityDistrict"]),
        streetAddress: json["streetAddress"],
        region: AddressRegion.fromMap(json["region"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "country": country.toMap(),
        "city": city.toMap(),
        "streetAddressLang1": streetAddressLang1,
        "cityDistrict": cityDistrict.toMap(),
        "streetAddress": streetAddress,
        "region": region.toMap(),
      };
}

class Country {
  String entityName;
  String instanceName;
  String id;
  String languageValue;
  int order;
  bool isSystemRecord;
  String langValue3;
  bool active;
  String langValue2;
  String langValue1;
  List<RegionElement> regions;

  Country({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
    this.regions,
  });

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: json["langValue3"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
        regions: json["regions"] == null
            ? null
            : List<RegionElement>.from(
                json["regions"].map((x) => RegionElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "langValue3": langValue3,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
        "regions": regions == null
            ? null
            : List<dynamic>.from(regions.map((x) => x.toMap())),
      };
}

class RegionElement {
  RegionEntityName entityName;
  String instanceName;
  String id;
  String code;
  String languageValue;
  int order;
  bool isSystemRecord;
  List<CityElement> cities;
  bool active;
  String langValue2;
  String langValue1;

  RegionElement({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.cities,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory RegionElement.fromMap(Map<String, dynamic> json) => RegionElement(
        entityName: regionEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"] == null ? null : json["code"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        cities: List<CityElement>.from(
            json["cities"].map((x) => CityElement.fromMap(x))),
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": regionEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "code": code == null ? null : code,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "cities": List<dynamic>.from(cities.map((x) => x.toMap())),
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

class CityElement {
  CityEntityName entityName;
  String instanceName;
  String id;
  String languageValue;
  bool isSystemRecord;
  bool active;
  String settlementLang1;
  String settlementLang2;
  String code;
  List<CityDistrictElement> cityDistricts;
  LangValue3 settlementLang3;
  LangValue3 langValue3;
  String langValue2;
  String langValue1;

  CityElement({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.isSystemRecord,
    this.active,
    this.settlementLang1,
    this.settlementLang2,
    this.code,
    this.cityDistricts,
    this.settlementLang3,
    this.langValue3,
    this.langValue2,
    this.langValue1,
  });

  factory CityElement.fromMap(Map<String, dynamic> json) => CityElement(
        entityName: cityEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        settlementLang1: json["settlementLang1"],
        settlementLang2: json["settlementLang2"],
        code: json["code"] == null ? null : json["code"],
        cityDistricts: List<CityDistrictElement>.from(
            json["cityDistricts"].map((x) => CityDistrictElement.fromMap(x))),
        settlementLang3: json["settlementLang3"] == null
            ? null
            : langValue3Values.map[json["settlementLang3"]],
        langValue3: json["langValue3"] == null
            ? null
            : langValue3Values.map[json["langValue3"]],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": cityEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "settlementLang1": settlementLang1,
        "settlementLang2": settlementLang2,
        "code": code == null ? null : code,
        "cityDistricts":
            List<dynamic>.from(cityDistricts.map((x) => x.toMap())),
        "settlementLang3": settlementLang3 == null
            ? null
            : langValue3Values.reverse[settlementLang3],
        "langValue3":
            langValue3 == null ? null : langValue3Values.reverse[langValue3],
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

class CityDistrictElement {
  CityDistrictEntityName entityName;
  String instanceName;
  String id;
  String languageValue;
  int order;
  bool isSystemRecord;
  bool active;
  String langValue2;
  String langValue1;
  String code;

  CityDistrictElement({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.active,
    this.langValue2,
    this.langValue1,
    this.code,
  });

  factory CityDistrictElement.fromMap(Map<String, dynamic> json) =>
      CityDistrictElement(
        entityName: cityDistrictEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": cityDistrictEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
        "code": code == null ? null : code,
      };
}

class Section {
  SectionEntityName entityName;
  String instanceName;
  String id;
  List<dynamic> images;
  String name;
  int maxApartments;
  String legacyId;
  int order;
  List<Apartment> apartments;

  Section({
    this.entityName,
    this.instanceName,
    this.id,
    this.images,
    this.name,
    this.maxApartments,
    this.legacyId,
    this.order,
    this.apartments,
  });

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        entityName: sectionEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        name: json["name"],
        maxApartments: json["maxApartments"],
        legacyId: json["legacyID"],
        order: json["order"],
        apartments: List<Apartment>.from(
            json["apartments"].map((x) => Apartment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": sectionEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "name": name,
        "maxApartments": maxApartments,
        "legacyID": legacyId,
        "order": order,
        "apartments": List<dynamic>.from(apartments.map((x) => x.toMap())),
      };
}

class Apartment {
  ApartmentEntityName entityName;
  String instanceName;
  String id;
  int rooms;
  ApartmentCode code;
  double totalPrice;
  String description;
  ComplexBlockSection complexBlockSection;
  double livingArea;
  int number;
  int price;
  Currency currency;
  RealEstateType realEstateType;
  int floor;
  String factFloor;
  double area;
  List<dynamic> images;
  String legacyId;
  ApartmentStatus status;
  UpdatedBy updatedBy;
  DateTime updateTs;
  Manager manager;

  Apartment({
    this.entityName,
    this.instanceName,
    this.id,
    this.rooms,
    this.code,
    this.totalPrice,
    this.description,
    this.complexBlockSection,
    this.livingArea,
    this.number,
    this.price,
    this.currency,
    this.realEstateType,
    this.floor,
    this.factFloor,
    this.area,
    this.images,
    this.legacyId,
    this.status,
    this.updatedBy,
    this.updateTs,
    this.manager,
  });

  factory Apartment.fromMap(Map<String, dynamic> json) => Apartment(
        entityName: apartmentEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
        rooms: json["rooms"],
        code: apartmentCodeValues.map[json["code"]],
        totalPrice: json["totalPrice"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        complexBlockSection:
            ComplexBlockSection.fromMap(json["complexBlockSection"]),
        livingArea: json["livingArea"].toDouble(),
        number: json["number"],
        price: json["price"],
        currency: Currency.fromMap(json["currency"]),
        realEstateType: RealEstateType.fromMap(json["realEstateType"]),
        floor: json["floor"],
        factFloor: json["factFloor"],
        area: json["area"].toDouble(),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        legacyId: json["legacyID"],
        status: ApartmentStatus.fromMap(json["status"]),
        updatedBy: json["updatedBy"] == null
            ? null
            : updatedByValues.map[json["updatedBy"]],
        updateTs:
            json["updateTs"] == null ? null : DateTime.parse(json["updateTs"]),
        manager:
            json["manager"] == null ? null : Manager.fromMap(json["manager"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": apartmentEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
        "rooms": rooms,
        "code": apartmentCodeValues.reverse[code],
        "totalPrice": totalPrice,
        "description": description == null ? null : description,
        "complexBlockSection": complexBlockSection.toMap(),
        "livingArea": livingArea,
        "number": number,
        "price": price,
        "currency": currency.toMap(),
        "realEstateType": realEstateType.toMap(),
        "floor": floor,
        "factFloor": factFloor,
        "area": area,
        "images": List<dynamic>.from(images.map((x) => x)),
        "legacyID": legacyId,
        "status": status.toMap(),
        "updatedBy":
            updatedBy == null ? null : updatedByValues.reverse[updatedBy],
        "updateTs": updateTs == null ? null : updateTs.toIso8601String(),
        "manager": manager == null ? null : manager.toMap(),
      };
}

enum ApartmentCode {
  THE_3,
  CODE_3,
  THE_4,
  THE_2,
  EMPTY,
  THE_1,
  CODE_2,
  PURPLE_2,
  FLUFFY_2,
  TENTACLED_2,
  STICKY_2,
  PURPLE_3,
  CODE_1,
  INDIGO_2,
  INDECENT_2,
  PURPLE_1,
  CODE_4,
  PURPLE_4
}

final apartmentCodeValues = EnumValues({
  "1А": ApartmentCode.CODE_1,
  "2б": ApartmentCode.CODE_2,
  "3а": ApartmentCode.CODE_3,
  "4А": ApartmentCode.CODE_4,
  "оф": ApartmentCode.EMPTY,
  "2в": ApartmentCode.FLUFFY_2,
  "2Г": ApartmentCode.INDECENT_2,
  "2Б": ApartmentCode.INDIGO_2,
  "1кв": ApartmentCode.PURPLE_1,
  "2г": ApartmentCode.PURPLE_2,
  "3А": ApartmentCode.PURPLE_3,
  "4Б": ApartmentCode.PURPLE_4,
  "2А": ApartmentCode.STICKY_2,
  "2В": ApartmentCode.TENTACLED_2,
  "1а": ApartmentCode.THE_1,
  "2а": ApartmentCode.THE_2,
  "3б": ApartmentCode.THE_3,
  "4а": ApartmentCode.THE_4
});

class ComplexBlockSection {
  SectionEntityName entityName;
  String instanceName;
  String id;

  ComplexBlockSection({
    this.entityName,
    this.instanceName,
    this.id,
  });

  factory ComplexBlockSection.fromMap(Map<String, dynamic> json) =>
      ComplexBlockSection(
        entityName: sectionEntityNameValues.map[json["_entityName"]],
        instanceName: json["_instanceName"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": sectionEntityNameValues.reverse[entityName],
        "_instanceName": instanceName,
        "id": id,
      };
}

enum SectionEntityName { CRMC_COMPLEX_BLOCK_SECTION }

final sectionEntityNameValues = EnumValues({
  "crmc\u0024ComplexBlockSection": SectionEntityName.CRMC_COMPLEX_BLOCK_SECTION
});

class Currency {
  CurrencyEntityName entityName;
  CodeEnum instanceName;
  String id;
  CodeEnum code;
  Description2 description2;
  Description3 description3;
  Description1 description1;
  CodeEnum languageValue;
  int order;
  bool isSystemRecord;
  CodeEnum langValue3;
  bool active;
  CodeEnum langValue2;
  CodeEnum langValue1;

  Currency({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.description2,
    this.description3,
    this.description1,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        entityName: currencyEntityNameValues.map[json["_entityName"]],
        instanceName: codeEnumValues.map[json["_instanceName"]],
        id: json["id"],
        code: codeEnumValues.map[json["code"]],
        description2: description2Values.map[json["description2"]],
        description3: description3Values.map[json["description3"]],
        description1: description1Values.map[json["description1"]],
        languageValue: codeEnumValues.map[json["languageValue"]],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: codeEnumValues.map[json["langValue3"]],
        active: json["active"],
        langValue2: codeEnumValues.map[json["langValue2"]],
        langValue1: codeEnumValues.map[json["langValue1"]],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": currencyEntityNameValues.reverse[entityName],
        "_instanceName": codeEnumValues.reverse[instanceName],
        "id": id,
        "code": codeEnumValues.reverse[code],
        "description2": description2Values.reverse[description2],
        "description3": description3Values.reverse[description3],
        "description1": description1Values.reverse[description1],
        "languageValue": codeEnumValues.reverse[languageValue],
        "order": order,
        "isSystemRecord": isSystemRecord,
        "langValue3": codeEnumValues.reverse[langValue3],
        "active": active,
        "langValue2": codeEnumValues.reverse[langValue2],
        "langValue1": codeEnumValues.reverse[langValue1],
      };
}

enum CodeEnum { KZT }

final codeEnumValues = EnumValues({"KZT": CodeEnum.KZT});

enum Description1 { EMPTY }

final description1Values = EnumValues({"тенге": Description1.EMPTY});

enum Description2 { EMPTY }

final description2Values = EnumValues({"теңге": Description2.EMPTY});

enum Description3 { TENGE }

final description3Values = EnumValues({"Tenge": Description3.TENGE});

enum CurrencyEntityName { BASE_DIC_CURRENCY }

final currencyEntityNameValues =
    EnumValues({"base\u0024DicCurrency": CurrencyEntityName.BASE_DIC_CURRENCY});

enum ApartmentEntityName { CRMC_APARTMENT }

final apartmentEntityNameValues =
    EnumValues({"crmc\u0024Apartment": ApartmentEntityName.CRMC_APARTMENT});

class Manager {
  String entityName;
  String instanceName;
  String id;
  List<ListElement> list;

  Manager({
    this.entityName,
    this.instanceName,
    this.id,
    this.list,
  });

  factory Manager.fromMap(Map<String, dynamic> json) => Manager(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
      };
}

class ListElement {
  String entityName;
  String instanceName;
  String id;
  String lastName;
  DateTime endDate;
  String firstName;
  String middleName;
  DateTime startDate;

  ListElement({
    this.entityName,
    this.instanceName,
    this.id,
    this.lastName,
    this.endDate,
    this.firstName,
    this.middleName,
    this.startDate,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        lastName: json["lastName"],
        endDate: DateTime.parse(json["endDate"]),
        firstName: json["firstName"],
        middleName: json["middleName"],
        startDate: DateTime.parse(json["startDate"]),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "lastName": lastName,
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "firstName": firstName,
        "middleName": middleName,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
      };
}

class RealEstateType {
  RealEstateTypeEntityName entityName;
  RealEstateTypeInstanceName instanceName;
  String id;
  RealEstateTypeCode code;
  RealEstateTypeInstanceName languageValue;
  int order;
  bool isSystemRecord;
  bool active;
  RealEstateTypeInstanceName langValue2;
  RealEstateTypeInstanceName langValue1;

  RealEstateType({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory RealEstateType.fromMap(Map<String, dynamic> json) => RealEstateType(
        entityName: realEstateTypeEntityNameValues.map[json["_entityName"]],
        instanceName:
            realEstateTypeInstanceNameValues.map[json["_instanceName"]],
        id: json["id"],
        code: realEstateTypeCodeValues.map[json["code"]],
        languageValue:
            realEstateTypeInstanceNameValues.map[json["languageValue"]],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        langValue2: realEstateTypeInstanceNameValues.map[json["langValue2"]],
        langValue1: realEstateTypeInstanceNameValues.map[json["langValue1"]],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": realEstateTypeEntityNameValues.reverse[entityName],
        "_instanceName": realEstateTypeInstanceNameValues.reverse[instanceName],
        "id": id,
        "code": realEstateTypeCodeValues.reverse[code],
        "languageValue":
            realEstateTypeInstanceNameValues.reverse[languageValue],
        "order": order,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "langValue2": realEstateTypeInstanceNameValues.reverse[langValue2],
        "langValue1": realEstateTypeInstanceNameValues.reverse[langValue1],
      };
}

enum RealEstateTypeCode { APARTMENT, OFFICE, PARKING }

final realEstateTypeCodeValues = EnumValues({
  "APARTMENT": RealEstateTypeCode.APARTMENT,
  "OFFICE": RealEstateTypeCode.OFFICE,
  "PARKING": RealEstateTypeCode.PARKING
});

enum RealEstateTypeEntityName { CRMC_DIC_REAL_ESTATE_TYPE }

final realEstateTypeEntityNameValues = EnumValues({
  "crmc\u0024DicRealEstateType":
      RealEstateTypeEntityName.CRMC_DIC_REAL_ESTATE_TYPE
});

enum RealEstateTypeInstanceName { EMPTY, INSTANCE_NAME, PURPLE }

final realEstateTypeInstanceNameValues = EnumValues({
  "Квартира": RealEstateTypeInstanceName.EMPTY,
  "Офис": RealEstateTypeInstanceName.INSTANCE_NAME,
  "Машиноместо": RealEstateTypeInstanceName.PURPLE
});

class ApartmentStatus {
  StatusEntityName entityName;
  StatusInstanceName instanceName;
  String id;
  StatusCode code;
  int order;
  bool isSystemRecord;
  StatusLangValue3 langValue3;
  bool active;
  StatusInstanceName langValue2;
  StatusInstanceName langValue1;

  ApartmentStatus({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.order,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory ApartmentStatus.fromMap(Map<String, dynamic> json) => ApartmentStatus(
        entityName: statusEntityNameValues.map[json["_entityName"]],
        instanceName: statusInstanceNameValues.map[json["_instanceName"]],
        id: json["id"],
        code: statusCodeValues.map[json["code"]],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: statusLangValue3Values.map[json["langValue3"]],
        active: json["active"],
        langValue2: statusInstanceNameValues.map[json["langValue2"]],
        langValue1: statusInstanceNameValues.map[json["langValue1"]],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": statusEntityNameValues.reverse[entityName],
        "_instanceName": statusInstanceNameValues.reverse[instanceName],
        "id": id,
        "code": statusCodeValues.reverse[code],
        "order": order,
        "isSystemRecord": isSystemRecord,
        "langValue3": statusLangValue3Values.reverse[langValue3],
        "active": active,
        "langValue2": statusInstanceNameValues.reverse[langValue2],
        "langValue1": statusInstanceNameValues.reverse[langValue1],
      };
}

enum StatusCode { SOLD, FREE, RESERVED, NOT_SALE }

final statusCodeValues = EnumValues({
  "FREE": StatusCode.FREE,
  "NOT_SALE": StatusCode.NOT_SALE,
  "RESERVED": StatusCode.RESERVED,
  "SOLD": StatusCode.SOLD
});

enum StatusEntityName { CRMC_DIC_APARTMENT_STATUS }

final statusEntityNameValues = EnumValues({
  "crmc\u0024DicApartmentStatus": StatusEntityName.CRMC_DIC_APARTMENT_STATUS
});

enum StatusInstanceName { EMPTY, INSTANCE_NAME, PURPLE, FLUFFY }

final statusInstanceNameValues = EnumValues({
  "Продана": StatusInstanceName.EMPTY,
  "Снята с продаж": StatusInstanceName.FLUFFY,
  "Свободна": StatusInstanceName.INSTANCE_NAME,
  "Бронь": StatusInstanceName.PURPLE
});

enum StatusLangValue3 { SOLD, FREE, RESERVED, NOT_SALE }

final statusLangValue3Values = EnumValues({
  "Free": StatusLangValue3.FREE,
  "Not sale": StatusLangValue3.NOT_SALE,
  "Reserved": StatusLangValue3.RESERVED,
  "Sold": StatusLangValue3.SOLD
});

enum UpdatedBy { ADMIN, A_BEREKESHEVA }

final updatedByValues = EnumValues(
    {"admin": UpdatedBy.ADMIN, "a.berekesheva": UpdatedBy.A_BEREKESHEVA});

class BlockStatus {
  String entityName;
  String instanceName;
  String id;
  String languageValue;
  int order;
  bool isSystemRecord;
  bool active;
  String langValue2;
  String langValue1;

  BlockStatus({
    this.entityName,
    this.instanceName,
    this.id,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory BlockStatus.fromMap(Map<String, dynamic> json) => BlockStatus(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

class Type {
  String entityName;
  String instanceName;
  String id;
  String code;
  String languageValue;
  int order;
  bool isSystemRecord;
  String langValue3;
  bool active;
  String langValue2;
  String langValue1;

  Type({
    this.entityName,
    this.instanceName,
    this.id,
    this.code,
    this.languageValue,
    this.order,
    this.isSystemRecord,
    this.langValue3,
    this.active,
    this.langValue2,
    this.langValue1,
  });

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        code: json["code"],
        languageValue: json["languageValue"],
        order: json["order"],
        isSystemRecord: json["isSystemRecord"],
        langValue3: json["langValue3"],
        active: json["active"],
        langValue2: json["langValue2"],
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "code": code,
        "languageValue": languageValue,
        "order": order,
        "isSystemRecord": isSystemRecord,
        "langValue3": langValue3,
        "active": active,
        "langValue2": langValue2,
        "langValue1": langValue1,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
