import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_income/widgets/line_titles.dart';

class IncomeLineChartWidget extends StatefulWidget {
  const IncomeLineChartWidget({super.key, required this.status});

  final status;

  @override
  State<IncomeLineChartWidget> createState() => _IncomeLineChartWidgetState();
}

class _IncomeLineChartWidgetState extends State<IncomeLineChartWidget> {


  List<Color> colorList = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    var showAvg = (widget.status == "income");
    return Container(
      width: double.infinity,
      height: 300,
      child: LineChart(
        showAvg ? LineTitles(status: widget.status).avgData() : LineTitles(status: widget.status).mainData(),
      ),
    );
  }
}
