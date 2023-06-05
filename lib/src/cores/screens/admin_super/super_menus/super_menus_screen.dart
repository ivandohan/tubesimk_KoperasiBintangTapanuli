import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_dashboard/super_dashboard_appbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin_super/super_menus/widgets/super_menu_body_widget.dart';

class SuperMenusScreen extends StatelessWidget {
  const SuperMenusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SuperDashboardAppBar(),
        body: SuperMenuBodyWidget(),
      ),
    );
  }
}
