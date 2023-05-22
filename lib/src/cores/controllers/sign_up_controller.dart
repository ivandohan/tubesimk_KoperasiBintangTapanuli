import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  void registerUser(String name, String email, String password) {
    AuthFactory.instance.register(email, password);
  }

}