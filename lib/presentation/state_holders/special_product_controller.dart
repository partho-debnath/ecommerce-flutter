import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class SpecialProductController extends GetxController {
  ProductModel _specialProductModel = ProductModel();
  String _errorMessage = '';
  bool _getProductIsInProgress = false;

  String get errorMessage => _errorMessage;
  bool get getProductIsInProgress => _getProductIsInProgress;
  ProductModel get specialProductModel => _specialProductModel;

  Future<bool> getSpecialProduct() async {
    _getProductIsInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.productListByRemark('special'));
    _getProductIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _specialProductModel =
          ProductModel.fromJson(networkResponse.responseJson!);
      update();
      return true;
    } else {
      _errorMessage = 'Special product data get failed!';
      update();
      return false;
    }
  }
}
