import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAccScreen extends StatelessWidget {
  AddAccScreen({super.key});

  var statusList = [
    "Admin",
    "Super Admin",
  ];

  String selectedStatus = "Admin";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
            ),
            validator: (value) => value == null ? "Select a country" : null,
            value: selectedStatus,
            onChanged: (String? newValue) {},
            items: statusList.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
          ),
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
              labelText: "No. HP",
              hintText: "0812345..."
            ),
          ),
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              labelText: "Nama",
              hintText: "Masukkan nama pengguna..."
            ),
          ),
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_on),
              labelText: "Alamat",
              hintText: "Masukkan alamat..."
            ),
          ),
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                labelText: "PIN",
                hintText: "6 digit angka..."
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
    const snackBar = SnackBar(
      content: Text('Proses Berhasil.'),

    );
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
                "Dengan ini anda yakin menambahkan 1 akun untuk beroperasi dalam sistem aplikasi.",
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
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Get.back();
                      },
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
