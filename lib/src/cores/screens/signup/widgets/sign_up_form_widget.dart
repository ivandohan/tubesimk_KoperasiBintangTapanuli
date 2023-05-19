import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/auth_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var emailC = TextEditingController();
    var pwC = TextEditingController();

    return SizedBox(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                  labelText: "Nama lengkap",
                  hintText: "Nama lengkap atau sapaan kerap anda"
              ),
            ),
            const SizedBox(height: tDefaultSize - 20,),
            TextFormField(
              controller: emailC,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                  labelText: "Email",
                  hintText: "contoh@contoh.com"
              ),
            ),
            const SizedBox(height: tDefaultSize - 20,),
            TextFormField(
              controller: pwC,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                  labelText: "PIN",
                  hintText: "4 digit angka"
              ),
            ),
            const SizedBox(height: tDefaultSize - 20,),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                  labelText: "Konfirmasi PIN",
                  hintText: "Konfirmasi ulang PIN"
              ),
            ),
            const SizedBox(height: tDefaultSize - 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  AuthController.instance.register(emailC.text, pwC.text);
                },
                child: const Text("Daftar sekarang"),
              ),
            ),
            const SizedBox(height: tDefaultSize - 10,),
          ],
        ),
      ),
    );
  }
}