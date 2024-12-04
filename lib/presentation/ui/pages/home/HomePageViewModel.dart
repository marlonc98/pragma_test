import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/use_cases/cat/SearchCatsUseCase.dart';
import 'package:pragma/presentation/ui/pages/ViewModel.dart';
import 'package:pragma/presentation/ui/pages/home/HomePage.dart';
import 'package:pragma/utils/ShowModal.dart';

class HomePageViewModel extends ViewModel<HomePage> {
  HomePageViewModel({required super.context, required super.widget}) {
    _searchCats();
  }
  List<CatEntity> cats = [];

  String searching = "";
  int page = 1;
  int itemsPerPage = 10;

  void onChangeQuery(String value) {
    searching = value;
    page = 1;
    cats.clear();
    _searchCats();
  }

  void handleChangePage(int page) {
    this.page = page;
    _searchCats();
  }

  void _searchCats() async {
    Either<ExceptionEntity, List<CatEntity>> response = await getIt
        .get<SearchCatsUseCase>()
        .call(searching, page, itemsPerPage);

    if (response.isLeft) {
      ShowModal.showSnackBar(
          context: context,
          text: localization.translate(response.left.code),
          error: true);
      return;
    }

    cats.addAll(response.right);
    notifyListeners();
  }
}
