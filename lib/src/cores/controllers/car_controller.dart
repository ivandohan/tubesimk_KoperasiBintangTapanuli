import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/car_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/car_model.dart';

class CarController extends GetxController {
  static CarController get instance => Get.find();

  final _carFactory = Get.put(CarFactory());

  Future<void> enterQueue(CarModel cm) async {
    await _carFactory.lookingForPassengers(cm);
  }

  getAllAvailableCar() {
    return _carFactory.getAllAvailableCar();
  }
}