import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';

class SplashInitialRouteController extends StatefulWidget {

  const SplashInitialRouteController({super.key});

  @override
  State<SplashInitialRouteController> createState() => _SplashInitialRouteControllerState();
}

class _SplashInitialRouteControllerState extends State<SplashInitialRouteController> {

  var args = Get.arguments;


  @override
  void initState() {
    if(args == null) {
      Future.delayed(Duration(seconds: 2), () => Get.offAll(() => DashboardScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}