import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var showSecondNavBar = false.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    if (showSecondNavBar.value) {
      showSecondNavBar.value = false;
    }
  }

  void toggleSecondNav() {
    showSecondNavBar.value = !showSecondNavBar.value;
  }
}
