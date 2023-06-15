import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_screen.dart';

class AdminReportUserCareScreen extends StatefulWidget {
  AdminReportUserCareScreen({Key? key}) : super(key: key);

  @override
  State<AdminReportUserCareScreen> createState() => _AdminReportUserCareScreenState();
}

class _AdminReportUserCareScreenState extends State<AdminReportUserCareScreen> {
  var listItem = [
    "Andrian Bagaskara",
    "Kelompok 7",
    "Juan,"
  ];

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AdminDashboardAppBar(),
        body: SingleChildScrollView(
          child: !isClicked ? pickContainer(context) : pickContainer2(context),
        ),
      ),
    );

  }

  pickContainer(context) {
    var txtTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Laporan dari Pelanggan",
            style: txtTheme.headline4,
          ),
          const SizedBox(height: 20,),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listItem.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = true;
                  });
                },
                child: SizedBox(
                  height: 60,
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            listItem[index],
                            style: txtTheme.bodyText1,
                          ),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  pickContainer2(context) {
    var txtTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Laporan dari Kelompok 7",
                  style: txtTheme.headline4,
                ),
                const SizedBox(height: 20,),
                      SizedBox(
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Halo min",
                                style: txtTheme.bodyText1,
                              ),
                              const SizedBox(height: 10,),
                              const SizedBox(
                                width: double.infinity,
                                height: 120,
                                child: TextField(
                                  maxLines: null,
                                  expands: true,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.textsms),
                                      labelText: "Balasan anda",
                                      hintText: "Masukkan isi balasan anda..."
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  showModalConfirm(context);
                },
              child: Text("Balas"),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text("Kembali"),
            ),
          ),
        ],
      ),
    );
  }

  showModalConfirm(context) {
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
                  "Balasan sudah terkirim.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => AdminDashboardScreen()),
                    child: Text(
                        "Kembali"
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
