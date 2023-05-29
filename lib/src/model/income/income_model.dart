import 'dart:convert';
IncomeAllModel incomeAllModelFromJson(String str) => IncomeAllModel.fromJson(json.decode(str));
class IncomeAllModel {
  IncomeAllModel({
    required this.status,
    required this.statusCode,
    required this.data,
    required this.monthBalans,
    required this.client_blans_uzs,
    required this.client_blans_usd,
    required this.client_month_balance_usd,
    required this.client_month_balance_uzs,
  });

  String status;
  int statusCode;
  int monthBalans;
  int client_blans_uzs;
  int client_blans_usd;
  int client_month_balance_usd;
  int client_month_balance_uzs;
  List<DatumResult> data;

  factory IncomeAllModel.fromJson(Map<String, dynamic> json) => IncomeAllModel(
    status: json["status"]??"",
    statusCode: json["status_code"]??0,
    monthBalans: json["month_balans"]??0,
    client_blans_uzs: json["client_blans_uzs"]??0,
    client_blans_usd: json["client_blans_usd"]??0,
    client_month_balance_usd: json["client_blans_usd"]??0,
    client_month_balance_uzs: json["client_blans_uzs"]??0,
    data: List<DatumResult>.from(json["data"].map((x) => DatumResult.fromJson(x))),
  );
}

class DatumResult {
  DatumResult({
    required this.id,
    required this.wallet,
    required this.operationType,
    required this.valyuteType,
    required this.summaUzs,
    required this.summaUsd,
    required this.comment,
    required this.date,
    required this.user,
    required this.client,
    required this.cost,
    required this.accepted,
  });

  int id;
  Wallet wallet;
  String operationType;
  String valyuteType;
  int summaUzs;
  int summaUsd;
  String comment;
  DateTime date;
  int user;
  dynamic client;
  dynamic cost;
  dynamic accepted;

  factory DatumResult.fromJson(Map<String, dynamic> json) => DatumResult(
    id: json["id"]??0,
    wallet: json["wallet"] == null ? Wallet.fromJson({}):Wallet.fromJson(json["wallet"]),
    operationType: json["operation_type"]??"",
    valyuteType: json["valyute_type"]??"",
    summaUzs: json["summa_uzs"]??0,
    summaUsd: json["summa_usd"]??0,
    comment: json["comment"]??"",
    date: json["date"] == null ?DateTime.now():DateTime.parse(json["date"]),
    user: json["user"]??0,
    client: json["client"]??"",
    cost: json["cost"],
    accepted: json["accepted"],
  );

}

class Wallet {
  Wallet({
    required this.id,
    required  this.name,
    required  this.valyuteType,
    required this.balans,
    required this.bg,
  });

  int id;
  String name;
  String valyuteType;
  int balans;
  String bg;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"]??0,
    name: json["name"]??"",
    valyuteType: json["valyute_type"]??"",
    balans: json["balans"]??0,
    bg: json["bg"]??"",
  );

}
