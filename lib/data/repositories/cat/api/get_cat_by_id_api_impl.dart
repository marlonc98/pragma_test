import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:pragma/data/dto/cat_dto.dart';
import 'package:pragma/data/crud_host_setttings/cat_api.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/utils/error_constants.dart';

Future<Either<ExceptionEntity, CatEntity>> getCatByIdApiImpl(String id) async {
  try {
    String relativeUrl = "/breeds/$id";
    dynamic responseText = await CatApi().get(relativeUrl);
    if (responseText == "INVALID_DATA") {
      return Left(ExceptionEntity(code: ErrorConstants.catNotFound));
    }
    Map<String, dynamic> responseJson = jsonDecode(responseText);
    CatEntity cat = CatDto.fromJSON(responseJson);
    return Right(cat);
  } catch (e) {
    return Left(ExceptionEntity.fromException(e));
  }
}
