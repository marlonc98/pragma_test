import 'package:get_it/get_it.dart';
import 'package:pragma/data/repositories/cat/CatRepositoryDev.dart';
import 'package:pragma/data/repositories/cat/CatRepositoryFake.dart';
import 'package:pragma/data/repositories/cat/CatRepositoryImpl.dart';
import 'package:pragma/data/repositories/localization/LocalizationRepositoryDev.dart';
import 'package:pragma/data/repositories/localization/LocalizationRepositoryFake.dart';
import 'package:pragma/data/repositories/localization/LocalizationRepositoryImpl.dart';
import 'package:pragma/domain/providers/Localization/LocallizationProvider.dart';
import 'package:pragma/domain/repositories/CatRepository.dart';
import 'package:pragma/domain/repositories/LocalizationRepository.dart';
import 'package:pragma/domain/use_cases/cat/GetCatByIdUseCase.dart';
import 'package:pragma/domain/use_cases/cat/SearchCatsUseCase.dart';
import 'package:pragma/domain/use_cases/default/LoadUseCase.dart';
import 'package:pragma/presentation/providers/localization/LocalizationProviderImpl.dart';

enum ModeDependencyInjection { FAKE, DEV, PROD }

class DependencyInjection {
  DependencyInjection() {
    GetIt getIt = GetIt.instance;
    ModeDependencyInjection mode = ModeDependencyInjection.PROD;
    //#region ------------- repositories -------------------------//
    if (mode == ModeDependencyInjection.FAKE) {
      getIt.registerSingleton<CatRepository>(CatRepositoryFake());
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryFake());
    } else if (mode == ModeDependencyInjection.DEV) {
      getIt.registerSingleton<CatRepository>(CatRepositoryDev());
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryDev());
    } else {
      getIt.registerSingleton<CatRepository>(CatRepositoryImpl());
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryImpl());
    }
    //#endregion repositories

    //#region ------------- providers -------------------------//
    getIt.registerSingleton<LocalizationProvider>(LocalizationProviderImpl());
    //#endregion

    //#region ------------- use cases -------------------------//
    //#region cat
    getIt.registerSingleton<GetCatByIdUseCase>(
        GetCatByIdUseCase(catRepository: getIt.get<CatRepository>()));
    getIt.registerSingleton<SearchCatsUseCase>(
        SearchCatsUseCase(catRepository: getIt.get<CatRepository>()));
    //#endregion
    //#region default
    getIt.registerSingleton<LoadUseCase>(LoadUseCase(
        localizationRepository: getIt.get<LocalizationRepository>(),
        localizationProvider: getIt.get<LocalizationProvider>()));
    //#endregion
    //#endregion
  }
}
