import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';

class AdminDriverListScreen extends StatefulWidget {

  AdminDriverListScreen({super.key});

  @override
  State<AdminDriverListScreen> createState() => _AdminDriverListScreenState();
}

class _AdminDriverListScreenState extends State<AdminDriverListScreen> {
  var driverList = [
    {"nama": "John Smith", "hp": "081212121212", "alamat": "Medan"},
    {"nama": "Jessica Taylor", "hp": "083434343434", "alamat": "Tarutung"},
    {"nama": "Messi Silaban", "hp": "085656565656", "alamat": "Parapat"},
    {"nama": "Willie Sianturi", "hp": "087878787878", "alamat": "Pematang Siantar"},
    {"nama": "Rafael Panggabean", "hp": "089090909090", "alamat": "Tebing Tinggi"},
    {"nama": "Irfan Nainggolan", "hp": "082323223233", "alamat": "Porsea"},
    {"nama": "Gonzales", "hp": "084545454545", "alamat": "Medan"},
    {"nama": "Crisardi", "hp": "086767776767", "alamat": "Tarutung"},
    {"nama": "Cristian Vieri", "hp": "089898989899", "alamat": "Parapat"},
    {"nama": "Kevin Nababan", "hp": "081010101010", "alamat": "Pematang Siantar"},
    {"nama": "Charles Simanjuntak", "hp": "081313292999", "alamat": "Tebing Tinggi"},
    {"nama": "Diego Silalahi", "hp": "084236677328", "alamat": "Porsea"},
    {"nama": "Dani Manik", "hp": "084423442662", "alamat": "Medan"},
    {"nama": "Markus Putra", "hp": "088190290002", "alamat": "Tarutung"},
    {"nama": "Sabar Tobing", "hp": "085284539211", "alamat": "Tarutung"},
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
                  "Daftar Nama Supir",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Berikut daftar nama supir yang dalam status aktif saat ini.",
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
                      Text("Cari supir..."),
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
                            child: Text("Nama"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Alamat"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("No. Hp"),
                          ),
                        ),
                      ],
                    ),
                    for(int i = 0; i < driverList.length; i++)
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(driverList[i]["nama"].toString()),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(driverList[i]["alamat"].toString()),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(driverList[i]["hp"].toString()),
                            ),
                          ),
                        ],
                      )
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
