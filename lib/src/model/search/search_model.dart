// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel? searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));
class SearchModel {
  SearchModel({
    this.status,
    this.statusCode,
    required this.data,
  });

  String? status;
  int? statusCode;
  List<Datum> data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    statusCode: json["status_code"],
    data: List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    this.id,
    this.name,
    this.phone,
    this.surname,
    this.summaUzs,
    this.summaUsd,
    this.lastOperationDate,
    this.comment,
    this.user,
    this.category,
  });

  int? id;
  String? name;
  String? phone;
  String? surname;
  int? summaUzs;
  int? summaUsd;
  DateTime? lastOperationDate;
  String? comment;
  int? user;
  dynamic category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??0,
    name: json["name"]??'',
    phone: json["phone"]??0,
    surname: json["surname"]??'0',
    summaUzs: json["summa_uzs"]??0,
    summaUsd: json["summa_usd"]??0,
    lastOperationDate: json["last_operation_date"] == null?DateTime(2022):DateTime.parse(json["last_operation_date"]),
    comment: json["comment"]??'',
    user: json["user"]??'',
    category: json["category"]??'',
  );

}
