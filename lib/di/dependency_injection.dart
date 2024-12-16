import 'package:get_it/get_it.dart';
import 'package:pragma/data/repositories/cat/cat_repository_dev.dart';
import 'package:pragma/data/repositories/cat/cat_repository_fake.dart';
import 'package:pragma/data/repositories/cat/cat_repository_impl.dart';
import 'package:pragma/data/repositories/localization/localization_repository_dev.dart';
import 'package:pragma/data/repositories/localization/localization_repository_fake.dart';
import 'package:pragma/data/repositories/localization/localization_repository_impl.dart';
import 'package:pragma/domain/states/Localization/localization_state.dart';
import 'package:pragma/domain/repositories/cat_repository.dart';
import 'package:pragma/domain/repositories/localization_repository.dart';
import 'package:pragma/domain/use_cases/cat/get_cat_by_id_use_case.dart';
import 'package:pragma/domain/use_cases/cat/search_cats_use_case.dart';
import 'package:pragma/domain/use_cases/default/load_use_case.dart';
import 'package:pragma/presentation/providers/states/localization_state_impl.dart';

enum ModeDependencyInjection { fake, dev, prod }

class DependencyInjection {
  DependencyInjection() {
    GetIt getIt = GetIt.instance;
    ModeDependencyInjection mode = ModeDependencyInjection.prod;
    //#region ------------- repositories -------------------------//
    if (mode == ModeDependencyInjection.fake) {
      getIt.registerSingleton<CatRepository>(CatRepositoryFake());
      getIt.registerSingleton<LocalizationRepository>(
          LocalizationRepositoryFake());
    } else if (mode == ModeDependencyInjection.dev) {
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
    getIt.registerSingleton<LocalizationState>(LocalizationStateImpl());
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
        localizationState: getIt.get<LocalizationState>()));
    //#endregion
    //#endregion
  }
}
