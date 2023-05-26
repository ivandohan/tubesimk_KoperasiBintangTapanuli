import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/colors.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_top_parts.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/drivers/driver_dashboard_appbar_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/drivers/driver_dashboard_greeter_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/drivers/go_trip_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/maps/order_tracking_screen.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var txtTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: const DriverDashboardAppbarWidget(title: tDashboardAppbarTitle,),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DriverDashboardGreeterWidget(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 85,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Anda tidak dapat melakukan perjalanan."),
                      Text("16 jam 10 menit"),
                      Text("Mohon maksimalkan istirahat anda.")
                    ],
                  ),
                ),
                const SizedBox(height: 20,),

                Text(
                    "Menu",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.apply(fontSizeFactor: 1.2),
                ),
                const SizedBox(height: 10,),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Get.to(() => GoingTripScreen()),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: tCardBgColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black87),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add_road_sharp),
                                      const SizedBox(height: 10,),
                                      Text("Berangkat", style: txtTheme.headline6, textAlign: TextAlign.center,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Get.to(() => TrackingMenu()),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: tCardBgColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black87),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(Icons.explore_off),
                                      const SizedBox(height: 10,),
                                      Text("Mode Cuti", style: txtTheme.headline6,),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Get.to(() => TrackingMenu()),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: tCardBgColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black87),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(Icons.car_crash_outlined),
                                      const SizedBox(height: 10,),
                                      Text("Pantau Mobil Lain", textAlign: TextAlign.center, style: txtTheme.headline6,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: tCardBgColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black87),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Icon(Icons.history_sharp),
                                    const SizedBox(height: 10,),
                                    Text("Riwayat Perjalanan", textAlign: TextAlign.center,  style: txtTheme.headline6,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Text(
                            tDashboardTopPartText,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.apply(fontSizeFactor: 1.2),
                          ),
                          DashboardTopPartsWidget(),
                        ],
                      ),
                      const SizedBox(height: 100,),
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
