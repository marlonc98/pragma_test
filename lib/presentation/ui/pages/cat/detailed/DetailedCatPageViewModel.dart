import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/use_cases/cat/GetCatByIdUseCase.dart';
import 'package:pragma/presentation/ui/pages/ViewModel.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/DetailedCatPage.dart';
import 'package:pragma/utils/ShowModal.dart';

class DetialedCatPageViewModel extends ViewModel<DetialedCatPage> {
  DetialedCatPageViewModel({required super.context, required super.widget}) {
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
          context: context, text: result.left.message, error: true);
    } else {
      cat = result.right;
    }

    notifyListeners();
  }
}
