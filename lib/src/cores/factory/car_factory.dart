import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/car_model.dart';

class CarFactory extends GetxController {
  static CarFactory get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  lookingForPassengers(CarModel cm) async {
    await _db
        .collection("Cars").doc(cm.id).set(cm.toJson())
        .whenComplete(() => Get.snackbar(
      "Sukses!",
      "Berhasil masuk antrian.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    ))
        .catchError((err, _) {
      Get.snackbar(
        "Gagal!",
        "Tidak dapat memasuki antrian",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
      );
    });
  }

  getAllAvailableCar() async {
    final snapshot = await _db.collection("Cars").where("isAvailable", isEqualTo: true).get();
    final data = snapshot.docs.map((value) => CarModel.fromSnapshot(value)).single;
    return data;
  }
}
