// To parse this JSON data, do
//
//     final courseAllModel = courseAllModelFromJson(jsonString);

import 'dart:convert';

CourseAllModel courseAllModelFromJson(String str) => CourseAllModel.fromJson(json.decode(str));


class CourseAllModel {
  CourseAllModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  String status;
  int statusCode;
  List<Datum> data;

  factory CourseAllModel.fromJson(Map<String, dynamic> json) => CourseAllModel(
    status: json["status"],
    statusCode: json["status_code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    required this.id,
    required this.regDate,
    required this.course,
  });

  int id;
  DateTime regDate;
  int course;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??0,
    regDate: json["reg_date"] == null ?DateTime.now():DateTime.parse(json["reg_date"]),
    course: json["course"]??0,
  );

}
