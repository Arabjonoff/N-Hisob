
import 'dart:convert';

List<WalletModel> walletModelFromJson(String str) => List<WalletModel>.from(json.decode(str).map((x) => WalletModel.fromJson(x)));

class WalletModel {
  WalletModel({
    required this.id,
    required this.name,
    required this.valyuteType,
    required this.balans,
    required this.bg,
  });

  int id;
  String name;
  String valyuteType;
  dynamic balans;
  String bg;


  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    id: json["id"]??0,
    name: json["name"]??"",
    valyuteType: json["valyute_type"]??"",
    balans: json["balans"]??0,
    bg: json["bg"]??"assets/icons/006.png",
  );

}
