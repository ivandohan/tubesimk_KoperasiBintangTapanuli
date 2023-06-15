import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/login_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/field_validator.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_dashboard/super_dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_appbar.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final snackBarFailure =
        SnackBar(content: Text('Nomor HP atau PIN tidak sesuai.'));
    final snackBarSuccess = SnackBar(content: Text('Login berhasil.'));
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
              prefixIcon: Icon(Icons.phone),
              labelText: "Nomor HP",
              hintText: "Nomor handphone kamu",
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
          const SizedBox(
            height: tFormHeight - 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (pc.text == "123456") {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
                  Get.to(() => const AdminDashboardScreen());
                }

                if (pc.text == "290329") {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
                  Get.to(() => const SuperDashboardScreen());
                }

                if (pc.text != "123456" && pc.text != "290329") {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
                }
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
