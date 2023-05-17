import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/dashboard/dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/forget_pw/options/forgot_pw_model_bottom_sheet.dart';
import '../../../../../constants/sizes.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: "No. Telp",
              hintText: "08123....",
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.key),
              labelText: "PIN",
              hintText: "4 digit angka",
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
                ForgetPasswordScreen.buildShowModalBottomSheet(context);
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


