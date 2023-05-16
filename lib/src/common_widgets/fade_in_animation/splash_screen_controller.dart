import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future animateIn(context) async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;

    await Future.delayed(Duration(milliseconds: 3000));
    animate.value = false;

    await Future.delayed(Duration(milliseconds: 2000));
    Get.to(() => const WelcomeScreen());
    // Get.to(OnBoardingScreen());
  }

  Future animateOut() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
  }
}