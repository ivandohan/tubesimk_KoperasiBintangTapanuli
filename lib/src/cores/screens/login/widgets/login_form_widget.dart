import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/login_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/field_validator.dart';


class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var ec = TextEditingController();
    var pc = TextEditingController();

    var lc = Get.put(LoginController());


    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            validator: (value) {
              FieldValidator.instance.emailFieldValidator(value!);
            },
            controller: ec,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: "Email",
              hintText: "contoh@contoh",
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            validator: (value) {
              FieldValidator.instance.passwordFieldValidator(value!);
            },
            controller: pc,
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
                AuthFactory.instance.login(ec.text, pc.text);
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
              onPressed: () async {
                lc.loginUser(ec.text, pc.text);
              },
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


