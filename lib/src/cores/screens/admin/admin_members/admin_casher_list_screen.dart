import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';

class AdminCasherListScreen extends StatelessWidget {
  const AdminCasherListScreen({super.key});

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
                  "Daftar Nama Kasir",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Berikut daftar nama kasir dari seluruh loket yang melayani saat ini.",
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
                      Text("Cari kasir..."),
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
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Loket"),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                      ),
                      children: const [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Mujianto S.Pd"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Medan"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("082355647893"),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Loket KBT Medan"),
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
