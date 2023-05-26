import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/login/login_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/on_boarding/on_boarding_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/signup/signup_screen.dart';

class AuthFactory extends GetxController {
  static AuthFactory instance = Get.find();

  late Rx<User?> _user;

  get firebaseUser => _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  // @override
  // void onReady() {
  //   super.onReady();
  //   _user = Rx<User?>(auth.currentUser);
  //   _user.bindStream(auth.userChanges());
  //   ever(_user, _initialScreen);
  // }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => OnBoardingScreen());
    } else {
      Get.offAll(() => DashboardScreen());
    }
  }

  void register(String name, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  void login(String email, String password) async {
    print("LLLLOGGGGGGGGGGGG");
    print(email + " " + password);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.black45,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login Gagal...",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text("Kata sandi atau email tidak sesuai", style: TextStyle(color: Colors.white),),
      );
    }
  }

  Future<String> verifyPhone(BuildContext context, String phoneNumber) async {
    String verId = "";

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) async {
        exceptionSnackbar(context, "Autentikasi berhasil.");
        auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        exceptionSnackbar(context, "Autentikasi gagal.");
      },
      codeSent: (String verificationId, int? resendToken) {
        exceptionSnackbar(context, "Kode OTP telah dikirim.");
        verId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        exceptionSnackbar(context, "Waktu habis.");
      },
    );

    return verId;
  }

  Future<void> verifyOTP(String verificationId, String smsCode) async {
    await auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    )).whenComplete(() =>
      Get.to(() => DashboardScreen()));
  }

  void exceptionSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void logout() async => auth.signOut();
}
