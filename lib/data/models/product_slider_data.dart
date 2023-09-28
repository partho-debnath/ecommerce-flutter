import './product_slider_model.dart';

class ProductSliderData {
  String? msg;
  List<ProductSliderModel>? productslidermodel;

  ProductSliderData({this.msg, this.productslidermodel});

  ProductSliderData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productslidermodel = <ProductSliderModel>[];
      json['data'].forEach((v) {
        productslidermodel!.add(ProductSliderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> productslidermodel = {};
    productslidermodel['msg'] = msg;
    if (this.productslidermodel != null) {
      productslidermodel['data'] =
          this.productslidermodel!.map((v) => v.toJson()).toList();
    }
    return productslidermodel;
  }
}
