import 'package:pragma/domain/providers/Localization/LocallizationProvider.dart';
import 'package:pragma/domain/repositories/LocalizationRepository.dart';

class LoadUseCase {
  final LocalizationRepository _localizationRepository;
  final LocalizationProvider _localizationProvider;

  LoadUseCase({
    required LocalizationRepository localizationRepository,
    required LocalizationProvider localizationProvider,
  })  : _localizationRepository = localizationRepository,
        _localizationProvider = localizationProvider;

  Future<void> call() async {
    final locale = await _localizationRepository.getLanguage();
    _localizationProvider.locale = locale;
  }
}
