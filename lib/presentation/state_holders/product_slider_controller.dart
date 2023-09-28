import 'package:get/get.dart';

import '../../data/models/product_slider_data.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductSliderController extends GetxController {
  ProductSliderData _productSliderData = ProductSliderData();
  String _message = '';
  bool _getHomeSlidersInProgress = false;

  String get message => _message;
  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;
  ProductSliderData get productSliderData => _productSliderData;

  Future<bool> getHomeSlider() async {
    _getHomeSlidersInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.productSlider);
    _getHomeSlidersInProgress = false;
    update();
    if (networkResponse.isSuccess) {
      _productSliderData =
          ProductSliderData.fromJson(networkResponse.responseJson!);

      update();
      return true;
    } else {
      _message = 'Home Slider data get failed';
      update();
      return false;
    }
  }
}
