import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  /// Headline style with customizable size and color
  static TextStyle headline({
    double fontSize = 28.0,
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
    double lineHeight = 38.19 / 28.0, // Default ratio
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
      decoration: decoration,
    );
  }

  /// Body text style with customizable size and color
  static TextStyle body({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double lineHeight = 1.5,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
      decoration: decoration,
    );
  }

  /// Caption text style with customizable size and color
  static TextStyle caption({
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w300,
    Color color = Colors.grey,
    double lineHeight = 1.3,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
      decoration: decoration,
    );
  }

  static TextStyle calenderTabs({
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.w600,
    Color color = Colors.black,
    double lineHeight = 38.19 / 28.0, // Default ratio
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
      decoration: decoration,
    );
  }
}
