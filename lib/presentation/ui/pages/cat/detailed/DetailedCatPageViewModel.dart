import 'package:either_dart/either.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/entities/SearchResultEntity.dart';
import 'package:pragma/domain/use_cases/cat/SearchCatsUseCase.dart';
import 'package:pragma/presentation/ui/pages/ViewModel.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/DetailedCatPage.dart';
import 'package:pragma/utils/ShowModal.dart';

class DetialedCatPageViewModel extends ViewModel<DetialedCatPage> {
  DetialedCatPageViewModel({required super.context, required super.widget}) {
    _initPaginController();
  }
  PagingController<int, CatEntity> pagingController =
      PagingController(firstPageKey: 1);

  List<CatEntity> cats = [];

  String searching = "";
  int page = 1;
  int _itemsPerPage = 10;

  void _initPaginController() {
    pagingController.addPageRequestListener((pageKey) {
      print('pageKey: $pageKey');
      page = pageKey;
      _searchCats();
    });
  }

  void handleOnChangeQuery(String value) {
    searching = value;
    page = 1;
    cats.clear();
    _searchCats();
  }

  void _searchCats() async {
    print("searching: $searching page: $page");
    Either<ExceptionEntity, SearchResultEntity<CatEntity>> response =
        await getIt
            .get<SearchCatsUseCase>()
            .call(searching, page, _itemsPerPage);

    if (response.isLeft) {
      ShowModal.showSnackBar(
          context: context,
          text: localization.translate(response.left.code),
          error: true);
      return;
    }
    if (page == 1) pagingController.itemList = [];
    if (response.right.data.isNotEmpty) {
      if (response.right.data.length < _itemsPerPage) {
        pagingController.appendLastPage(response.right.data);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(response.right.data, nextPageKey);
      }
    } else {
      pagingController.appendLastPage(response.right.data);
    }
  }
}
