import 'package:cloud_firestore/cloud_firestore.dart';

class StationModel {
  final String? id;
  final String name;
  final String address;
  final String lat;
  final String long;

  StationModel({
    this.id,
    required this.name,
    required this.address,
    required this.lat,
    required this.long,
  });

  toJson() {
    return {
      "name": name,
      "address": address,
      "lat": lat,
      "long": long,
    };
  }

  factory StationModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    return StationModel(
      id: doc.id,
      name: data['name'],
      address: data['address'],
      lat: data['lat'],
      long: data['long'],
    );
  }
}
