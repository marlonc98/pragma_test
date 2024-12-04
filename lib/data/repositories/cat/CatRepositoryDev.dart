import 'package:either_dart/either.dart';
import 'package:pragma/data/repositories/cat/CatRepositoryFake.dart';
import 'package:pragma/data/repositories/cat/api/SearchCatApiImpl.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/repositories/CatRepository.dart';

class CatRepositoryDev extends CatRepository {
  CatRepositoryFake fakeRep = CatRepositoryFake();

  @override
  Future<Either<ExceptionEntity, CatEntity>> getCatById(String id) =>
      fakeRep.getCatById(id);

  @override
  Future<Either<ExceptionEntity, List<CatEntity>>> searchCats(
          String query, int page, int itemsPerPage) =>
      SearchCatApiImpl(query, page, itemsPerPage);
}
