import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/common_widgets/fade_in_animation/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animateIn(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1600,
              animatePosition: const TAnimatePosition(
                topAfter: 0, topBefore: -30, leftAfter: 0, leftBefore: -30,
              ),
              child: const Image(image: AssetImage(tSplashTopIcon), width: 100, height: 100,),
            ),
            TFadeInAnimation(
              durationInMs: 2000,
              animatePosition: const TAnimatePosition(
                topAfter: 80, topBefore: 80, leftAfter: tDefaultSize, leftBefore: -80,
              ),
              child: Column(
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    tAppTagLine,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2400,
              animatePosition: const TAnimatePosition(
                bottomBefore: 0, bottomAfter: 100,
              ),
              child: const Image(
                image: AssetImage(tSplashImage),
                width: 400,
                height: 400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
