import 'package:ccc_app/components/custom_nav/customnav.dart';
import 'package:ccc_app/constants/colors.dart';
import 'package:ccc_app/controllers/navigation_controller.dart';
import 'package:ccc_app/controllers/navigation_controllers.dart';
import 'package:ccc_app/services/splash/splash_services.dart';
import 'package:ccc_app/views/explore_button/connectus.dart';
import 'package:ccc_app/views/explore_button/domain.dart';
import 'package:ccc_app/views/explore_button/project_screen.dart';
import 'package:ccc_app/views/explore_button/register.dart';
import 'package:ccc_app/views/screens/event.dart';
import 'package:ccc_app/views/screens/home_screen.dart';
import 'package:ccc_app/views/screens/quiz.dart';
import 'package:ccc_app/views/screens/team.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(NavigationController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:     Home(),
    ),
  );
}
//alok

class Main extends StatelessWidget {
  Main({super.key});

  final NavigationControllers navController = Get.put(NavigationControllers());

  final List<Widget> screens = [
    Home(),
    MyEventPage(),
    Team(),
    Quiz(),
    Project(),
    Connectus(),
    Register(),
    Domain(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
        body: Obx(() => screens[navController.currentIndex.value]),
        bottomNavigationBar: Customnav(
          onItemSelected: (index) {
            navController.changeIndex(index);
          },
        ),
      ),
    );
  }
}