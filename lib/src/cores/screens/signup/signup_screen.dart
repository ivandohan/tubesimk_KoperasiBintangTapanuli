import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/common_widgets/form/form_footer_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/common_widgets/form/form_header_widget.dart';
import 'widgets/sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tRegisterTitle,
                  subTitle: tRegisterSubTitle,
                ),
                SignUpFormWidget(),
                FormFooterWidget(
                  buttonLabel: "Daftar dengan akun google",
                  textSpan1: "Sudah punya akun? ",
                  textSpan2: "Klik untuk masuk.",
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

