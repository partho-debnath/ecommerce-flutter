import 'dart:ui';

import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_details.dart';
import '../../data/models/product_details_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';
import '../ui/utility/color_extension.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsIsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  final List<Color> _availableColors = [];
  String _errorMessage = '';

  bool get getProductDetailsIsInProgress => _getProductDetailsIsInProgress;
  ProductDetails get productDetails => _productDetails;
  List<Color> get availableColors => _availableColors;
  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    _getProductDetailsIsInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.productDetailsById(productId));
    _getProductDetailsIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _productDetails =
          ProductDetailsModel.fromJson(networkResponse.responseJson ?? {})
              .data!
              .first;
      _convertStringToColors(_productDetails.color ?? '');
      update();
      return true;
    } else {
      _errorMessage = 'Product details data get failed!';
      update();
      return false;
    }
  }

  List<String> get images {
    return [
      _productDetails.img1!,
      _productDetails.img2!,
      _productDetails.img3!,
      _productDetails.img4!
    ];
  }

  void _convertStringToColors(String hexColors) {
    final List<String> splitColors = hexColors.split(',');
    _availableColors.clear();
    for (int i = 0; i < splitColors.length; i++) {
      _availableColors.add(HexColor.fromHex(splitColors[i]));
    }
  }
}
