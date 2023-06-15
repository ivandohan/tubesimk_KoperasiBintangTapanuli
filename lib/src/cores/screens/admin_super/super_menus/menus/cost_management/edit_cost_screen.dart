import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCostScreen extends StatelessWidget {
  EditCostScreen({super.key});

  var listName = [
  {"rute": "Medan - Tebing", "price": 40000},
    {"rute": "Medan - Siantar", "price": 60000},
    {"rute": "Medan - Parapat", "price": 75000},
    {"rute": "Medan - Porsea", "price": 85000},
    {"rute": "Medan - Balige", "price": 95000},
    {"rute": "Medan - Siborong-borong", "price": 100000},
    {"rute": "Medan - Tarutung", "price": 130000},
    {"rute": "Medan - Tebing", "price": 60000},
    {"rute": "Medan - Siantar", "price": 80000},
    {"rute": "Medan - Parapat", "price": 95000},
    {"rute": "Medan - Porsea", "price": 105000},
    {"rute": "Medan - Balige", "price": 115000},
    {"rute": "Medan - Siborong-borong", "price": 120000},
    {"rute": "Medan - Tarutung", "price": 130000},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
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
                      Text(listName[index]["rute"].toString()),
                      Text("Rp${listName[index]["price"].toString()}"),
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
                "Anda yakin ingin menghapus data loket ini?",
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
