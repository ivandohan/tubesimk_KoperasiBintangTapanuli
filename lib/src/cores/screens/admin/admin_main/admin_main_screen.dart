import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_main/tab_bar_view/driverAndCar_tab_bar_view.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_main/tab_bar_view/income_tab_bar_view.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_main/tab_bar_view/trip_tab_bar_view.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_main/tab_bar_view/user_report_tab__bar_view.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    TabController _tabController = TabController(length: 4, vsync: this);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                    "Horas, admin Susi Putri!",
                   style: txtTheme.bodyText1,
                  ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Selamat beraktivitas!",
                  style: txtTheme.headline2,
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 10, right: 10),
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:
                      CircleTabIndicator(color: Colors.black, radius: 4),
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          text: "Perjalanan",
                        ),
                        Tab(
                          text: "Direksi",
                        ),
                        Tab(
                          text: "Keanggotaan",
                        ),
                        Tab(
                          text: "Laporan Pengguna",
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 280,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      TripTabBarView(),
                      IncomeTabBarView(),
                      DriverAndCarTabBarView(),
                      UserReportCarTabBarView(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}