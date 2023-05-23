import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/payment_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/payment_model.dart';

class PaymentController extends GetxController {

  final _paymentFactory = Get.put(PaymentFactory());

  Future<void> addOrder(PaymentModel pm) async {
    await _paymentFactory.createPayment(pm);
  }
}