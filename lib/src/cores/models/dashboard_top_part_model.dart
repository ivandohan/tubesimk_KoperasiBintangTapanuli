import 'package:flutter/material.dart';

class DashboardTopPartModel {
  final String title, heading, subHeading;
  final VoidCallback? onPress;

  DashboardTopPartModel({
    required this.title,
    required this.heading,
    required this.subHeading,
    required this.onPress,
  });

  static List<DashboardTopPartModel> list = [
    DashboardTopPartModel(title: "Penjemputan dan Keberangkatan", heading: "Lihat Selengkapnya", subHeading: "Aturan Trip", onPress: null),
    DashboardTopPartModel(title: "Koperasi Bintang Tapanuli", heading: "Lihat Selengkapnya", subHeading: "Tentang kami", onPress: null),
    DashboardTopPartModel(title: "Loket di Setiap Kota", heading: "Lihat Selengkapnya", subHeading: "Posisi Loket", onPress: null),
    DashboardTopPartModel(title: "Beban Maksimal Barang Bagasi", heading: "Lihat Selengkapnya", subHeading: "Barang Bagasi", onPress: null),
  ];
}