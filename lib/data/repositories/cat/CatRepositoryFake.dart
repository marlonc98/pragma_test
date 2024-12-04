import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/repositories/CatRepository.dart';

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
    await Future.delayed(Duration(seconds: 1));
    return Right(fakeCat);
  }

  @override
  Future<Either<ExceptionEntity, List<CatEntity>>> searchCats(
      String query, int page, int itemsPerPage) async {
    await Future.delayed(Duration(seconds: 1));
    List<CatEntity> cats = List.generate(10, (index) => fakeCat);
    for (int i = 0; i < cats.length; i++) {
      cats[i].id = i.toString();
    }
    return Right(cats);
  }
}
