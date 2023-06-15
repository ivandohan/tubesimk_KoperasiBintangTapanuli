import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCostScreen extends StatefulWidget {
  AddCostScreen({super.key});

  @override
  State<AddCostScreen> createState() => _AddCostScreenState();
}

class _AddCostScreenState extends State<AddCostScreen> {
  var listName = [
    "Pilih Loket",
    "Loket KBT Medan",
    "Loket KBT Siantar",
    "Loket KBT Tebing",
    "Loket KBT Parapat",
    "Loket KBT Porsea",
    "Loket KBT Tarutung",
  ];

  var selectedFirst = "Pilih Loket";

  var selectedSecond = "Pilih Loket";

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Text(
            "Loket Awal",
            style: txtTheme.headline6,
          ),
          const SizedBox(height: 5,),
          DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
            ),
            validator: (value) => value == null ? "Pilih Loket" : null,
            value: selectedFirst,
            onChanged: (String? newValue) {
              setState(() {
                selectedFirst = newValue!;
              });
            },
            items: listName.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
          ),
          const SizedBox(height: 10,),
          Text(
            "Loket Tujuan",
            style: txtTheme.headline6,
          ),
          const SizedBox(height: 5,),
          DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
            ),
            validator: (value) => value == null ? "Pilih Loket" : null,
            value: selectedSecond,
            onChanged: (String? newValue) {
              setState(() {
                selectedSecond = newValue!;
              });
            },
            items: listName.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
          ),
          const SizedBox(height: 20,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.1),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Text(
                  "Tarif saat ini",
                  style: txtTheme.headline6,
                ),
                const SizedBox(height: 10,),
                if(selectedFirst == "Pilih Loket" && selectedSecond == "Pilih Loket")
                Text(
                  "Pilih loket untuk melihat tarif."
                ),
                if(selectedFirst != "Pilih Loket" && selectedSecond != "Pilih Loket")
                  Text("Rp110000"),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.textsms),
                labelText: "Nominal Baru",
                hintText: "Rupiah..."
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
