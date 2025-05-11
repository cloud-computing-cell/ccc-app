import 'package:ccc_app/components/custom_nav/customnav.dart';
import 'package:ccc_app/constants/colors.dart';
import 'package:ccc_app/controllers/navigation_controller.dart';
import 'package:ccc_app/controllers/navigation_controllers.dart';
import 'package:ccc_app/services/splash/splash_services.dart';
import 'package:ccc_app/views/explore_button/contact_us_screen/contact_us_screen.dart';
import 'package:ccc_app/views/explore_button/domain_screen/domain_screen.dart';
import 'package:ccc_app/views/explore_button/project_screen/project_screen.dart';
import 'package:ccc_app/views/explore_button/registration_screen/register_screen.dart';
import 'package:ccc_app/views/screens/event_screen/event_screen.dart';
import 'package:ccc_app/views/screens/home_screen/home_screen.dart';
import 'package:ccc_app/views/screens/quiz_screen/quiz_screen.dart';
import 'package:ccc_app/views/screens/team_screen/team_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() {
  Get.put(NavigationController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:     SplashScreen(),
    ),
  );
}


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
    RegistrationPage(),
    Domain(),
  ];
//comit
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