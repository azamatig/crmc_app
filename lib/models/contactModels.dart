// To parse this JSON data, do
//
//     final contacts = contactsFromJson(jsonString);

import 'dart:convert';

Contacts contactsFromJson(String str) => Contacts.fromMap(json.decode(str));

String contactsToJson(Contacts data) => json.encode(data.toMap());

class Contacts {
  String entityName;
  String instanceName;
  String id;
  ResidenceCountry residenceCountry;
  List<Address> addresses;
  Responsible responsible;
  String upperName;
  List<ContactInfo> contactInfo;
  ClientStatus clientStatus;
  String upperMiddleName;
  List<ContactIdentityDocument> contactIdentityDocuments;

  Contacts({
    this.entityName,
    this.instanceName,
    this.id,
    this.residenceCountry,
    this.addresses,
    this.responsible,
    this.upperName,
    this.contactInfo,
    this.clientStatus,
    this.upperMiddleName,
    this.contactIdentityDocuments,
  });

  factory Contacts.fromMap(Map<String, dynamic> json) => Contacts(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
        id: json["id"],
        residenceCountry: ResidenceCountry.fromMap(json["residenceCountry"]),
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromMap(x))),
        responsible: Responsible.fromMap(json["responsible"]),
        upperName: json["upperName"],
        contactInfo: List<ContactInfo>.from(
            json["contactInfo"].map((x) => ContactInfo.fromMap(x))),
        clientStatus: ClientStatus.fromMap(json["clientStatus"]),
        upperMiddleName: json["upperMiddleName"],
        contactIdentityDocuments: List<ContactIdentityDocument>.from(
            json["contactIdentityDocuments"]
                .map((x) => ContactIdentityDocument.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
        "id": id,
        "residenceCountry": residenceCountry.toMap(),
        "addresses": List<dynamic>.from(addresses.map((x) => x.toMap())),
        "responsible": responsible.toMap(),
        "upperName": upperName,
        "contactInfo": List<dynamic>.from(contactInfo.map((x) => x.toMap())),
        "clientStatus": clientStatus.toMap(),
        "upperMiddleName": upperMiddleName,
        "contactIdentityDocuments":
            List<dynamic>.from(contactIdentityDocuments.map((x) => x.toMap())),
      };
}

class Address {
  String legacyAddress;
  List<Party> parties;
  String fullAddress;

  Address({
    this.legacyAddress,
    this.parties,
    this.fullAddress,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        legacyAddress: json["legacyAddress"],
        parties: List<Party>.from(json["parties"].map((x) => Party.fromMap(x))),
        fullAddress: json["fullAddress"],
      );

  Map<String, dynamic> toMap() => {
        "legacyAddress": legacyAddress,
        "parties": List<dynamic>.from(parties.map((x) => x.toMap())),
        "fullAddress": fullAddress,
      };
}

class Party {
  String entityName;
  String instanceName;

  Party({
    this.entityName,
    this.instanceName,
  });

  factory Party.fromMap(Map<String, dynamic> json) => Party(
        entityName: json["_entityName"],
        instanceName: json["_instanceName"],
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "_instanceName": instanceName,
      };
}

class ClientStatus {
  String langValue;

  ClientStatus({
    this.langValue,
  });

  factory ClientStatus.fromMap(Map<String, dynamic> json) => ClientStatus(
        langValue: json["langValue"],
      );

  Map<String, dynamic> toMap() => {
        "langValue": langValue,
      };
}

class ContactIdentityDocument {
  String number;
  Contact contact;

  ContactIdentityDocument({
    this.number,
    this.contact,
  });

  factory ContactIdentityDocument.fromMap(Map<String, dynamic> json) =>
      ContactIdentityDocument(
        number: json["number"],
        contact: Contact.fromMap(json["contact"]),
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "contact": contact.toMap(),
      };
}

class Contact {
  bool resident;
  Sex sex;
  DateTime dateOfBirth;
  String nationalIdentifier;

  Contact({
    this.resident,
    this.sex,
    this.dateOfBirth,
    this.nationalIdentifier,
  });

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        resident: json["resident"],
        sex: Sex.fromMap(json["sex"]),
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationalIdentifier: json["nationalIdentifier"],
      );

  Map<String, dynamic> toMap() => {
        "resident": resident,
        "sex": sex.toMap(),
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "nationalIdentifier": nationalIdentifier,
      };
}

class Sex {
  String langValue1;

  Sex({
    this.langValue1,
  });

  factory Sex.fromMap(Map<String, dynamic> json) => Sex(
        langValue1: json["langValue1"],
      );

  Map<String, dynamic> toMap() => {
        "langValue1": langValue1,
      };
}

class ContactInfo {
  String value;

  ContactInfo({
    this.value,
  });

  factory ContactInfo.fromMap(Map<String, dynamic> json) => ContactInfo(
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "value": value,
      };
}

class ResidenceCountry {
  String languageValue;

  ResidenceCountry({
    this.languageValue,
  });

  factory ResidenceCountry.fromMap(Map<String, dynamic> json) =>
      ResidenceCountry(
        languageValue: json["languageValue"],
      );

  Map<String, dynamic> toMap() => {
        "languageValue": languageValue,
      };
}

class Responsible {
  String fullName;
  String mobilePhone;

  Responsible({
    this.fullName,
    this.mobilePhone,
  });

  factory Responsible.fromMap(Map<String, dynamic> json) => Responsible(
        fullName: json["fullName"],
        mobilePhone: json["mobilePhone"],
      );

  Map<String, dynamic> toMap() => {
        "fullName": fullName,
        "mobilePhone": mobilePhone,
      };
}
