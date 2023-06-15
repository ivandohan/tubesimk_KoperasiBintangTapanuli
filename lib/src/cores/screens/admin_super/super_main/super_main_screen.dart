import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/acc_management/acc_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/super_menus_screen.dart';

class SuperMainScreen extends StatelessWidget {
  SuperMainScreen({super.key});

  var actList = [
    "Admin <Susi Putri> menyelesaikan satu keluhan pengguna.",
    "Super Admin <Angga Putra> menambahkan akun baru untuk Admin.",
    "Super Admin <Angga Putra> mengubah tarif layanan Medan - Tarutung.",
    "Super Admin <Angga Putra> menambah supir baru bernama Maiki Salamun."
  ];

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Horas, admin Angga Putra!",
              style: txtTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Selamat beraktivitas!",
              style: txtTheme.headline2,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "Menu",
              style: txtTheme.headline4,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.to(() => AccManagementScreen()),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.person),
                              Text(
                                "Keanggotaan"
                              ),
                            ],
                          ),
                        ),
                    ),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 155,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.document_scanner),
                              Text("Laporan")
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.to(() => SuperMenusScreen()),
                          child: Container(
                            width: 155,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.more_horiz),
                                Text("Menu Lainnya"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Aktivitas Terbaru",
              style: txtTheme.headline4,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 285,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: actList.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(actList[index]),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
