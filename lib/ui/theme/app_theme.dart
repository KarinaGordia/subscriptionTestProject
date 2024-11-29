import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static final main = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      displaySmall: GoogleFonts.montserratAlternates(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          height: 24 / 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      bodyLarge: GoogleFonts.montserratAlternates(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          height: 19.5 / 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      bodyMedium: GoogleFonts.montserratAlternates(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          height: 18 / 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      labelMedium: GoogleFonts.montserratAlternates(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          height: 15 / 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

