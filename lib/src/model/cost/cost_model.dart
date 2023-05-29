class CostGetModel {
  CostGetModel({
    required this.status,
    required this.statusCode,
    required this.data,
  });

  String status;
  int statusCode;
  List<Datum> data;

  factory CostGetModel.fromJson(Map<String, dynamic> json) => CostGetModel(
    status: json["status"],
    statusCode: json["status_code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );


}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.regDate,
    required this.comment,
    required this.user,
  });

  int id;
  String name;
  DateTime regDate;
  String comment;
  int user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??0,
    name: json["name"]??"",
    regDate: json["reg_date"] == null ?DateTime.now():DateTime.parse(json["reg_date"]),
    comment: json["comment"]??"",
    user: json["user"]??0,
  );

}
