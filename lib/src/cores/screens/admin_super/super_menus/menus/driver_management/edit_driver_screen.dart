import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDriverScreen extends StatelessWidget {
  EditDriverScreen({super.key});

  var listName = ["Maiki Salamun", "Doraemon", "Udin", "Andros", "Juan"];

  var driverList = [
    {"nama": "John Smith", "hp": "081212121212", "alamat": "Medan"},
    {"nama": "Jessica Taylor", "hp": "083434343434", "alamat": "Tarutung"},
    {"nama": "Messi Silaban", "hp": "085656565656", "alamat": "Parapat"},
    {
      "nama": "Willie Sianturi",
      "hp": "087878787878",
      "alamat": "Pematang Siantar"
    },
    {
      "nama": "Rafael Panggabean",
      "hp": "089090909090",
      "alamat": "Tebing Tinggi"
    },
    {"nama": "Irfan Nainggolan", "hp": "082323223233", "alamat": "Porsea"},
    {"nama": "Gonzales", "hp": "084545454545", "alamat": "Medan"},
    {"nama": "Crisardi", "hp": "086767776767", "alamat": "Tarutung"},
    {"nama": "Cristian Vieri", "hp": "089898989899", "alamat": "Parapat"},
    {
      "nama": "Kevin Nababan",
      "hp": "081010101010",
      "alamat": "Pematang Siantar"
    },
    {
      "nama": "Charles Simanjuntak",
      "hp": "081313292999",
      "alamat": "Tebing Tinggi"
    },
    {"nama": "Diego Silalahi", "hp": "084236677328", "alamat": "Porsea"},
    {"nama": "Dani Manik", "hp": "084423442662", "alamat": "Medan"},
    {"nama": "Markus Putra", "hp": "088190290002", "alamat": "Tarutung"},
    {"nama": "Sabar Tobing", "hp": "085284539211", "alamat": "Tarutung"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text("untuk hapus data.")
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: driverList.length,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(driverList[index]["nama"].toString()),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              showModalDelete(context);
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
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Anda yakin ingin menghapus data supir ini?",
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
                        onPressed: () => Get.back(),
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
}
