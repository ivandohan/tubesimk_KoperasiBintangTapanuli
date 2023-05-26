
import 'package:flutter/material.dart';

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
                      "Tambah Perjalanan",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
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
                      "Mobil Tersedia",
                      textAlign: TextAlign.center,
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
                      "Tambah Rute Baru",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
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
                      "Pantau Loket",
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