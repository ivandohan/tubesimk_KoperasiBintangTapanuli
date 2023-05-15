import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20,
            ),
            onPressed: () {},
            label: const Text("Masuk dengan akun Google"),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: "Belum punya akun?",
              style: Theme.of(context).textTheme.bodyText1,
              children: const [
                TextSpan(
                  text: " Klik untuk mendaftar.",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}