import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_dashboard/super_dashboard_appbar.dart';

class SuperDashboardScreen extends StatelessWidget {
  const SuperDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;

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
                  "Horas, Admin!",
                  style: txtTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Selamat beraktivitas!",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}