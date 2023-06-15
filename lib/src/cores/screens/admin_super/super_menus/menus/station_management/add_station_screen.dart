import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStationScreen extends StatelessWidget {
  AddStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
                labelText: "Nama loket",
                hintText: "Masukkan nama loket..."
            ),
          ),
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              labelText: "Kepala Loket",
              hintText: "Masukkan nama pimpinan..."
            ),
          ),
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_on),
              labelText: "Alamat Loket",
              hintText: "Masukkan alamat..."
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                showModalConfirm(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.save),
                  SizedBox(width: 10,),
                  Text("Simpan")
                ],
              ),
          ),
        ],
      ),
    );
  }

  showModalConfirm(context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 250,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Konfirmasi",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 25,),
              Text(
                "Dengan ini anda yakin menambahkan 1 loket baru untuk beroperasi?",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 45,),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: Text("Kembali"),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Text("Yakin dan Simpan"),
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
