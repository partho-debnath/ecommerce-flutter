import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/wish_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class WishListController extends GetxController {
  bool _getWishListIsInProgress = false;
  String _errorMessage = '';
  WishListModel _wishListModel = WishListModel();

  bool get getWishListIsInProgress => _getWishListIsInProgress;
  String get errorMessage => _errorMessage;
  WishListModel get wishListModel => _wishListModel;

  Future<bool> getWishList() async {
    late bool isSuccess;
    _getWishListIsInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.getWishList, loginRequired: true);
    _getWishListIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _wishListModel =
          WishListModel.fromJson(networkResponse.responseJson ?? {});
      isSuccess = true;
    } else {
      _errorMessage = 'Wishlist data fetch failed';
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  Future<bool> addProductToWishlist(int productId) async {
    late bool isSuccess;
    _getWishListIsInProgress = true;
    update();
    final NetworkResponse networkResponse = await NetworkCaller().getRequest(
      Urls.addWishList(productId),
      loginRequired: true,
    );
    _getWishListIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = 'Product add to wishlist failed!';
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  Future<bool> removeProductFromWishlist(int productId) async {
    late bool isSuccess;
    _getWishListIsInProgress = true;
    update();
    final NetworkResponse networkResponse = await NetworkCaller().getRequest(
      Urls.removeWishList(productId),
      loginRequired: true,
    );
    _getWishListIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _wishListModel.data!
          .removeWhere((product) => product.productId == productId);
      isSuccess = true;
    } else {
      _errorMessage = 'Product add to wishlist failed!';
      isSuccess = false;
    }
    update();
    return isSuccess;
  }
}
