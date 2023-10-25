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
    required String cusName,
    required String cusAdd,
    required String cusCity,
    required String cusState,
    required String cusPostcode,
    required String cusCountry,
    required String cusPhone,
    required String cusFax,
    required String shipName,
    required String shipAdd,
    required String shipCity,
    required String shipState,
    required String shipPostcode,
    required String shipCountry,
    required String shipPhone,
  }) async {
    late bool isSuccess;
    _profileCreateInProgress = true;
    update();
    final Map<String, String> profileData = {
      'cus_name': cusName,
      'cus_add': cusAdd,
      'cus_city': cusCity,
      'cus_state': cusState,
      'cus_postcode': cusPostcode,
      'cus_country': cusCountry,
      'cus_phone': cusPhone,
      'cus_fax': cusFax,
      'ship_name': shipName,
      'ship_add': shipAdd,
      'ship_city': shipCity,
      'ship_state': shipState,
      'ship_postcode': shipPostcode,
      'ship_country': shipCountry,
      'ship_phone': shipPhone,
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
