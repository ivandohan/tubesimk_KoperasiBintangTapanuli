
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_income/admin_income_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_income/admin_outcome_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_income/widgets/income_line_chart.dart';

class IncomeTabBarView extends StatelessWidget {

  final color = Colors.cyan.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.to(() => AdminIncomeScreen()),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        )
                    ),
                    padding: const EdgeInsets.all(10),
                    height: 130,
                    child: Center(
                      child: Text(
                        "Pendapatan",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.to(() => AdminOutcomeScreen()),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        )
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "Pengeluaran",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )
                  ),
                  padding: const EdgeInsets.all(10),
                  height: 130,
                  child: Center(
                    child: Text(
                      "Tarif Layanan",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}