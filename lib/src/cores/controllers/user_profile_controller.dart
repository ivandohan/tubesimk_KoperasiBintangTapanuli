import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/user_factory.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  final _authFactory = Get.put(AuthFactory());
  final _userFactory = Get.put(UserFactory());

  getUserData() {
    final email = _authFactory.firebaseUser.value?.email;
    if(email != null) {
      return _userFactory.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Masuk untuk melanjutkan.");
    }
  }
}