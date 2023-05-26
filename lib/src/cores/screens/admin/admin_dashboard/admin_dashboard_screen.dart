
import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_dashboard/admin_dashboard_appbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/admin/admin_main/admin_main_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AdminDashboardAppBar(),
        body: AdminMainScreen(),
      ),
    );
  }
}