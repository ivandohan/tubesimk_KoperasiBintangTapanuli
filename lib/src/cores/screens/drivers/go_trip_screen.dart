import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/car_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/user_profile_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/car_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/drivers/driver_dashboard_appbar_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/drivers/driver_dashboard_screen.dart';

class GoingTripScreen extends StatefulWidget {
  const GoingTripScreen({super.key});

  @override
  State<GoingTripScreen> createState() => _GoingTripScreenState();
}

class _GoingTripScreenState extends State<GoingTripScreen> {
  final List stationList = [
    "Loket KBT Medan",
    "Loket KBT Siantar",
    "Loket KBT Porsea",
    "Loket KBT Siborong-borong"
  ];
  String selectedStation = "Loket KBT Medan";
  String selectedNearStation = "Loket KBT Siantar";

  DateTime _date = DateTime.now();
  late String formatted = DateFormat("EEEE, d MMMM yyyy").format(_date);

  var stationList2;

  var user;

  int count = 12;
  final TextEditingController _carNum = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          _date = value;
          formatted = DateFormat("EEEE, d MMMM yyyy").format(_date);
        });
      }
    });
  }

  @override
  void initState() {
    final uC = Get.put(UserProfileController());
    uC.getUserData().then((value) {
      setState(() {
        user = value;
      });
    });
    super.initState();
  }

  void save() async {
    final cC = Get.put(CarController());

    CarModel cm = CarModel(
      driverName: user.name,
      id: _carNum.text,
      isAvailable: true,
      isOntrip: false,
      status: "Normal",
      date: formatted,
      destination: selectedNearStation,
      initial: selectedStation,
      isWaiting: true,
      availableCount: count,
    );

    await cC.enterQueue(cm).whenComplete(() {
      Get.offAll(() => DriverDashboardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: DriverDashboardAppbarWidget(
          title: "Berangkat",
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal Berangkat",
                        style: txtTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PickDateMethod(screenSize),

                      const SizedBox(height: 20,),
                      Text(
                        "Nomor Mobil",
                        style: txtTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: TextFormField(
                          controller: _carNum,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.car_rental_outlined),
                              hintText: "Nomor mobil anda",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Loket Keberangkatan",
                        style: txtTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PickStationMethod("start"),

                      // Loket Tujuan
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Loket Tujuan",
                        style: txtTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PickStationMethod("nearby"),

                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Jumlah Penumpang Tersisa",
                        style: txtTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PeopleCount(),

                      // Tombol Konfirmasi
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  save();
                                },
                                child: const Text("Simpan"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PeopleCount() {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          width: screenSize.width * 0.5,
          height: 40,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              count.toString(),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  count++;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                ),
                width: screenSize.width * 0.15,
                height: 40,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  count--;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                ),
                width: screenSize.width * 0.15,
                height: 40,
                child: const Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ],
    );
  }

  PickStationMethod(String target) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
      ),
      width: double.infinity,
      height: 40,
      child: Center(
        child: DropdownButton<String>(
          isExpanded: true,
          value: target == "start" ? selectedStation : selectedNearStation,
          onChanged: (value) {
            setState(() {
              if (target == "start") {
                selectedStation = value!;
              } else {
                selectedNearStation = value!;
              }
            });
          },
          items: stationList
              .map<DropdownMenuItem<String>>(
                  (value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
              .toList(),

          // add extra sugar..
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 20,
          underline: SizedBox(),
        ),
      ),
    );
  }

  PickDateMethod(Size screenSize) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          width: screenSize.width * 0.67,
          height: 40,
          child: Text(
            formatted,
            // _date.toString(),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            _showDatePicker();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            width: screenSize.width * 0.15,
            height: 40,
            child: const Icon(Icons.calendar_month_sharp),
          ),
        ),
      ],
    );
  }
}
