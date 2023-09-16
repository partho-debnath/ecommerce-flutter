import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int currentSelectedIndex = 0;

  void changeScreen(int index) {
    currentSelectedIndex = index;
    update();
  }

  void goToHomeScreen() {
    currentSelectedIndex = 0;
    update();
  }
}
