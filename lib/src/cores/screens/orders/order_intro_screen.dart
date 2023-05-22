import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';

import 'order_form_screen.dart';

class OrderIntroScreen extends StatefulWidget {
  const OrderIntroScreen({super.key, required this.title});

  final String title;

  @override
  State<OrderIntroScreen> createState() => _OrderIntroScreenState();
}

class _OrderIntroScreenState extends State<OrderIntroScreen> {
  final int gottenStar = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(tBannerBookingImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height - 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Perlu Dipahami",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Sebelum anda memesan tiket, pastikan anda sudah "
                        "mengetahui aturan dan ketentuan yang berlaku. "
                        "Kami tidak menerima alasan kelalaian personal apabila terjadi.",
                        style: TextStyle(
                          color: Colors.black54.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Aturan dan Ketentuan yang berlaku, dapat "
                        "anda lihat dengan menekan menu di bawah ini.",
                        style: TextStyle(
                          color: Colors.black54.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        padding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: Colors.black26,
                          ),
                          color: Colors.blue.withOpacity(0.1),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.rule),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Aturan dan Ketentuan",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Setelah memahaminya, anda dapat melakukan"
                        "penjadwalan dan memilih lokasi dengan menekan tombol plus."
                        " Anda dapat mengubah jadwal dan lokasi terpilih dengan menekan"
                        " kembali tombol tambah.",
                        style: TextStyle(
                          color: Colors.black54.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => OrderFormScreen(), arguments: {'service': widget.title, 'location': ""}),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: const Text(
                      "Atur Jadwal & Tempat",
                    ),
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
