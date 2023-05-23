import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/payment_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/user_profile_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/payment_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/user_model.dart';
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

  bool isSuccess = false;
  final String carNum = '989';
  final String driverName = "Maiki Salamun";

  var uCP = Get.put(UserProfileController());
  var pC = Get.put(PaymentController());

  void checkPaymentStatus(userId) async {
    var now = DateTime.now();
    // {date: Tuesday, 23 May 2023, station: Loket KBT Medan, stationNearby: Loket KBT Siantar,
    // location: , cost: 100000, payment: Dana, service: Penumpang, phone: }
    final paymentModel = PaymentModel(
      va: args["va"],
      userId: userId,
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
                          onPressed: () => Get.offAll(() => DashboardScreen()),
                          child: Text("Kembali"),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.offAll(() => DashboardScreen()),
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

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    print(args);
    return FutureBuilder(
        future: uCP.getUserData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel user = snapshot.data as UserModel;
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
                                  checkPaymentStatus(user.id);
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
                                  checkPaymentStatus(user.id);
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
                              children: const [
                                Text("Mengalami masalah saat pembayaran?"),
                                Text(
                                  "Klik di sini",
                                  style: TextStyle(
                                    color: Colors.blue,
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
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text(
                  "Tidak dapat memuat konten. Coba beberapa saat lagi.",
                  textAlign: TextAlign.center,
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
