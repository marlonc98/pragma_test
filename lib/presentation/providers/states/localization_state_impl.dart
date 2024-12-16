import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pragma/domain/states/Localization/localization_state.dart';

class LocalizationStateImpl extends LocalizationState {

  LocalizationStateImpl() {
    _load();
  }
  
  Locale _locale = const Locale('es', '');
  @override
  Locale get locale => _locale;
  @override
  set locale(Locale locale) {
    _locale = locale;
    _load();
  }

  Map<String, String> _localizedStrings = {};
  Future<void> _load() async {
    print("cats jsonMap:start $_locale");
    String jsonString = await rootBundle
        .loadString('assets/translate_dictionaries/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    print("cats jsonMap: $jsonMap");
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    notifyListeners();
  }

  @override
  String translate(String keyText, {Map<String, dynamic>? values}) {
    String? string = _localizedStrings[keyText];
    if (string == null) return keyText;
    if (values == null || values.keys.isEmpty) {
      return string;
    }
    for (String key in values.keys) {
      try {
        string = string!.replaceAll('{$key}', '${values[key]}');
        print("cats string: $string");
      } catch (e) {
        print("cats Error: $e");
        return "";
      }
    }
    return string!;
  }
}
