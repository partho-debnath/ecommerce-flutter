import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductListController extends GetxController {
  bool _getProductsIsInProgress = false;
  String _errorMessage = '';

  ProductModel _productModel = ProductModel();

  bool get getCategoryIsInProgress => _getProductsIsInProgress;
  String get errorMessage => _errorMessage;
  ProductModel get productModel => _productModel;

  Future<bool> getProducts(int categoryId) async {
    _getProductsIsInProgress = true;
    update();

    final NetworkResponse networkResponse = await NetworkCaller()
        .getRequest(Urls.productListByCategory(categoryId));
    _getProductsIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _productModel = ProductModel.fromJson(networkResponse.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Product list data fetch failed';
      update();
      return false;
    }
  }

  void clearProductList() {
    _productModel.data = null;
    update();
  }
}
