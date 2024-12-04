import 'package:either_dart/either.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/repositories/CatRepository.dart';

class GetCatByIdUseCase {
  CatRepository catRepository;

  GetCatByIdUseCase({
    required this.catRepository,
  });

  Future<Either<ExceptionEntity, CatEntity>> call(String id) async {
    return catRepository.getCatById(id);
  }
}
