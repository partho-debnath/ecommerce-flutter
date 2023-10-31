import './product_data.dart';

class WishListData {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductData? product;

  WishListData({
    this.id,
    this.productId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory WishListData.fromJson(Map<String, dynamic> json) {
    return WishListData(
      id: json['id'],
      productId: json['product_id'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product: json['product'] != null
          ? ProductData.fromJson(json['product'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
