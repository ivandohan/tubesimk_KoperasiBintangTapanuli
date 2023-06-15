import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_dashboard/super_dashboard_appbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/cost_management/add_cost_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/cost_management/edit_cost_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/station_management/add_station_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/menus/station_management/edit_station_screen.dart';

class CostManagementScreen extends StatefulWidget {
  const CostManagementScreen({super.key});

  @override
  State<CostManagementScreen> createState() => _CostManagementScreenState();
}

class _CostManagementScreenState extends State<CostManagementScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    TabController _tabController = TabController(length: 2, vsync: this);

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
                  "Atur Tarif",
                  style: txtTheme.headline4,
                ),
                const SizedBox(height: 10,),

                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          text: "Ubah Tarif",
                        ),
                        Tab(
                          text: "Tarif Saat ini",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.all(10),
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AddCostScreen(),
                      EditCostScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}