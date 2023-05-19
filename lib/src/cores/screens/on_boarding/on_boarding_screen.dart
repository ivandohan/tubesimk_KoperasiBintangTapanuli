import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/colors.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/on_boarding_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/welcome/welcome_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              // Ini gambar sama teksnya cok, lupa awokeawokfok.
              pages: obController.pages,
              liquidController: obController.controller,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              enableSideReveal: true,
              onPageChangeCallback: obController.onPageChangeCallback,
            ),
            Positioned(
              bottom: 60,
              child: OutlinedButton(
                onPressed: () => obController.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  onPrimary: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: tDarkColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 20,
              child: TextButton(
                onPressed: () => Get.to(() => const WelcomeScreen()),
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Obx(
              () => Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  activeIndex: obController.currentPage.value,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: Color(0xff272727),
                    dotHeight: 5.0
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
