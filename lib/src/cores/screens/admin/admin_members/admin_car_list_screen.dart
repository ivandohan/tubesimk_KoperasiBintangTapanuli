import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';

class AdminCarListScreen extends StatefulWidget {
  const AdminCarListScreen({super.key});

  @override
  State<AdminCarListScreen> createState() => _AdminCarListScreenState();
}

class _AdminCarListScreenState extends State<AdminCarListScreen> {

  var carList = [
    {
      "nomor" : 111,
      "pemilik" : "Ivandohan Siregar",
      "plat" : "BK 1067 KB",
      "tipe" : "Eksekutif"
    },
    {
      "nomor" : 222,
      "pemilik" : "Fadli Tambunan",
      "plat" : "BK 1067 KB",
      "tipe" : "Eksekutif"
    },
    {
      "nomor" : 333,
      "pemilik" : "Tito Situmorang",
      "plat" : "BK 1133 KSJ",
      "tipe" : "Eksekutif"
    },
    {
      "nomor" : 444,
      "pemilik" : "Gihon Sinaga",
      "plat" : "BK 1124 PWL",
      "tipe" : "Eksekutif"
    },
    {
      "nomor" : 555,
      "pemilik" : "Ridopandi Sinaga",
      "plat" : "BK 1109 JKI",
      "tipe" : "Eksekutif"
    },
    {
      "nomor" : 666,
      "pemilik" : "Luis Silalahi",
      "plat" : "BK 1046 ADS",
      "tipe" : "Eksekutif"
    },
    {
      "nomor" : 777,
      "pemilik" : "Andre",
      "plat" : "BK 1100 SBD",
      "tipe" : "Eksekutif"
    },
    {
      "nomor" : 888,
      "pemilik" : "Ferdi Nasution",
      "plat" : "BB 1234 SO",
      "tipe" : "Reguler"
    },
    {
      "nomor" : 999,
      "pemilik" : "Imam Hatris",
      "plat" : "BK 5678 EP",
      "tipe" : "Reguler"
    },
    {
      "nomor" : 199,
      "pemilik" : "Kenang Ghofar",
      "plat" : "BB 9012 KPK",
      "tipe": "Reguler"
    },
    {
      "nomor": 121,
      "pemilik": "Azis Putra",
      "plat": "BB 5656 SDA",
      "tipe": "Reguler"
    },
    {
      "nomor": 505,
      "pemilik": "Arya Ananda",
      "plat": "BK 3847 PO ",
      "tipe": "Reguler"
    },
    {
      "nomor": 466,
      "pemilik": "Rayhan Abrar",
      "plat": "BB 1029 WS",
      "tipe": "Reguler"
    },
    {
      "nomor": 377,
      "pemilik": "Rizki Sahat",
      "plat": "BB 7890 PBO",
      "tipe": "Paket"
    },
    {
      "nomor": 288,
      "pemilik": "Fadhil Lubis",
      "plat": "BB 3456 PTI",
      "tipe": "Paket"
    },

  ];

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: const AdminDashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daftar Mobil",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Berikut daftar mobil yang siap beroperasi saat ini.",
                  style: txtTheme.bodyText2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Cari mobil..."),
                      Icon(Icons.search_sharp),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Table(
                  border: TableBorder.all(color: Colors.black.withOpacity(0.4)),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      children: const [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Nomor"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Pemilik"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Tipe"),
                          ),
                        ),
                      ],
                    ),
                    for(int i = 0; i < carList.length; i++)
                      TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(carList[i]["nomor"].toString()),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(carList[i]["pemilik"].toString()),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(carList[i]["tipe"].toString()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Icon(Icons.arrow_back_ios)),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                      ),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
