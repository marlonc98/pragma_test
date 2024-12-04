import 'package:flutter/material.dart';
import 'package:pragma/data/repositories/localization/api/GetLanguageApiImpl.dart';
import 'package:pragma/domain/repositories/LocalizationRepository.dart';

class LocalizationRepositoryDev extends LocalizationRepository {
  static String LOCALIZATION_REPOSITORY_KEY = 'localization_repository_key';

  @override
  Future<Locale> getLanguage() =>
      GetLanguageApiImpl(LOCALIZATION_REPOSITORY_KEY);
}
