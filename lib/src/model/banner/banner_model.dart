class BannerModel {
  String? status;
  BannerResult? data;
  int? statusCode;

  BannerModel({this.status, this.data, this.statusCode});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? BannerResult.fromJson(json['data']) : null;
    statusCode = json['status_code'];
  }

}

class BannerResult {
  num kirim;
  num chiqim;
  num xarajat;
  num kirimUsd;
  num chiqimUsd;
  num xarajatUsd;
  num walletsCount;
  num clientsCount;

  BannerResult(
      {required this.kirim,
        required this.chiqim,
        required this.xarajat,
        required this.kirimUsd,
        required this.chiqimUsd,
        required this.xarajatUsd,
        required this.walletsCount,
        required this.clientsCount});

  factory BannerResult.fromJson(Map<String, dynamic> json) =>BannerResult(
      kirim: json['kirim']??0,
      chiqim: json['chiqim']??0,
      xarajat: json['xarajat']??0,
      kirimUsd: json['kirim_usd']??0,
      chiqimUsd: json['chiqim_usd']??0,
      xarajatUsd: json['xarajat_usd']??0,
      walletsCount: json['walletsCount']??0,
      clientsCount: json['clientsCount']??0
  );

}