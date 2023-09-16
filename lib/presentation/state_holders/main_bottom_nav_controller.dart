import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int currentSelectedIndex = 0;

  void changeScreen(int index) {
    currentSelectedIndex = index;
    update();
  }

  void backToHomeScreen() {
    currentSelectedIndex = 0;
    update();
  }
}
