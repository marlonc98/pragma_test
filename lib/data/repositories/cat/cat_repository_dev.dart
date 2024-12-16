import 'package:either_dart/either.dart';
import 'package:pragma/data/repositories/cat/cat_repository_fake.dart';
import 'package:pragma/data/repositories/cat/api/search_car_api_impl.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/entities/search_result_entity.dart';
import 'package:pragma/domain/repositories/cat_repository.dart';

class CatRepositoryDev extends CatRepository {
  CatRepositoryFake fakeRep = CatRepositoryFake();

  @override
  Future<Either<ExceptionEntity, CatEntity>> getCatById(String id) =>
      fakeRep.getCatById(id);

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<CatEntity>>> searchCats(
          {required String query,
          required int page,
          required int itemsPerPage}) =>
      searchCatApiImpl(
        query: query,
        page: page,
        itemsPerPage: itemsPerPage,
      );
}
