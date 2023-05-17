import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/dashboard/dashboard.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future animateIn(context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;

    await Future.delayed(const Duration(milliseconds: 2000));
    Get.to(() => const Dashboard());
    // Get.to(OnBoardingScreen());
  }

  Future animateOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}