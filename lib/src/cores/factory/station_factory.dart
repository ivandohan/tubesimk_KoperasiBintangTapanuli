import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/station_model.dart';

class StationFactory extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<List<StationModel>> getAllStationData() async {
    final snapshot = await _db.collection("KBT Station").get();
    final userData = snapshot.docs.map((event) => StationModel.fromSnapshot(event)).toList();
    return userData;
  }
}
