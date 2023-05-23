import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/payment_model.dart';

class PaymentFactory extends GetxController {
  static PaymentFactory get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createPayment(PaymentModel pm) async {
    await _db
        .collection("Orders")
        .add(pm.toJson())
        .catchError((err, _) {
      Get.snackbar(
        "Gagal!",
        "Order gagal dibuat.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
      );
    });
  }
}
