import 'dart:developer';

import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CartController extends GetxController {
  bool _getCartIsInProgress = false;
  String _errorMessage = '';
  bool get getCartIsInProgress => _getCartIsInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> getCart() async {
    late bool isSuccess;
    _getCartIsInProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.getCartList, loginRequired: true);

    if (networkResponse.isSuccess) {
      log(networkResponse.responseJson.toString());
      isSuccess = true;
    } else {
      _errorMessage = 'Get cart list failed.';
      isSuccess = false;
    }
    _getCartIsInProgress = false;
    update();
    return isSuccess;
  }
}
