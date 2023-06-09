import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/colors.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/common_widgets/fade_in_animation/animation_design.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/common_widgets/fade_in_animation/splash_screen_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/login/login_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/signup/signup_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/splash_controller/splash_initial_route_controller.dart';


class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final controller = Get.put(FadeInAnimationController());
    controller.animateOut();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1200,
              animatePosition: const TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                leftAfter: 0,
                leftBefore: 0,
                topAfter: 0,
                topBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
              ),
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: 'welcome-image-tag',
                      child: Image(
                        image: const AssetImage(tWelcomeScreenImage),
                        height: size.height * 0.6,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          tWelcomeTitle,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 45,
                          width: 50,
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: const Icon(Icons.login, size: 17,),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => DashboardScreen(), arguments: args),
                            child: const Text("Pesan Sekarang"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
