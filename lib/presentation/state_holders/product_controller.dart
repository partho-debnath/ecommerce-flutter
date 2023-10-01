import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductController extends GetxController {
  ProductModel _productModel = ProductModel();
  String _errorMessage = '';
  bool _getProductIsInProgress = false;

  String get errorMessage => _errorMessage;
  bool get getProductIsInProgress => _getProductIsInProgress;
  ProductModel get productModel => _productModel;

  Future<bool> getProduct() async {
    _getProductIsInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.productListByRemark('popular'));
    _getProductIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _productModel = ProductModel.fromJson(networkResponse.responseJson!);
      update();
      return true;
    } else {
      _errorMessage = 'Popular product data get failed!';
      update();
      return false;
    }
  }
}
