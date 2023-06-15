import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_appbar.dart';

class TripRulesScreen extends StatelessWidget {
  const TripRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Aturan Trip",
                  style: txtTheme.headline4,
                ),
                const SizedBox(height: 5,),
                Text(
                  "Berikut adalah aturan-aturan yang harus anda pahami"
                      " sebelum memesan tiket.",
                ),
                const SizedBox(height: 10,),
                Text(
                  "1. Pemesanan tiket dapat dilakukan melalui aplikasi"
                      " atau datang ke loket langsung."
                ),
                const SizedBox(height: 10,),
                Text(
                  "2. Pastikan tiket anda telah tepat, sesuai dengan "
                      "jadwal dan pilihan Anda."
                ),
                const SizedBox(height: 10,),
                Text(
                  "3. Tiket tidak dapat dikembalikan setelah dibeli, jadi harap"
                      " lebih diperhatikan lagi."
                ),
                const SizedBox(height: 10,),

                Text(
                  "4. Tiket yang telah dibayar akan ditunjukkan pada kasir dan supir"
                      " untuk memvalidasi perjalanan Anda."
                ),
                const SizedBox(height: 10,),

                Text(
                  "5. Jika ada kesalahan mekanisme sistem, Anda dapat melapornya pada"
                      " menu 'Hubungi Kami'."
                ),
                const SizedBox(height: 10,),

                Text(
                  "6. Jika membawa peliharaan, harap diperhatikan agar selalu"
                      "dalam kendali."
                ),
                const SizedBox(height: 10,),

                Text(
                  "7. Jika anda bepergian dengan membawa barang secukupnya, tidak perlu"
                      "pergi ke menu 'Titip Barang'",
                ),
                const SizedBox(height: 10,),

                Text(
                  "8. Dilarang berbuat onar selama perjalanan demi menjaga kenyamanan bersama."
                ),
                const SizedBox(height: 10,),

                Text(
                  "9. Rest area dan waktu rehat telah ditentukan sesuai dengan rute perjalanan,"
                      " harap diperhatikan agar tidak ketinggalan saat rehat."
                ),
                const SizedBox(height: 10,),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text("Kembali"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
