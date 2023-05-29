
import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.user,
  });

  int id;
  String name;
  int user;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"]??0,
    name: json["name"]??"",
    user: json["user"]??0,
  );

}
