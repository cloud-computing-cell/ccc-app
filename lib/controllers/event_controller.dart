import 'package:get/get.dart';

class EventController extends GetxController {
  var myCurrentIndex = 0.obs;

  var expandedList = List<bool>.generate(5, (index) => false).obs;

  void toggleExpansion(int index) {
    expandedList[index] = !expandedList[index];
  }
}
