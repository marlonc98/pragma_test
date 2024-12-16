import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/entities/search_result_entity.dart';
import 'package:pragma/domain/repositories/cat_repository.dart';

class SearchCatsUseCase {
  final CatRepository catRepository;

  SearchCatsUseCase({
    required this.catRepository,
  });

  Future<Either<ExceptionEntity, SearchResultEntity<CatEntity>>> call({
      required String query, required int page, required int itemsPerPage
  }) async {
    return catRepository.searchCats(itemsPerPage: itemsPerPage, page: page, query: query);
  }
}
