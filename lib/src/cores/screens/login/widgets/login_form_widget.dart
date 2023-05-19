import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/auth_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var emailC = TextEditingController();
    var pwC = TextEditingController();

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailC,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: "Email",
              hintText: "contoh@contoh",
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.key),
              labelText: "Password",
              hintText: "Masukkan Password",
              suffixIcon: IconButton(
                onPressed: null,
                icon: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                AuthController.instance.login(emailC.text, pwC.text);
              },
              child: const Text("Lupa password?"),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const DashboardScreen()),
              child: const Text("MASUK"),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
        ],
      ),
    );
  }


}


