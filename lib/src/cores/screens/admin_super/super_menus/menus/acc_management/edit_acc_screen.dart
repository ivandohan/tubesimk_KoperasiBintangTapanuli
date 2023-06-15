import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccScreen extends StatefulWidget {
  EditAccScreen({super.key});

  @override
  State<EditAccScreen> createState() => _EditAccScreenState();
}

class _EditAccScreenState extends State<EditAccScreen> {
  var listName = [
    "Angga Putra",
    "Budi Sihombing",
    "Susi Putri",
    "Marcel Samuel",
    "Simon",
    "Harry Sembiring",
    "Alexandra",
    "Daniela Situmeang",
  ];

  var nameC = TextEditingController();
  var locC = TextEditingController();
  var hpC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.edit,
                    size: 15,
                  ),
                  Text(" untuk edit data, dan"),
                  Icon(
                    Icons.delete_forever,
                    size: 15,
                  ),
                  Text("untuk hapus akun.")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listName.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                      color: (index == 0)
                          ? Colors.green.withOpacity(0.2)
                          : Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(listName[index]),
                      if (index == 0) Text("Akun anda"),
                      if (index != 0)
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showModalEdit(
                                      context, listName[index], index);
                                },
                                icon: Icon(Icons.edit)),
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                                onPressed: () {
                                  showModalDelete(context, index);
                                },
                                icon: Icon(Icons.delete_forever)),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  showModalDelete(context, index) {
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
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Anda yakin ingin menghapus akun ini?",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: Text("Kembali"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            listName.removeAt(index);
                          });
                          Get.back();
                        },
                        child: Text("Yakin dan Hapus"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  showModalEdit(context, name, index) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 350,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Edit",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: nameC,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: "Nama baru",
                      hintText: "Masukkan nama baru..."),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: hpC,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                      labelText: "No. HP baru",
                      hintText: "Masukkan lokasi baru..."),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: locC,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                      labelText: "Lokasi Baru",
                      hintText: "Masukkan lokasi baru..."),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: Text("Kembali"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            listName[index] = nameC.text;
                          });
                        },
                        child: Text("Simpan"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
