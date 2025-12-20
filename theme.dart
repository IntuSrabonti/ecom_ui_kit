import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF1E4C2F),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      color: Colors.black54,
    ),
  ),
);
