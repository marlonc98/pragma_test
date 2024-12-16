import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/repositories/cat_repository.dart';

class GetCatByIdUseCase {
  CatRepository catRepository;

  GetCatByIdUseCase({
    required this.catRepository,
  });

  Future<Either<ExceptionEntity, CatEntity>> call(String id) async {
    return catRepository.getCatById(id);
  }
}
