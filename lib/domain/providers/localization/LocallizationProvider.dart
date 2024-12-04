import 'package:flutter/material.dart';

abstract class LocalizationProvider with ChangeNotifier {
  abstract Locale locale;
  String translate(String keyText, {Map<String, dynamic>? values});
}
