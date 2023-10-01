import './category_data.dart';

class CategoryModel {
  String? msg;
  List<CategoryData>? data;

  CategoryModel({this.msg, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = json['data']
          .map<CategoryData>((category) => CategoryData.fromJson(category))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((category) => category.toJson()).toList();
    }
    return data;
  }
}
