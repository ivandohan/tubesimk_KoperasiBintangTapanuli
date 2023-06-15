import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/payment_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/user_profile_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/payment_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/customer_care/customer_care_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/widgets/order_form_appbar.dart';
import 'package:lottie/lottie.dart';

class OrderPaymentScreen extends StatefulWidget {
  const OrderPaymentScreen({super.key});

  @override
  State<OrderPaymentScreen> createState() => _OrderPaymentScreenState();
}

class _OrderPaymentScreenState extends State<OrderPaymentScreen> {
  var args = Get.arguments;

  final imgUrl = "https://i.ibb.co/HNbp4n0/tiket.jpg";
  var dio = Dio();

  String path = "";

  bool isSuccess = false;
  final String carNum = '111';
  final String driverName = "John Smith";

  var uCP = Get.put(UserProfileController());
  var pC = Get.put(PaymentController());

  void checkPaymentStatus () {
    var now = DateTime.now();
    // {date: Tuesday, 23 May 2023, station: Loket KBT Medan, stationNearby: Loket KBT Siantar,
    // location: , cost: 100000, payment: Dana, service: Penumpang, phone: }
    final paymentModel = PaymentModel(
      userId: args['userId'],
      va: args["va"],
      userName: args["name"],
      paymentMethod: args["payment"],
      deadline: DateFormat("EEEE, d MMMM yyyy")
          .format(DateTime(now.year, now.month, now.day + 1)),
      cost: args["cost"],
      destination: args["location"] != "" ? args["location"] : "Not set",
      stationDestination: args["stationNearby"],
      firstStation: args["station"],
      carNum: carNum,
      driverName: driverName,
      service: args["service"],
      isComplete: isSuccess,
      paidOn: DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
      phone: args["phone"],
      date: args["date"],
      hour: args["hour"],
    );

    pC.addOrder(paymentModel).whenComplete(() {
      if(isSuccess) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 250,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Pembayaran Diterima",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 25,),
                  Text(
                    "Pembayaran anda sudah kami terima. Terima kasih sudah mempercayakan perjalanan anda"
                        " kepada kami.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 45,),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.offAll(() => DashboardScreen(), arguments: args['userId']),
                          child: Text("Kembali"),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final appStorage = await getApplicationDocumentsDirectory();
                            String fullPath = '${appStorage.path}/tiket.jpg';
                            print('full path ${fullPath}');
                            openFile(dio, imgUrl, fullPath, context);

                            setState(() {
                              path = fullPath;
                            });
                          },
                          child: Text("Unduh Tiket"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
      );
    }});
  }

  Future openFile(Dio dio, String url, String savePath, context) async {
    final file = download2(dio, url, savePath);
    if(file == null) return;

    showModalConfirm(context, savePath);

    print('Path : $savePath');
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) { return status! < 500; }
        ),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }

  showModalConfirm(context, filePath) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Berhasil",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 25,),
                Text(
                  "Unduhan berkas dapat kamu lihat sekarang.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      OpenFile.open(filePath);
                    },
                    child: Text(
                        "Lihat"
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    print(args);
    return SafeArea(
                child: Scaffold(
                  appBar: const OrderAppBar(
                    icon: Icons.payment_sharp,
                    title: "Tahap Pembayaran",
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: Column(
                        children: [
                          isSuccess
                              ? SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: Center(
                                    child: Lottie.network(
                                        "https://assets5.lottiefiles.com/packages/lf20_6g4b1djp.json"),
                                  ),
                                )
                              : SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Menunggu pembayaran"),
                                      SizedBox(
                                        height: 60,
                                        width: double.infinity,
                                        child: Lottie.network(
                                            "https://assets4.lottiefiles.com/packages/lf20_drzg2tju.json"),
                                      )
                                    ],
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Konfirmasi Pembayaran",
                                  style: txtTheme.headline2,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: Table(
                              border: TableBorder.all(
                                  color: Colors.black26.withOpacity(0.3)),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text("Nama"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(args['name']),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text("Virtual Account"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(args['va']),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Metode Pembayaran"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(args["payment"]),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Tenggat Pembayaran"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          args['date'],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Jumlah"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text("Rp${args['cost']}"),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Lokasi Tujuan"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          (args["location"] == ""
                                              ? "Tidak dicantumkan"
                                              : args["location"]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Loket Tujuan"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(args['station']),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Nomor Mobil"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(args['carNum']),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text("Nama Supir"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(args["driverName"]),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  children: [
                                    const TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Jenis Layanan"),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(args["service"]),
                                      ),
                                    ),
                                  ],
                                ),
                                if (isSuccess)
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.3),
                                    ),
                                    children: [
                                      const TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text("Dibayar pada"),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            DateFormat("EEEE, d MMMM yyyy")
                                                .format(DateTime.now()),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  checkPaymentStatus();
                                  Get.offAll(() => DashboardScreen(), arguments: args['userId']);
                                });
                              },
                              child: Text("Kembali ke Halaman Utama"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isSuccess = !isSuccess;
                                  checkPaymentStatus();
                                });
                              },
                              child: Text("Refresh"),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Mengalami masalah saat pembayaran?"),
                                GestureDetector(
                                  onTap: () => Get.to(() => CustomerCareScreen(), arguments: "Keluhan"),
                                  child: Text(
                                    "Klik di sini",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}
