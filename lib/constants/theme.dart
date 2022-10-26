import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class Themes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightModeScaffoldBgCle,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
  );
  TextStyle get headingTextStyle => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      wordSpacing: 0.11,
      fontFamily: GoogleFonts.k2d());
}
