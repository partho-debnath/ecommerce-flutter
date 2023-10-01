import 'package:get/get.dart';

import '../presentation/state_holders/category_controller.dart';
import '../presentation/state_holders/complete_profile_controller.dart';
import '../presentation/state_holders/email_verification_controller.dart';
import '../presentation/state_holders/main_bottom_nav_controller.dart';
import '../presentation/state_holders/otp_verification_controller.dart';
import '../presentation/state_holders/product_controller.dart';
import '../presentation/state_holders/product_slider_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(CompleteProfileController());
    Get.put(ProductSliderController());
    Get.put(CategoryController());
    Get.put(ProductController());
  }
}
