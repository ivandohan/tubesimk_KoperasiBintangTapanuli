import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/colors.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/orders/order_intro_screen.dart';

class DashboardBannersWidget extends StatelessWidget {
  const DashboardBannersWidget({
    super.key,
    required this.userId,
  });

  final String userId;


  @override
  Widget build(BuildContext context) {
    TextTheme txtTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Get.to(() => OrderIntroScreen(title: "Penumpang",)),
              child: Container(
                height: 197,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: tCardBgColor,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Flexible(
                          child: Icon(Icons.card_travel),
                        ),
                        // Flexible(
                        //   child: Image(
                        //     image: AssetImage(tDashboardBannerImage1),
                        //     height: 128,
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: tDashboardPadding,
                    ),
                    Text(
                      tDashboardBannerTitle1,
                      style: txtTheme.headline4,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => const OrderIntroScreen(title: "Barang Bagasi")),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      color: tCardBgColor,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Flexible(
                              child: Icon(Icons.backpack, size: 20,),
                            ),
                            // Flexible(
                            //   child: Image(
                            //     image: AssetImage(tDashboardBannerImage2),
                            //     height: 50,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          tDashboardBannerTitle2,
                          style: txtTheme.headline4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                onTap: () => Get.to(() => const OrderIntroScreen(title: "Titip Berkas")),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tCardBgColor,
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Flexible(
                              child: Icon(Icons.document_scanner, size: 20,),
                            ),
                            // Flexible(
                            //   child: Image(
                            //     image: AssetImage(tDashboardBannerImage2),
                            //     height: 50,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          tDashboardBannerTitle3,
                          style: txtTheme.headline4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
