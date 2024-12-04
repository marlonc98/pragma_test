import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';

abstract class CatRepository {
  Future<Either<ExceptionEntity, List<CatEntity>>> searchCats(
      String query, int page, int itemsPerPage);
  Future<Either<ExceptionEntity, CatEntity>> getCatById(String id);
}
