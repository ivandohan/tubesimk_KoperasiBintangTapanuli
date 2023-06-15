import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/acc_management/acc_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/car_management/car_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/cost_management/cost_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/driver_management/driver_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/employee_management/employee_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/report_management/report_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/station_management/station_management_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/widgets/super_menu_cards_widget.dart';

class SuperMenuBodyWidget extends StatelessWidget {
  SuperMenuBodyWidget({super.key});

  final menuList = [
    {"title": "Manajemen Akun", "onTap": () => Get.to(() => AccManagementScreen())},
    {"title": "Manajemen Loket", "onTap": () => Get.to(() => StationManagementScreen())},
    {"title": "Manajemen Pegawai", "onTap": () => Get.to(() => EmployeeManagementScreen())},
    {"title": "Manajemen Supir", "onTap": () => Get.to(() => DriverManagementScreen())},
    {"title": "Manajemen Mobil", "onTap": () => Get.to(() => CarManagementScreen())},
    {"title": "Atur Tarif", "onTap": () => Get.to(() => CostManagementScreen())},
    {"title": "Ekspor Laporan", "onTap": () => Get.to(() => ReportManagementScreen())},
    {"title": "Aktivitas Admin", "onTap": () {}},
  ];

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            Text(
              "Seluruh Menu",
              style: txtTheme.headline4,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: menuList.length,
              itemBuilder: (_, index) {
                return SuperMenuCardsWidget(menuTitle: menuList[index]["title"].toString(), onTap: menuList[index]["onTap"],);
              },
            ),
          ],
        ),
      ),
    );
  }
}
