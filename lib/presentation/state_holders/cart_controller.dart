import 'package:get/get.dart';

import '../../data/models/cart_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CartController extends GetxController {
  bool _getCartIsInProgress = false;
  String _errorMessage = '';
  double _totalPrice = 0.0;
  CartModel _cartModel = CartModel();
  bool get getCartIsInProgress => _getCartIsInProgress;
  String get errorMessage => _errorMessage;
  CartModel get cartModel => _cartModel;
  double get totalPrice => _totalPrice;

  Future<bool> getCart() async {
    late bool isSuccess;
    _getCartIsInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.getCartList, loginRequired: true);

    if (networkResponse.isSuccess) {
      _cartModel = CartModel.fromJson(networkResponse.responseJson!);
      isSuccess = true;
    } else {
      _errorMessage = 'Get cart list failed.';
      isSuccess = false;
    }
    _getCartIsInProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> deleteCart(int productId) async {
    late bool isSuccess;
    _getCartIsInProgress = true;
    update();

    final NetworkResponse networkResponse = await NetworkCaller()
        .getRequest(Urls.deleteCart(productId), loginRequired: true);

    if (networkResponse.isSuccess) {
      _removeProductFromCartList(productId);
      isSuccess = true;
    } else {
      _errorMessage = 'Cart delete failed.';
      isSuccess = false;
    }
    _getCartIsInProgress = false;
    update();
    return isSuccess;
  }

  void _removeProductFromCartList(int productId) {
    _cartModel.data!.removeWhere((cartData) => cartData.productId == productId);
  }

  // void increaseProductQuantityInCart(int productId) {
  //   _cartModel.data!
  //       .firstWhere((cartData) => cartData.productId == productId)
  //       .quantity += 1;
  //   update();
  // }

  // void decreaseProductQuantityInCart(int productId) {
  //   _cartModel.data!
  //       .firstWhere((cartData) =>
  //           cartData.productId == productId && cartData.quantity > 1)
  //       .quantity -= 1;
  //   update();
  // }
}
