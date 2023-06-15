import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_trip/widgets/available_car_table.dart';

class AvailableCarScreen extends StatefulWidget {
  const AvailableCarScreen({super.key});

  @override
  State<AvailableCarScreen> createState() => _AvailableCarScreenState();
}

class _AvailableCarScreenState extends State<AvailableCarScreen> {
  var driverReady;

  var _arrC = [TextEditingController()];
  var _rdyC = [TextEditingController()];

  bool isOpenCarArr = false;
  bool isOpenCarRdy = false;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json_files/available_car.json');

    final data = await jsonDecode(response);

    setState(() {
      driverReady = data["ready"];
      print("driverReady ========================= $driverReady");
    });
  }

  var counter = 1;
  var counter2 = 1;

  @override
  void initState() {
    readJson().whenComplete(() {
      () {};
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;

    final snackBar = SnackBar(content: Text('Berhasil disimpan!'));

    return SafeArea(
      child: Scaffold(
        appBar: AdminDashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mobil Tersedia",
                  style: txtTheme.headline3,
                ),
                Text(
                  "Mobil yang tersedia di loket anda saat ini.",
                  style: txtTheme.bodyText2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModal(context, {
                            "car": driverReady["reguler"],
                            "title": "Reguler"
                          });
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reguler",
                              ),
                              Icon(Icons.remove_red_eye),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModal(context, {
                            "car": driverReady["eksekutif"],
                            "title": "Eksekutif"
                          });
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Eksekutif",
                              ),
                              Icon(Icons.remove_red_eye),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModal(context,
                              {"car": driverReady["paket"], "title": "Paket"});
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Paket",
                              ),
                              Icon(Icons.remove_red_eye),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Laporan Mobil",
                  style: txtTheme.headline3,
                ),
                Text(
                  "Laporkan mobil yang sudah siap untuk berangkat dan yang baru saja tiba di loket saat ini.",
                  style: txtTheme.bodyText2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if(counter < 1) {
                              counter = 1;
                              _arrC.add(TextEditingController());
                            }
                            isOpenCarArr = true;
                            isOpenCarRdy = false;
                          });
                        },
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Text(
                              "Mobil Baru Tiba",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if(counter2 < 1) {
                              counter2 = 1;
                              _rdyC.add(TextEditingController());
                            }
                            isOpenCarArr = false;
                            isOpenCarRdy = true;
                          });
                        },
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Text(
                              "Mobil Siap Berangkat",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25,),

                if(isOpenCarArr)
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tambah Mobil",
                      style: txtTheme.headline3,
                    ),
                    Text(
                      "Mobil yang baru saja sampai.",
                      style: txtTheme.bodyText2,
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: counter,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: TextFormField(
                              controller: _arrC[index],
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.confirmation_number_outlined),
                                  hintText: "Nomor mobil",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          );
                        },
                      ),

                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                counter--;
                                if(counter < 1) {
                                  isOpenCarArr = false;
                                }
                                _arrC.removeAt(_arrC.length - 1);
                              });
                            },
                            child: Icon(Icons.remove, size: 15,),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                counter++;
                                _arrC.add(TextEditingController());
                              });
                            },
                            child: Text("Baris Baru"),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: OutlinedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            child: Icon(Icons.save_outlined),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                if(isOpenCarRdy)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tambah Mobil",
                        style: txtTheme.headline3,
                      ),
                      Text(
                        "Mobil yang siap untuk berangkat.",
                        style: txtTheme.bodyText2,
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: counter2,
                          itemBuilder: (_, index) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: TextFormField(
                                controller: _rdyC[index],
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.confirmation_number_outlined),
                                    hintText: "Nomor mobil",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            );
                          },
                        ),

                      ),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  counter2--;
                                  if(counter2 < 1) {
                                    isOpenCarRdy = false;
                                  }
                                  _rdyC.removeAt(_rdyC.length - 1);
                                });
                              },
                              child: Icon(Icons.remove, size: 15,),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  counter2++;
                                  _rdyC.add(TextEditingController());
                                });
                              },
                              child: Text("Baris Baru"),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: OutlinedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                              child: Icon(Icons.save_outlined),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text("Kembali"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void showModal(context, data) {
    var txtTheme = Theme.of(context).textTheme;
    var count = 1;

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    data["title"],
                    style: txtTheme.headline2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        AvailableCarTable(
                          data: data,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Get.back(),
                                child: Text("Kembali"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
