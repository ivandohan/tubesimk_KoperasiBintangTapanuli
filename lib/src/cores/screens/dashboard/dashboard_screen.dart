import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/user_profile_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/user_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_greeter_widget.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_navbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/drivers/driver_dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/forget_pw/otp/otp_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/history/user/user_payment_history.dart';
import 'widgets/dashboard_appbar.dart';
import 'widgets/dashboard_banners.dart';
import 'widgets/dashboard_search.dart';
import 'widgets/dashboard_top_parts.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var args = Get.arguments ?? "";

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final uC = Get.put(UserProfileController());

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: DashboardNavbar(),
        // floatingActionButton: Builder(
        //   builder: (context) {
        //     return FloatingActionButton(
        //       onPressed: () =>
        //           Get.to(() => DriverDashboardScreen()), // <-- Opens drawer.
        //     );
        //   },
        // ),
        appBar: const DashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: FutureBuilder(
              future: uC.getUserData(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel user = snapshot.data as UserModel;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DashboardGreeterWidget(name: user.name),
                        const SizedBox(
                          height: tDashboardPadding,
                        ),

                        DashboardSearchWidget(userId: user.id!),
                        const SizedBox(
                          height: tDashboardPadding,
                        ),

                        // DashboardCategoriesWidget(txtTheme: txtTheme),
                        // const SizedBox(height: tDashboardPadding,),

                        Text(
                          tDashboardBannerText,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.apply(fontSizeFactor: 1.2),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DashboardBannersWidget(userId: user.id!),

                        const SizedBox(
                          height: tDashboardPadding,
                        ),
                        Text(
                          tDashboardTopPartText,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.apply(fontSizeFactor: 1.2),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DashboardTopPartsWidget(txtTheme: txtTheme),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "Tidak dapat memuat konten. Coba beberapa saat lagi.",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
