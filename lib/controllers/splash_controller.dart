import 'package:ccc_app/constants/colors.dart';
import 'package:ccc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late final AnimationController colorController;
  late Animation<Color?> backgroundColor;

  late final AnimationController gradientController1;
  late final AnimationController gradientController2;

  late Animation<Alignment> gradientBegin1, gradientEnd1;
  late Animation<Alignment> gradientBegin2, gradientEnd2;
  late Animation<double> gradientOpacity;

  late final AnimationController textZoomController;
  late final Animation<double> textZoomAnimation;

  var showLogo = true.obs;
  var isSplashCompleted = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Splash background color animation
    colorController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    backgroundColor = ColorTween(
      begin: AppColors.splashg1.withOpacity(0.4),
      end: AppColors.splashg2,
    ).animate(CurvedAnimation(
      parent: colorController,
      curve: Curves.easeInOut,
    ));

    // Gradient animations
    gradientController1 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    gradientController2 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    gradientBegin1 = TweenSequence<Alignment>([
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.bottomLeft), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.topLeft), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.topRight, end: Alignment.bottomRight), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomCenter), weight: 1),
    ]).animate(CurvedAnimation(parent: gradientController1, curve: Curves.linear));

    gradientEnd1 = AlwaysStoppedAnimation(Alignment.center);

    gradientBegin2 = TweenSequence<Alignment>([
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.topRight, end: Alignment.bottomRight), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.topLeft), weight: 1),
      TweenSequenceItem(tween: AlignmentTween(begin: Alignment.topLeft, end: Alignment.topCenter), weight: 1),
    ]).animate(CurvedAnimation(parent: gradientController2, curve: Curves.linear));

    gradientEnd2 = AlwaysStoppedAnimation(Alignment.center);

    gradientOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 0.0), weight: 1),
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 0.1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 1.0), weight: 0.9),
    ]).animate(CurvedAnimation(parent: gradientController1, curve: Curves.easeInOut));

    // Text Zoom
    textZoomController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    textZoomAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: textZoomController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 2), () {
      isSplashCompleted.value = true;
      textZoomController.forward();
    });

    Future.delayed(const Duration(milliseconds: 2000), () async {
      showLogo.value = false;
      await Future.delayed(const Duration(milliseconds: 300));
      showLogo.value = true;
    });

    Future.delayed(const Duration(seconds: 4), () async {
      showLogo.value = false;
      await Future.delayed(const Duration(milliseconds: 300));
      showLogo.value = true;
    });

    Future.delayed(const Duration(seconds: 5), () {
  Get.off(() => Main()); 
});
  }

  @override
  void onClose() {
    colorController.dispose();
    gradientController1.dispose();
    gradientController2.dispose();
    textZoomController.dispose();
    super.onClose();
  }
}
