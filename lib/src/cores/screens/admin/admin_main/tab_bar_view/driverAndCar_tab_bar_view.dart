
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_members/admin_car_list_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_members/admin_casher_list_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_members/admin_driver_list_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_members/admin_station_list_screen.dart';

class DriverAndCarTabBarView extends StatelessWidget {

  final color = Colors.yellow.withOpacity(0.2);

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
                  onTap: () => Get.to(() => AdminDriverListScreen()),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        Text(
                          "Supir",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.to(() => const AdminCarListScreen()),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.car_crash_outlined),
                        Text(
                          "Mobil",
                          textAlign: TextAlign.center,
                        ),
                      ],
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
                child: GestureDetector(
                  onTap: () => Get.to(() => const AdminStationListScreen()),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_city),
                        Text(
                          "Loket",
                          textAlign: TextAlign.center,
                        ),
                      ],
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