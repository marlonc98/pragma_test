import 'package:either_dart/either.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/entities/search_result_entity.dart';
import 'package:pragma/domain/use_cases/cat/search_cats_use_case.dart';
import 'package:pragma/presentation/ui/pages/view_model.dart';
import 'package:pragma/presentation/ui/pages/cat/list/cat_list_page.dart';
import 'package:pragma/utils/show_modal.dart';

class CatListPageViewModel extends ViewModel<CatListPage> {
  CatListPageViewModel({required super.context, required super.widget}) {
    _initPaginController();
  }
  PagingController<int, CatEntity> pagingController =
      PagingController(firstPageKey: 1);

  List<CatEntity> cats = [];

  String searching = "";
  int page = 1;
  final int _itemsPerPage = 10;

  void _initPaginController() {
    pagingController.addPageRequestListener((pageKey) {
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
    Either<ExceptionEntity, SearchResultEntity<CatEntity>> response =
        await getIt
            .get<SearchCatsUseCase>()
            .call(
              itemsPerPage: _itemsPerPage,
              query: searching,
              page: page,
            );

    if (response.isLeft) {
      ShowModal.showSnackBar(
          // ignore: use_build_context_synchronously
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
