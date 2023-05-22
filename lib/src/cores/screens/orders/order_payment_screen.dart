import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
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

  @override
  Widget build(BuildContext context) {
    print("PAYYYYYYYYYYYYYYYYYYYYY");
    print(args);
    var txtTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: OrderAppBar(
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
                    border:
                        TableBorder.all(color: Colors.black26.withOpacity(0.3)),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                                  (args["location"] == "" ? "Tidak dicantumkan" : args["location"]),
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
                        children: const [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Nomor Mobil"),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text("989"),
                            ),
                          ),
                        ],
                      ),
                      const TableRow(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text("Nama Supir"),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text("Maiki Salamun"),
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
                        isSuccess = !isSuccess;
                      });
                    },
                    child: Text("Refresh"),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                const SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
