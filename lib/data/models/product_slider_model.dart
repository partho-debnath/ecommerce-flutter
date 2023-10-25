class ProductSliderModel {
  int id;
  String title;
  String shortDes;
  String price;
  String image;
  int productId;
  String createdAt;
  String updatedAt;

  ProductSliderModel({
    required this.id,
    required this.title,
    required this.shortDes,
    required this.image,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
  });

  factory ProductSliderModel.fromJson(Map<String, dynamic> json) {
    return ProductSliderModel(
      id: json['id'],
      title: json['title'],
      shortDes: json['short_des'],
      image: json['image'],
      productId: json['product_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> productslidermodel = {};
    productslidermodel['id'] = id;
    productslidermodel['title'] = title;
    productslidermodel['short_des'] = shortDes;
    productslidermodel['image'] = image;
    productslidermodel['product_id'] = productId;
    productslidermodel['created_at'] = createdAt;
    productslidermodel['updated_at'] = updatedAt;
    productslidermodel['price'] = price;
    return productslidermodel;
  }
}
