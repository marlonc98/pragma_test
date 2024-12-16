import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/use_cases/cat/get_cat_by_id_use_case.dart';
import 'package:pragma/presentation/ui/pages/view_model.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/detailed_cat_page.dart';
import 'package:pragma/utils/show_modal.dart';

class DetailedCatPageViewModel extends ViewModel<DetailedCatPage> {
  DetailedCatPageViewModel({required super.context, required super.widget}) {
    _loadCat();
  }

  bool loading = true;
  CatEntity? cat;

  void _loadCat() async {
    final Either<ExceptionEntity, CatEntity> result =
        await getIt<GetCatByIdUseCase>().call(widget.id);
    loading = false;
    if (result.isLeft) {
      ShowModal.showSnackBar(
          // ignore: use_build_context_synchronously
          context: context, text: result.left.message, error: true);
    } else {
      cat = result.right;
    }

    notifyListeners();
  }
}
