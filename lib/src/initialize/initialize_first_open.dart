import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_dashboard/super_dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/on_boarding/on_boarding_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/welcome/welcome_screen.dart';

class InitializeFirstOpen extends StatefulWidget {

  const InitializeFirstOpen({super.key});

  @override
  State<InitializeFirstOpen> createState() => _InitializeFirstOpenState();
}

class _InitializeFirstOpenState extends State<InitializeFirstOpen> {

  var loginData;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json_files/login_data.json');

    final data = await jsonDecode(response);

    setState(() {
      loginData = data;
      print("isLogin ========================= $loginData");
    });
  }

  @override
  void initState() {
    readJson().whenComplete(() {
      if(loginData['isLogin']) {
        if(loginData['userLevel'] == "user") {
          if(loginData['isFirstOpen']) {
            Get.offAll(() => OnBoardingScreen(), arguments: loginData["userId"]);
          } else{
            Get.offAll(() => DashboardScreen(), arguments: loginData["userId"]);
          }
        } else if(loginData['userLevel'] == "admin"){
          Get.offAll(() => const AdminDashboardScreen());
        } else if(loginData['userLevel'] == "super_admin") {
          Get.offAll(() => const SuperDashboardScreen());
        }
      } else {
        Get.offAll(() => WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}