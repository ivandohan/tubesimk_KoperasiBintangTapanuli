import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/widget_themes/app_bar_theme.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
  );
}