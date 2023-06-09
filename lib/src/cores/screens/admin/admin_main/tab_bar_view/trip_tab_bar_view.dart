
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_trip/add_trip_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_trip/available_car_screen.dart';

class TripTabBarView extends StatelessWidget {
  
  final color = Colors.green.withOpacity(0.2);

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
                  onTap: () => Get.to(() => AddTripScreen()),
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
                        Icon(Icons.mode_of_travel),
                        Text(
                          "Tambah Perjalanan",
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
                  onTap: () => Get.to(() => AvailableCarScreen()),
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
                        Icon(Icons.car_crash),
                        Text(
                          "Mobil Tersedia",
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
        ],
      ),
    );
  }
}