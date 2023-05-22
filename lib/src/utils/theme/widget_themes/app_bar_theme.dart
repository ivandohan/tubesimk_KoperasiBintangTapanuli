import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/variables.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarTextStyle: TextStyle(color: textColorLightTheme),
  );

  static const darkAppBarTheme = AppBarTheme(
      centerTitle: false,
      backgroundColor: Colors.white24,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: TextStyle(color: textColorLightTheme),
  );
}
