import 'dart:convert';

class CRM {
  CRM({
    this.id,
    this.login,
    this.password,
    this.userId,
  });

  CRM.forClient({
    this.id,
    this.login,
    this.password,
  });

  factory CRM.fromJson(String str) => CRM.fromMap(json.decode(str));

  factory CRM.fromMap(Map<String, dynamic> json) => CRM(
        id: json["id"] == null ? null : json["id"],
        login: json["login"] == null ? null : json["login"],
        password: json["password"] == null ? null : json["password"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  int id;
  String login;
  String password;
  String userId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "login": login == null ? null : login,
        "password": password == null ? null : password,
        "userId": userId == null ? null : userId,
      };
}
