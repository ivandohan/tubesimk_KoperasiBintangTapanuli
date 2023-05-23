import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/colors.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/station_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/location_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/order_process_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/widgets/order_form_appbar.dart';

class OrderFormScreen extends StatefulWidget {
  OrderFormScreen({super.key});

  var args = Get.arguments;

  @override
  State<OrderFormScreen> createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  DateTime _date = DateTime.now();
  late String formatted = DateFormat("EEEE, d MMMM yyyy").format(_date);

  String result = "";
  late var selectedLocation = widget.args["location"];
  late String selectedService =
      widget.args["service"] != "" ? widget.args["service"] : "Penumpang";
  String selectedStation = "Loket KBT Medan";
  String selectedNearStation = "Loket KBT Siantar";
  String selectedPayment = "Dana";

  final List paymentList = ["Dana", "Ovo", "BNI", "BCA"];
  final List serviceList = ["Penumpang", "Barang Bagasi", "Titip Berkas"];

  final List stationList = [
    "Loket KBT Medan",
    "Loket KBT Siantar",
    "Loket KBT Porsea",
    "Loket KBT Siborong-borong"
  ];

  final List classList = [
    "Eksekutif",
    "Reguler",
  ];

  var selectedClass = "Eksekutif";

  final TextEditingController _locationC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final stC = Get.put(StationController());

  int stage = 0;
  int count = 1;



  @override
  void initState(){
    print("STTTTTTTTAAAAAAAAAAAAAADDDDDDDDDDDDD");
    super.initState();
  }

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
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    var screenSize = MediaQuery.of(context).size;

    var paymentProcessArguments = {
      "date": formatted,
      "station": selectedStation,
      "stationNearby": selectedNearStation,
      "location": selectedLocation,
      "cost": (count * 100000).toString(),
      "payment": selectedPayment,
      "service": selectedService,
      "phone": _phoneC.text,
      "class": selectedClass,
    };

    print("ARRRRRRRRRRRRRRRGGGGGGGGGGGSSSSSSSSSSS : ${widget.args["service"]}");

    var screenStage = [
      firstStage(txtTheme, screenSize, context),
      secondStage(txtTheme, screenSize, context),
      thirdStage(txtTheme, screenSize, context, paymentProcessArguments),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: const OrderAppBar(
          icon: Icons.next_plan,
          title: "Atur Jadwal dan Tanggal",
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: screenStage[stage],
          ),
        ),
      ),
    );
  }

  firstStage(TextTheme txtTheme, Size screenSize, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: tCardBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Informasi Dasar",
                style: txtTheme.headline1,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "No. Telp",
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
              controller: _phoneC,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: "No. Telp anda",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Tanggal
          Text(
            "Tanggal",
            style: txtTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          PickDateMethod(screenSize),

          const SizedBox(
            height: 20,
          ),
          Text(
            "Jenis Layanan",
            style: txtTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          PickServiceMethod(),

          // Tombol Konfirmasi
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  stage++;
                });
              },
              child: const Text("Lanjut"),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  secondStage(TextTheme txtTheme, Size screenSize, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: tCardBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Spesifik",
                style: txtTheme.headline1,
              ),
            ),
          ),

          if(selectedService == "Penumpang")
          // Tujuan
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Alamat Tujuan",
                style: txtTheme.headline3,
              ),
              const SizedBox(
                height: 10,
              ),
              PickLocationMethod(screenSize, context),
              const SizedBox(
                height: 5,
              ),
              (selectedLocation != "")
                  ? Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Text(
                  (widget.args["location"] != "")
                      ? widget.args["location"]
                      : selectedLocation,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
                  : Container(),
            ],
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
            "Loket Tujuan ${(selectedService == "Penumpang" ? "(Terdekat)" : "")}",
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
            "Jumlah Penumpang",
            style: txtTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          PeopleCount(screenSize),

          const SizedBox(
            height: 20,
          ),
          Text(
            "Kelas Mobil",
            style: txtTheme.headline3,
          ),
          const SizedBox(height: 10,),
          PickCarClass(),

          // Tombol Konfirmasi
          const SizedBox(
            height: 20,
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
                      setState(() {
                        stage--;
                      });
                    },
                    child: const Text("Sebelumnya"),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stage++;
                      });
                    },
                    child: const Text("Lanjut"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  thirdStage(TextTheme txtTheme, Size screenSize, BuildContext context, args) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: tCardBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Pembayaran",
                style: txtTheme.headline1,
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: Text(
                "Ini halaman terakhir dari konfirmasi kamu. Pastikan"
                    " seluruh data sudah benar sebelum melanjutkannya. "
                    "Anda bisa mengecek kembali pilihan anda dengan menekan tombol"
                    " sebelumnya.",
                style: txtTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Metode Pembayaran",
            style: txtTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          PickPaymentMethod(),
          // Jumlah Penumpang


          const SizedBox(height: 20,),
          Text(
            "Total Bayar",
            style: txtTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            width: screenSize.width * 0.85,
            height: 40,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Rp${(count * 100000).toString()}",
              ),
            ),
          ),


          // Tombol Konfirmasi
          const SizedBox(
            height: 20,
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
                      setState(() {
                        stage--;
                      });
                    },
                    child: const Text("Sebelumnya"),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 250,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  "Konfirmasi kembali",
                                  style: txtTheme.headline4,
                                ),
                                const SizedBox(height: 25,),
                                Text(
                                  "Pastikan kembali semua data-data yang kamu"
                                      " masukkan sudah tepat untuk melanjutkan proses. "
                                      "Lanjutkan proses?",
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
                                        onPressed: () => Get.to(() => OrderProcessScreen(), arguments: args),
                                        child: Text("Proses"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                      );
                    },
                    child: const Text("Bayar"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  PickServiceMethod() {
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
          value: selectedService,
          onChanged: widget.args["service"] != ""
              ? null
              : (value) {
                  setState(() {
                    selectedService = value!;
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

  PickCarClass() {
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
          value: selectedClass,
          onChanged: (value){
            setState(() {
              selectedClass = value!;
            });
          },
          items: classList
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

  PickPaymentMethod() {
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
          value: selectedPayment,
          onChanged: (value) {
            setState(() {
              selectedPayment = value!;
            });
          },
          items: paymentList
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

  PickLocationMethod(Size screenSize, BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          width: screenSize.width * 0.84,
          height: 40,
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _locationC,
              textInputAction: TextInputAction.search,
              autofocus: false,
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search_sharp, color: Colors.black),
                hintText: "Cari lokasi",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            suggestionsCallback: (pattern) async {
              return await Get.find<LocationFactory>()
                  .searchLocation(context, pattern);
            },
            itemBuilder: (_, Prediction suggestion) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Icon(Icons.location_on),
                  Expanded(
                    child: Text(
                      suggestion.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ]),
              );
            },
            onSuggestionSelected: (Prediction suggestion) {
              setState(() {
                selectedLocation = suggestion.description!;
              });
            },
          ),
        ),
      ],
    );
  }

  PeopleCount(Size screenSize) {
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
        (selectedService == "Penumpang") ?
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
        )
        : Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
          ),
          width: screenSize.width * 0.32,
          height: 40,
          child: const Icon(Icons.disabled_by_default_outlined),
        ),
      ],
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
