import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/station_factory.dart';

class StationController extends GetxController {
  static StationController get instance => Get.find();

  final _stationFactory = Get.put(StationFactory());

  getAllStationData() {
    _stationFactory.getAllStationData();
  }
}