import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String phone;
  final String password;
  final String status;

  const UserModel(
      {this.id,
        required this.name,
      required this.phone,
      required this.password,
      required this.status,
      });

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "password": password,
      "status": status,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;

    return UserModel(
      id: doc.id,
      name: data['name'],
      phone: data['phone'],
      password: data['password'],
      status: data['status'],
    );
  }
}
