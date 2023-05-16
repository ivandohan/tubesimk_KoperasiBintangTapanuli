import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/screens/forget_pw/phone/forget_pw_phone.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_pw_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPwTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              tForgetPwSubTitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: tDefaultSize,
            ),
            ForgetPwBtnWidget(
              title: "Phone",
              subTitle: tResetViaPhone,
              iconData: Icons.phone_android_sharp,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPwPhoneScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}