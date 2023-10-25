import './product_data.dart';

class CartData {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  ProductData? product;
  int quantity = 0;

  CartData({
    this.id,
    this.userId,
    this.productId,
    this.color,
    this.size,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      color: json['color'],
      size: json['size'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product: ProductData.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> cartData = {};
    cartData['id'] = id;
    cartData['user_id'] = userId;
    cartData['product_id'] = productId;
    cartData['color'] = color;
    cartData['size'] = size;
    cartData['created_at'] = createdAt;
    cartData['updated_at'] = updatedAt;
    cartData['product'] = product;
    return cartData;
  }
}
