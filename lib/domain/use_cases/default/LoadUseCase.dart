import 'package:pragma/domain/providers/Localization/LocallizationProvider.dart';
import 'package:pragma/domain/repositories/LocalizationRepository.dart';

class LoadUseCase {
  final LocalizationRepository localizationRepository;
  final LocalizationProvider localizationProvider;

  LoadUseCase({
    required this.localizationProvider,
    required this.localizationRepository,
  });

  Future<void> call() async {
    final locale = await localizationRepository.getLanguage();
    localizationProvider.locale = locale;
  }
}
