import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {

  final _countC = [TextEditingController()];
  final _compC = [TextEditingController()];
  final _drivC = [TextEditingController()];


  late var selectedService = ["Penumpang"];
  final List serviceList = ["Penumpang", "Barang Bagasi", "Titip Berkas"];

  late var selectedStation = ["Loket KBT Medan"];
  final List stationList = [
    "Loket KBT Medan",
    "Loket KBT Siantar",
    "Loket KBT Porsea",
    "Loket KBT Siborong-borong"
  ];

  var itemCount = 1;

  @override
  Widget build(BuildContext context) {

    var txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save_outlined),
          label: Text("Simpan"),
          backgroundColor: Colors.black,
          onPressed: () {},
        ),
        appBar: AdminDashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: itemCount,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          if(selectedService[index] == "Penumpang" || selectedService[index] == "Barang Bagasi")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(selectedService[index] == "Penumpang")
                                  Text(
                                    "Jumlah Penumpang",
                                    style: txtTheme.headline3,
                                  ),
                                if(selectedService[index] == "Barang Bagasi")
                                  Text(
                                    "Barang Bagasi",
                                    style: txtTheme.headline3,
                                  ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                  child: TextFormField(
                                    controller: _countC[index],
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.tune_outlined),
                                        hintText: "Jumlah",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                              ],
                            ),
                          Text(
                            "Layanan",
                            style: txtTheme.headline3,
                          ),
                          const SizedBox(height: 10,),
                          PickServiceMethod(index),

                          const SizedBox(height: 20,),
                          Text(
                            "Loket Tujuan",
                            style: txtTheme.headline3,
                          ),
                          const SizedBox(height: 10,),
                          PickStationMethod(index),

                          const SizedBox(height: 20,),
                          Text(
                            "Setoran",
                            style: txtTheme.headline3,
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(child: Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: TextFormField(
                                  controller: _compC[index],
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.business_sharp),
                                      hintText: "Direksi",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),),
                              const SizedBox(width: 5,),
                              Expanded(child: Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: TextFormField(
                                  controller: _drivC[index],
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText: "Supir",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
                            itemCount--;
                            selectedService.removeAt(selectedService.length - 1);
                            selectedStation.removeAt(selectedStation.length - 1);
                            _countC.removeAt(_countC.length - 1);
                            _compC.removeAt(_compC.length - 1);
                            _drivC.removeAt(_drivC.length - 1);
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            itemCount++;
                            selectedService.add("Penumpang");
                            selectedStation.add("Loket KBT Medan");
                            _countC.add(TextEditingController());
                            _drivC.add(TextEditingController());
                            _compC.add(TextEditingController());
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 500,),
              ],
            ),
          ),
        ),
      ),
    );
  }


  PickServiceMethod(int index) {
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
          value: selectedService[index].toString(),
          onChanged: (value) {
            setState(() {
              selectedService[index] = value!;
            });
          },
          items: serviceList
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

  PickStationMethod(int index) {
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
          value: selectedStation[index].toString(),
          onChanged: (value) {
            setState(() {
                selectedStation[index] = value!;
            });
          },
          items: stationList.map<DropdownMenuItem<String>>(
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
}