import 'package:either_dart/either.dart';
import 'package:pragma/data/repositories/cat/api/GetCatByIdApiImpl.dart';
import 'package:pragma/data/repositories/cat/api/SearchCatApiImpl.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/entities/SearchResultEntity.dart';
import 'package:pragma/domain/repositories/CatRepository.dart';

class CatRepositoryImpl extends CatRepository {
  @override
  Future<Either<ExceptionEntity, CatEntity>> getCatById(String id) =>
      GetCatByIdApiImpl(id);

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<CatEntity>>> searchCats(
          String query, int page, int itemsPerPage) =>
      SearchCatApiImpl(query, page, itemsPerPage);
}
