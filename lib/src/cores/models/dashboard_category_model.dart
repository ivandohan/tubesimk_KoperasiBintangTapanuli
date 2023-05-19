import 'package:flutter/material.dart';

class DashboardCategoryModel {
  final String title, heading, subHeading;
  final VoidCallback? onPress;

  DashboardCategoryModel({
    required this.title,
    required this.heading,
    required this.subHeading,
    required this.onPress,
  });

  static List<DashboardCategoryModel> list = [
    DashboardCategoryModel(title: "P", heading: "Mobil Paket", subHeading: "10 Mobil", onPress: null),
    DashboardCategoryModel(title: "E", heading: "Mobil Eksekutif", subHeading: "10 Mobil", onPress: null),
    DashboardCategoryModel(title: "R", heading: "Mobil Reguler", subHeading: "10 Mobil", onPress: null),
    DashboardCategoryModel(title: "PU", heading: "Mobil Pickup", subHeading: "10 Mobil", onPress: null),
  ];
}