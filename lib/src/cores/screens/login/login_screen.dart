import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/common_widgets/form/form_footer_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/common_widgets/form/form_header_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/signup/signup_screen.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                LoginForm(),
                // FormFooterWidget(
                //   buttonLabel: "Masuk dengan akun Google",
                //   textSpan1: "Belum punya akun? ",
                //   textSpan2: "Klik untuk mendaftar.",
                //   onPressed: () => Get.to(() => const SignUpScreen()),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
