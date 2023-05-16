import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                  labelText: "No. Telp",
                  hintText: "08123..."
              ),
            ),
            const SizedBox(height: tDefaultSize - 20,),
            TextFormField(
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
                onPressed: (){},
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