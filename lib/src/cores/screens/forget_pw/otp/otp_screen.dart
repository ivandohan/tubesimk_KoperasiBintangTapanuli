import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.verId});

  final String verId;

  @override
  Widget build(BuildContext context) {
    String smsCode = "";
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tOtpTitle,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                ),
              ),
              Text(
                tOtpSubTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                tOtpMessage,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  smsCode = code;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    AuthFactory.instance.verifyOTP(verId, smsCode);
                  },
                  child: const Text("Lanjut"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
