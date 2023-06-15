import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCarScreen extends StatelessWidget {
  EditCarScreen({super.key});

  var listName = [
    "111",
    "222",
    "333",
    "444",
    "555",
    "666",
    "777",
    "888",
    "999",
    "199",
    "288",
    "377",
    "466",
    "505",
    "121",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                Icon(Icons.edit, size: 15,),
                Text(" untuk edit data, dan"),
                Icon(Icons.delete_forever, size: 15,),
                Text("untuk hapus data.")
              ],
            ),
          ),
          const SizedBox(height: 20,),
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
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(listName[index]),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        const SizedBox(width: 5,),
                        IconButton(onPressed: () {
                          showModalDelete(context);
                        }, icon: Icon(Icons.delete_forever)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  showModalDelete(context) {
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
                "Anda yakin ingin menghapus data mobil ini?",
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
                      child: Text("Yakin dan Hapus"),
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
