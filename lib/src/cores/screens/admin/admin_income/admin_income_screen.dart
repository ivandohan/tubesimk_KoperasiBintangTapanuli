import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_income/widgets/income_line_chart.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_income/widgets/line_titles.dart';

class AdminIncomeScreen extends StatefulWidget {
  const AdminIncomeScreen({super.key});

  @override
  State<AdminIncomeScreen> createState() => _AdminIncomeScreenState();
}

class _AdminIncomeScreenState extends State<AdminIncomeScreen> {
  String selectedIncomeTime = "Bulanan";

  List incomeTimeList = ["Bulanan",];

  List<Color> colorList = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AdminDashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pendapatan",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Pendapatan berdasarkan kurun waktu berikut.",
                  style: txtTheme.bodyText2,
                ),
                const SizedBox(
                  height: 10,
                ),
                PickIncomeTime(),
                const SizedBox(
                  height: 20,
                ),
                IncomeLineChartWidget(status: "income",),

                const SizedBox(height: 40,),
                Text(
                  "Ekspor Data",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Menyajikan laporan data ke dalam file pdf.",
                  style: txtTheme.bodyText2,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Ekspor .pdf"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PickIncomeTime() {
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
          value: selectedIncomeTime,
          onChanged: (value) {
            setState(() {
              selectedIncomeTime = value!;
            });
          },
          items: incomeTimeList
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
}
