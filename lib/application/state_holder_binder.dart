import 'package:get/get.dart';

import '../presentation/state_holders/main_bottom_nav_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}
