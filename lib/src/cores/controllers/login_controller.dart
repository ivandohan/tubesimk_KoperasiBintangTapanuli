import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  void loginUser(String email, String password) {
    AuthFactory.instance.login(email, password);
  }
}