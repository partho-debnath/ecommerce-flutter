import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class NewProductController extends GetxController {
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';
  bool _getNewProductIsInProgress = false;

  String get errorMessage => _errorMessage;
  bool get getProductIsInProgress => _getNewProductIsInProgress;
  ProductModel get newProductModel => _newProductModel;

  Future<bool> getNewProduct() async {
    _getNewProductIsInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.productListByRemark('new'));
    _getNewProductIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _newProductModel = ProductModel.fromJson(networkResponse.responseJson!);
      update();
      return true;
    } else {
      _errorMessage = 'New product data get failed!';
      update();
      return false;
    }
  }
}
