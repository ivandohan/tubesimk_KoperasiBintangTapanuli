import 'package:get/get.dart';
import 'dart:core';

class FieldValidator extends GetxController {
  static FieldValidator get instance => Get.find();

  emailFieldValidator(String value) {
    if(value.isEmpty || value == null || value.indexOf("@") < 2) {
      return "Masukkan email yang valid.";
    } else{
      return null;
    }
  }

  nameFieldValidator(String value) {
    if(value.isEmpty || value.length < 3 || value == null || !RegExp(r'^[a-z A-Z]=$').hasMatch(value!)) {
        return "Mohon masukkan nama yang benar";
    }else {
      return null;
    }
  }

  phoneFieldValidator(String value) {
    if(value.length < 13) {
      return "Mohon masukkan nomor telepon yang benar";
    } else {
      return null;
    }
  }

  passwordFieldValidator(String value) {
    if(value.isEmpty || value.length < 6) {
      return "Masukkan lebih dari 5 karakter";
    }else if(value.length > 20) {
      return "Karakter tidak boleh lebih dari 20";
    }else{
      return null;
    }
  }

  confirmPasswordFieldValidator(String a, String b) {
    if(a != b) {
      return "Kata sandi tidak sesuai";
    } else {
      return null;
    }
  }
}