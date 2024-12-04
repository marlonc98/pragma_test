import 'package:flutter/material.dart';

const COLOR_MAIN = Color(0xFFBC6249);
ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    primary: COLOR_MAIN,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: COLOR_MAIN,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
