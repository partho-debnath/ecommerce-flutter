import 'package:get/get.dart';

import '../../data/models/category_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CategoryController extends GetxController {
  bool _getCategoryIsInProgress = false;
  String _errorMessage = '';

  CategoryModel _categoryModel = CategoryModel();

  bool get getCategoryIsInProgress => _getCategoryIsInProgress;
  String get errorMessage => _errorMessage;
  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategory() async {
    _getCategoryIsInProgress = true;
    update();

    final NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.categoryList);
    _getCategoryIsInProgress = false;
    update();

    if (networkResponse.isSuccess) {
      _categoryModel =
          CategoryModel.fromJson(networkResponse.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Category list data fetch failed';
      update();
      return false;
    }
  }
}
