import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/user_factory.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final _userFactory = Get.put(UserFactory());

  void loginUser(String email, String password) {
    AuthFactory.instance.login(email, password);
  }
}