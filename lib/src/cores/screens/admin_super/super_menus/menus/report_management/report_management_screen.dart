import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_dashboard/super_dashboard_appbar.dart';

class ReportManagementScreen extends StatefulWidget {
  const ReportManagementScreen({super.key});

  @override
  State<ReportManagementScreen> createState() => _ReportManagementScreenState();
}

class _ReportManagementScreenState extends State<ReportManagementScreen> with TickerProviderStateMixin {

  String path = "";

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    TabController _tabController = TabController(length: 2, vsync: this);

    final imgUrl = "https://i.ibb.co/gMtP7NH/data-pegawai-page-0001.jpg";
    var dio = Dio();

    final stationUrl = "https://i.ibb.co/mhFtshF/data-loket-page-0001.jpg";

    return SafeArea(
      child: Scaffold(
        appBar: SuperDashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Ekspor Laporan",
                  style: txtTheme.headline4,
                ),
                const SizedBox(height: 10,),
                Text(
                  "Berikut laporan-laporan yang dapat anda unduh."
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_balance_wallet),
                        const SizedBox(width: 10,),
                        Text("Laporan Pendapatan"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_balance_wallet),
                        const SizedBox(width: 10,),
                        Text("Laporan Pengeluaran"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final appStorage = await getApplicationDocumentsDirectory();
                      String fullPath = '${appStorage.path}/data_pegawai.jpg';
                      print('full path ${fullPath}');
                      openFile(dio, imgUrl, fullPath, context);

                      setState(() {
                        path = fullPath;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        const SizedBox(width: 10,),
                        Text("Data Pegawai Aktif"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.car_crash),
                        const SizedBox(width: 10,),
                        Text("Data Mobil Terdaftar"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        const SizedBox(width: 10,),
                        Text("Data Supir"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final appStorage = await getApplicationDocumentsDirectory();
                      String fullPath = '${appStorage.path}/data_loket.jpg';
                      print('full path ${fullPath}');
                      openFile(dio, stationUrl, fullPath, context);

                      setState(() {
                        path = fullPath;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_city),
                        const SizedBox(width: 10,),
                        Text("Loket Resmi"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wallet),
                        const SizedBox(width: 10,),
                        Text("Tarif Perjalanan"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final appStorage = await getApplicationDocumentsDirectory();
                      String fullPath = '${appStorage.path}/data_pegawai.jpg';
                      print('full path ${fullPath}');
                      openFile(dio, imgUrl, fullPath, context);

                      setState(() {
                        path = fullPath;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download),
                        const SizedBox(width: 10,),
                        Text("Ekspor Sekaligus"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openFile(Dio dio, String url, String savePath, context) async {
    final file = download2(dio, url, savePath);
    if(file == null) return;

    showModalConfirm(context, savePath);

    print('Path : $savePath');
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
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

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      print("AWAL");
      final response = await Dio().get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: const Duration(seconds: 0),
          )
      );

      print("MASI LANJUT");

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch(e) {
      print("ERROR DONGLOT");
      return null;
    }
  }
}