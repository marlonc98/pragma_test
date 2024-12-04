import 'package:flutter/material.dart';
import 'package:pragma/domain/repositories/LocalizationRepository.dart';

class LocalizationRepositoryFake extends LocalizationRepository {
  @override
  Future<Locale> getLanguage() async {
    return Locale("es", "ES");
  }
}
