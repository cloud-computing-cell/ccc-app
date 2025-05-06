
import 'package:ccc_app/services/apiservices/apiservices.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TeamController extends GetxController {
  var selectedYear = '4th'.obs;
  var team = [].obs;
  var isLoading = true.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeamData();
  }

  void updateYear(String year) {
    selectedYear.value = year;
    fetchTeamData();
  }

  void fetchTeamData() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      List data;
      switch (selectedYear.value) {
        case '4th':
          data = await getTeamDataForFourthYear();
          break;
        case '3rd':
          data = await getTeamDataForThirdYear();
          break;
        case '2nd':
          data = await getTeamDataForSecondYear();
          break;
        default:
          data = await getTeamDataForFourthYear();
      }
      team.value = data;
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
