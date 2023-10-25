import 'dart:developer';

import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';
import './auth_controller.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _errorMessage = '';
  String _tempToken = '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;
  String get errorMessage => _errorMessage;
  String get tempToken => _tempToken;

  Future<bool> verifyOtp({required String email, required String otp}) async {
    late bool isSuccess;
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInProgress = false;
    update();

    if (response.isSuccess) {
      _tempToken = response.responseJson!['data'];
      isSuccess = true;
    } else {
      _errorMessage = 'OTP verification failed!';
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  Future<bool> readUserProfile() async {
    late bool isSuccess;
    _otpVerificationInProgress = true;
    update();
    log(_tempToken.toString());
    //! why need to wait some seco..
    await Future<void>.delayed(const Duration(seconds: 3));
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.readProfile,
      loginRequired: true,
      tempToken: _tempToken,
    );
    _otpVerificationInProgress = false;
    update();

    if (response.isSuccess) {
      if (response.responseJson!['data'] != null) {
        await AuthController.setAccessToken(_tempToken);
        isSuccess = true;
      } else {
        isSuccess = false;
      }
    } else {
      _errorMessage = 'Failed to get profile data!';
      isSuccess = false;
    }
    update();
    return isSuccess;
  }
}
