import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/sign_up_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/field_validator.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/user_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/forget_pw/otp/otp_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({
    super.key,
  });

  final formKey = GlobalKey<FormState>();

  var emailC = TextEditingController();
  var pwC = TextEditingController();
  var cpwC = TextEditingController();
  var nameC = TextEditingController();

  var sc = Get.put(SignUpController());
  var fV = Get.put(FieldValidator());

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameC,
              validator: (value) {
                FieldValidator.instance.nameFieldValidator(value!);
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Nama lengkap",
                  hintText: "Nama lengkap atau sapaan kerap anda"),
            ),
            const SizedBox(
              height: tDefaultSize - 20,
            ),
            TextFormField(
              controller: emailC,
              validator: (value) => FieldValidator.instance.emailFieldValidator(value!),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  hintText: "contoh@contoh.com"),
            ),
            const SizedBox(
              height: tDefaultSize - 20,
            ),
            TextFormField(
              controller: pwC,
              validator: (value) => FieldValidator.instance.passwordFieldValidator(value!),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  labelText: "Password",
                  hintText: "Masukkan password anda"),
            ),
            const SizedBox(
              height: tDefaultSize - 20,
            ),
            TextFormField(
            validator: (value) => FieldValidator.instance.confirmPasswordFieldValidator(value!, pwC.text),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  labelText: "Konfirmasi password",
                  hintText: "Ketik ulang password anda"),
            ),
            const SizedBox(
              height: tDefaultSize - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    showModal(context);
                  }
                  // var verId = await sc.registerWithPhone(user, context);
                  // Get.to(() => OTPScreen(verId: verId));
                },
                child: const Text("Daftar sekarang"),
              ),
            ),
            const SizedBox(
              height: tDefaultSize - 10,
            ),
          ],
        ),
      ),
    );
  }

  void showModal(context) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Konfirmasi kembali",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 25,),
                Text(
                  "Lanjut registrasi akun?",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45,),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: Text("Tidak"),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final user = UserModel(
                              name: nameC.text,
                              email: emailC.text,
                              password: pwC.text,
                              isOnTrip: false,
                              status: "user"
                          );
                          sc.registerUser(user);
                        },
                        child: Text("Lanjut"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}
