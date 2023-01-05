import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData getTheme() {
    final colorScheme =
        ColorScheme.fromSeed(seedColor: Colors.deepOrange[300]!).copyWith(
      primary: Colors.deepOrange[300],
    );
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.nunitoTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0 ),
          backgroundColor: MaterialStatePropertyAll(colorScheme.primary),
          foregroundColor: MaterialStatePropertyAll(colorScheme.onPrimary),
        ),
      ),
    );
  }
}
