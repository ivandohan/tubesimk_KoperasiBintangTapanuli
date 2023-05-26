import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/history/user/user_payment_history.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/order_form_screen.dart';

class DashboardNavbar extends StatelessWidget {
  const DashboardNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black87.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 100,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "KBT",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text("Menu", style: Theme.of(context).textTheme.headline3,),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => Get.to(() => OrderFormScreen(), arguments: {'service': "", 'location': ""}),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pesan Tiket",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Get.to(() => UserPaymentHistory()),
                child: Row(
                  children: [
                    Icon(
                      Icons.history,
                      color: Colors.black,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Riwayat Pemesanan",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.map_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Buka Peta",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.brightness_6_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Mode Gelap",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.support_agent,
                    color: Colors.black,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dukungan Pengguna",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {AuthFactory.instance.logout();},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Keluar"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
