import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
  final String driverName;
  final String id;
  final bool isAvailable;
  final isOntrip;
  final String status;
  final String destination;
  final String initial;
  final bool isWaiting;
  final String date;
  final int availableCount;

  CarModel({
    required this.driverName,
    required this.id,
    required this.isAvailable,
    required this.isOntrip,
    required this.status,
    required this.destination,
    required this.initial,
    required this.isWaiting,
    required this.date,
    required this.availableCount,
  });

  toJson() {
    return {
      "driverName": driverName,
      "id": id,
      "isAvailable": isAvailable,
      "isOntrip": isOntrip,
      "status": status,
      "date": date,
      "availableCount": availableCount,
      "destination": destination,
      "initial": initial,
      "isWaiting": isWaiting,
    };
  }

  factory CarModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    return CarModel(
        driverName: data["driverName"],
        id: data["id"],
        isAvailable: data["isAvailable"],
        isOntrip: data["isOntrip"],
        status: data["status"],
        destination: data["destination"],
        initial: data["initial"],
        isWaiting: data["isWaiting"],
        date: data["date"],
        availableCount: data['availableCount']);
  }
}
