import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/order_payment_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/widgets/order_form_appbar.dart';

class OrderProcessScreen extends StatefulWidget {
  OrderProcessScreen({super.key});

  var args = Get.arguments;

  @override
  State<OrderProcessScreen> createState() => _OrderProcessScreenState();
}

class _OrderProcessScreenState extends State<OrderProcessScreen> {

  @override
  void initState() {
    String va = Random().nextInt(pow(2, 32).toInt()).toString();
    Future.delayed(Duration(seconds: 5), () => Get.to(() => OrderPaymentScreen(), arguments: {...widget.args, "va": va}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("PRRRRRRRRRRRRRRRRROOOOOOOOOOOOOOOCCCCCCCCCCCCCCC");
    print(widget.args);

    return SafeArea(
      child: Scaffold(
        appBar: const OrderAppBar(
          title: "Pesanan sedang diproses",
          icon: Icons.circle_outlined,
        ),
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_vgnydkhi.json"),
        ),
      ),
    );
  }
}