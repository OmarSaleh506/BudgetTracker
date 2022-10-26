import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class Themes {
  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.k2dTextTheme(),
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightModeScaffoldBgCle,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
  );
}
