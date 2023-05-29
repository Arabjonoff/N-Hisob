// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel? profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel? data) => json.encode(data!.toJson());

class ProfileModel {
  ProfileModel({
    this.detail,
    this.status,
    this.data,
    this.statusCode,
    this.registerDate,
  });

  String? detail;
  String? status;
  Data? data;
  int? statusCode;
  String? registerDate;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    detail: json["detail"],
    status: json["status"],
    data: Data.fromJson(json["data"]),
    statusCode: json["status_code"],
    registerDate: json["register_date"],
  );

  Map<String, dynamic> toJson() => {
    "detail": detail,
    "status": status,
    "data": data!.toJson(),
    "status_code": statusCode,
    "register_date": registerDate,
  };
}

class Data {
  Data({
    this.id,
    this.phone,
    this.name,
    this.surname,
    this.photo,
    this.status,
    this.verificationCode,
    this.active,
    this.balans,
    this.minus,
    this.plus,
    this.lastLogin,
    this.user,
  });

  int? id;
  String? phone;
  String? name;
  String? surname;
  String? photo;
  String? status;
  int? verificationCode;
  bool? active;
  int? balans;
  int? minus;
  int? plus;
  DateTime? lastLogin;
  int? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]??0,
    phone: json["phone"]??"",
    name: json["name"]??"",
    surname: json["surname"]??"",
    photo: json["photo"]??"",
    status: json["status"]??"",
    verificationCode: json["verification_code"]??0,
    active: json["active"]?? false,
    balans: json["balans"]??0,
    minus: json["minus"]??0,
    plus: json["plus"]??0,
    lastLogin: DateTime.parse(json["last_login"]),
    user: json["user"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone": phone,
    "name": name,
    "surname": surname,
    "photo": photo,
    "status": status,
    "verification_code": verificationCode,
    "active": active,
    "balans": balans,
    "minus": minus,
    "plus": plus,
    "last_login": lastLogin?.toIso8601String(),
    "user": user,
  };
}
