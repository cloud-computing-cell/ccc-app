import 'package:ccc_app/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ccc_app/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: const SizedBox.shrink()),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller.colorController,
            builder: (_, __) => Container(
              color: controller.backgroundColor.value,
            ),
          ),
          Obx(() {
            if (!controller.isSplashCompleted.value) return const SizedBox.shrink();
            return Stack(
              children: [
                AnimatedBuilder(
                  animation: controller.gradientController1,
                  builder: (_, __) => Opacity(
                    opacity: controller.gradientOpacity.value,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.splashg1.withOpacity(0.4), AppColors.splashg2],
                          begin: controller.gradientBegin1.value,
                          end: controller.gradientEnd1.value,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: controller.gradientController2,
                  builder: (_, __) => Opacity(
                    opacity: controller.gradientOpacity.value,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.splashg1.withOpacity(0.4), AppColors.splashg2],
                          begin: controller.gradientBegin2.value,
                          end: controller.gradientEnd2.value,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => AnimatedOpacity(
                            duration: const Duration(milliseconds: 100),
                            opacity: controller.showLogo.value ? 1.0 : 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Image.asset(
                                'assets/images/ccclogo.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                          )),
                      ScaleTransition(
                        scale: controller.textZoomAnimation,
                        child: const Text(
                          "CLOUD COMPUTING\nCELL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
