import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pragma/domain/providers/Localization/LocallizationProvider.dart';

class LocalizationProviderImpl extends LocalizationProvider {
  Locale _locale = Locale('en', '');
  Locale get locale => _locale;
  set locale(Locale locale) {
    _locale = locale;
    _load();
  }

  Map<String, String> _localizedStrings = {};
  Future<void> _load() async {
    String jsonString = await rootBundle
        .loadString('assets/language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    notifyListeners();
  }

  String translate(String keyText, {Map<String, dynamic>? values}) {
    String? string = _localizedStrings[keyText];
    if (string == null) return keyText;
    if (values == null || values.keys.length <= 0) {
      return string;
    }
    for (String key in values.keys) {
      try {
        string = string!.replaceAll('{' + key + '}', '${values[key]}');
      } catch (e) {}
    }
    return string!;
  }
}
