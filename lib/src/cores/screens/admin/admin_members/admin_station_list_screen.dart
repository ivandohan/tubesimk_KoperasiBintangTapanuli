import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';

class AdminStationListScreen extends StatefulWidget {
  const AdminStationListScreen({super.key});

  @override
  State<AdminStationListScreen> createState() => _AdminStationListScreenState();
}

class _AdminStationListScreenState extends State<AdminStationListScreen> {
  var stationList = [
    {
      "nama loket": "KBT Medan",
      "kepala loket": "Bambang Pakpahan",
      "alamat": "Medan"
    },
    {
      "nama loket": "KBT Tarutung",
      "kepala loket": "Gabriel Hutagalung",
      "alamat": "Tarutung"
    },
    {
      "nama loket": "KBT Parapat",
      "kepala loket": "Budi Marpaung",
      "alamat": "Parapat"
    },
    {
      "nama loket": "KBT Pematang Siantar",
      "kepala loket": "Talia Samosir",
      "alamat": "Pematang Siantar"
    },
    {
      "nama loket": "KBT Tebing Tinggi",
      "kepala loket": "Samuel Juntak",
      "alamat": "Tebing Tinggi"
    },
    {
      "nama loket": "KBT Porsea",
      "kepala loket": "Citra Siregar",
      "alamat": "Porsea"
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
                  "Daftar Loket",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Berikut daftar loket pemberhentian resmi yang beroperasi saat ini.",
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
                      Text("Cari loket..."),
                      Icon(Icons.search_sharp),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                            child: Text("Lokasi"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Kepala Loket"),
                          ),
                        ),
                      ],
                    ),
                    for (int i = 0; i < stationList.length; i++)
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child:
                                  Text(stationList[i]["nama loket"].toString()),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                  stationList[i]["kepala loket"].toString()),
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
                          border: Border.all(color: Colors.black)),
                      child: Center(child: Icon(Icons.arrow_back_ios)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
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
