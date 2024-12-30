import 'package:_1_11_2024_infiniti/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
      bodySmall: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.grey),
      //headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: Colors.blue),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
      bodySmall: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.grey),
      //headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blueGrey,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
