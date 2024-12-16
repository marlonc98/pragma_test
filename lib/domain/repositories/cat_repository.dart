import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/entities/search_result_entity.dart';

abstract class CatRepository {
  Future<Either<ExceptionEntity, SearchResultEntity<CatEntity>>> searchCats({
      required String query, required int page, required int itemsPerPage
  });
  Future<Either<ExceptionEntity, CatEntity>> getCatById(String id);
}
