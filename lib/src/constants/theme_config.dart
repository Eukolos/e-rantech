import 'package:flutter/material.dart';


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
  /*    fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),*/
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red.shade400),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}