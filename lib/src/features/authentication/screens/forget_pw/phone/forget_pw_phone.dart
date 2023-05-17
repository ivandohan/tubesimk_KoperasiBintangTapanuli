import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/common_widgets/form/form_header_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/forget_pw/otp/otp_screen.dart';

class ForgetPwPhoneScreen extends StatelessWidget {
  const ForgetPwPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: tDefaultSize * 4,
                ),
                const FormHeaderWidget(
                  title: tForgetPassword,
                  subTitle: tForgetPwSubTitle2,
                  image: tForgetPwImage,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30,
                  textAlign: TextAlign.center,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "No. Telp",
                          hintText: "Masukkan nomor telepon terdaftar.",
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: tFormHeight,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const OTPScreen());
                          },
                          child: const Text("Lanjut"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
