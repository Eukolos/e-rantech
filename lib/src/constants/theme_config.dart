import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ThemeConfig {
  static ThemeData createTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,

      appBarTheme: const AppBarTheme(
        toolbarHeight: 100.0,
        elevation: 0,
        color: Colors.white,
        foregroundColor: Colors.white,

      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}