import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/user_factory.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/user_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/forget_pw/otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final _userFactory = Get.put(UserFactory());

  Future<void> registerUser(UserModel user) async {
    AuthFactory.instance.register(user.name, user.email, user.password);
    await _userFactory.createUser(user);
  }

  registerWithPhone(UserModel user, context) async {
    var verId = AuthFactory.instance.verifyPhone(context, user.email);
    await _userFactory.createUser(user);
    return verId;
  }

}