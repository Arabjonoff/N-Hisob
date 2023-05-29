// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.status,
    required this.data,
    required this.statusCode,
  });

  final String status;
  final Map<String, int> data;
  final int statusCode;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, int>(k, v)),
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "status_code": statusCode,
  };
}
