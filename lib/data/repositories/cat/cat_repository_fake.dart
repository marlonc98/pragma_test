import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/entities/search_result_entity.dart';
import 'package:pragma/domain/repositories/cat_repository.dart';

CatEntity fakeCat = CatEntity(
  id: '3',
  name: 'Fake Cat',
  description: 'This is a fake cat',
  image: "https://cdn2.thecatapi.com/images/ebv.jpg",
  countryCode: "US",
  intelligence: 3,
);

class CatRepositoryFake extends CatRepository {
  @override
  Future<Either<ExceptionEntity, CatEntity>> getCatById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(fakeCat);
  }

  @override
  Future<Either<ExceptionEntity, SearchResultEntity<CatEntity>>> searchCats({
      required String query, required int page, required int itemsPerPage
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    List<CatEntity> cats = List.generate(10, (index) => fakeCat);
    for (int i = 0; i < cats.length; i++) {
      cats[i].id = i.toString();
    }
    SearchResultEntity<CatEntity> searchResult = SearchResultEntity(
      currentPage: page,
      data: cats,
      itemsPerPage: itemsPerPage,
      lastpage: 10,
      totalItems: page * itemsPerPage,
    );
    return Right(searchResult);
  }
}
