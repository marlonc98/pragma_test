import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/repositories/CatRepository.dart';

class SearchCatsUseCase {
  final CatRepository catRepository;

  SearchCatsUseCase({
    required this.catRepository,
  });

  Future<Either<ExceptionEntity, List<CatEntity>>> call(
      String query, int page, int itemsPerPage) async {
    return this.catRepository.searchCats(query, page, itemsPerPage);
  }
}
