import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/user_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CompleteProfileController extends GetxController {
  UserModel? user;
  bool _isCompleteProfileInProgress = false;
  get isCompleteProfileInProgress => _isCompleteProfileInProgress;

  Future<bool> completeProfile(Map<String, String> requestBody) async {
    _isCompleteProfileInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.completeProfile,
      requestBody,
    );
    _isCompleteProfileInProgress = false;
    update();
    if (response.isSuccess) {
      user = UserModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      return false;
    }
  }
}
