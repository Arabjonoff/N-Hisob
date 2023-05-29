
import 'dart:convert';

List<ClientModel> clientModelFromJson(String str) => List<ClientModel>.from(json.decode(str).map((x) => ClientModel.fromJson(x)));
String searchModelToJson(List<ClientModel?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));


class ClientModel {
  ClientModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.surname,
    required this.summaUzs,
    required this.summaUsd,
    required this.lastOperationDate,
    required this.comment,
    required this.user,
    required this.category,
  });

  int id;
  String name;
  String phone;
  String surname;
  int summaUzs;
  int summaUsd;
  DateTime lastOperationDate;
  String comment;
  int user;
  dynamic category;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    id: json["id"]??0,
    name: json["name"]??"",
    phone: json["phone"]??'',
    surname: json["surname"]??'',
    summaUzs: json["summa_uzs"]?? 0,
    summaUsd: json["summa_usd"]??0,
    lastOperationDate: json["last_operation_date"] == null ? DateTime.now():DateTime.parse(json["last_operation_date"]),
    comment: json["comment"]??"",
    user: json["user"]??0,
    category: json["category"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "surname": surname,
    "summa_uzs": summaUzs,
    "summa_usd": summaUsd,
    "last_operation_date": lastOperationDate.toIso8601String(),
    "comment": comment,
    "user": user,
    "category": category,
  };
}
