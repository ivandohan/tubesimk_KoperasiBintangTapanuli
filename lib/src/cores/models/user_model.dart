import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String status;
  final bool isOnTrip;

  const UserModel(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.status,
        required this.isOnTrip,
      });

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "status": status,
      "isOnTrip": isOnTrip,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    return UserModel(
      id: doc.id,
      name: data['name'],
      email: data['email'],
      password: data['password'],
      status: data['status'],
      isOnTrip: data['isOnTrip']
    );
  }
}
