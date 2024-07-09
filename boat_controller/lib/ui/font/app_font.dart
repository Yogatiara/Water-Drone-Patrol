// lib/fonts.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle buttonBackAndNext = GoogleFonts.roboto(
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
  );

  TextStyle connectLabel(String pages) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: pages == "connection progres"
              ? Colors.blue.shade500
              : pages == "connection failed"
                  ? Colors.red.shade500
                  : Colors.green.shade500),
    );
  }
}
