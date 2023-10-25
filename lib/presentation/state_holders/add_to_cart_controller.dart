import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;
  String _errorMessage = '';

  bool get addToCartInProgress => _addToCartInProgress;
  String get message => _errorMessage;

  Future<bool> addToCart(int productId, String productColor, String productSize,
      int productQty) async {
    _addToCartInProgress = true;
    final Map<String, dynamic> requestBody = {
      'product_id': productId,
      'color': productColor,
      'size': productSize,
      'qty': productQty,
    };
    update();
    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.addToCart,
      requestBody,
      loginRequired: true,
    );
    _addToCartInProgress = false;
    update();

    if (response.isSuccess) {
      return true;
    } else {
      _errorMessage = 'Token is not valid. Please try again.';
      update();
      return false;
    }
  }
}
