import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: GoogleFonts.nunitoTextTheme(),
    );
  }
}
