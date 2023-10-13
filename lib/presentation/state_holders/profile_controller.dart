import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';
import '../ui/screens/main_buttom_nav_bar.dart';
import './auth_controller.dart';
import './otp_verification_controller.dart';

class ProfileController extends GetxController {
  bool _profileCreateInProgress = false;
  String _errorMessage = '';

  bool get profileCreateInProgress => _profileCreateInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> createProfile({
    required String firstName,
    required String lastName,
    required String mobile,
    required String city,
    required String shippingAddress,
  }) async {
    late bool isSuccess;
    _profileCreateInProgress = true;
    update();
    final Map<String, String> profileData = {
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'city': city,
      'shippingAddress': shippingAddress,
    };

    final String token = Get.find<OtpVerificationController>().tempToken;
    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.createProfile,
      profileData,
      loginRequired: true,
      tempToken: token,
    );
    _profileCreateInProgress = false;
    update();

    if (response.isSuccess) {
      await AuthController.setAccessToken(token);
      Get.offAll(() => const MainButtomNavBarScreen());
      isSuccess = true;
    } else {
      _errorMessage = 'Profile creation failed!';
      isSuccess = false;
    }
    update();
    return isSuccess;
  }
}
