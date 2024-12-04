import 'package:flutter/material.dart';

const COLOR_MAIN = Color(0xFFBC6249);
ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    primary: COLOR_MAIN,
  ),
  scaffoldBackgroundColor: const Color(0xFFFFE6DF),
  appBarTheme: AppBarTheme(
    backgroundColor: COLOR_MAIN,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: COLOR_MAIN,
      foregroundColor: Colors.white,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
);
