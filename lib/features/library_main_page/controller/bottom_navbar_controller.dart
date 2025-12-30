import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  static BottomNavBarController get to => Get.find<BottomNavBarController>();
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
