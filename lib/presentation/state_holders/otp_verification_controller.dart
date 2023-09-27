import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';
import './auth_controller.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _message = '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;
  String get message => _message;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInProgress = false;
    update();

    if (response.isSuccess) {
      await AuthController.setAccessToken(response.responseJson!['data']);
      return true;
    } else {
      _message = 'OTP verification failed!';
      update();
      return false;
    }
  }
}
