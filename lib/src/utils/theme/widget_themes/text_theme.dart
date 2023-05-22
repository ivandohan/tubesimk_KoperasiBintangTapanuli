import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/colors.dart';

class TTextTheme {
  const TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: tDarkColor,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: tDarkColor,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: tDarkColor,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: tDarkColor,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: tDarkColor,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: tDarkColor,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: tDarkColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: tWhiteColor,
    ),
    headline2: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: tWhiteColor,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: tWhiteColor,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: tWhiteColor,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: tWhiteColor,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: tWhiteColor,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: tWhiteColor,
    ),
  );
}