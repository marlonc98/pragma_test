import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:pragma/data/dto/CatDto.dart';
import 'package:pragma/data/hosts/CatApi.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/utils/KeyWordsConstants.dart';

Future<Either<ExceptionEntity, CatEntity>> GetCatByIdApiImpl(String id) async {
  try {
    String relativeUrl = "/breeds/$id";
    dynamic responseText = await CatApi().get(relativeUrl);
    if (responseText == "INVALID_DATA")
      return Left(
          ExceptionEntity(code: KeyWordsConstants.server_error_no_cat_found));
    Map<String, dynamic> responseJson = jsonDecode(responseText);
    CatEntity cat = CatDto.fromJSON(responseJson);
    return Right(cat);
  } catch (e) {
    if (e is Exception)
      throw ExceptionEntity.fromE(e);
    else
      throw ExceptionEntity();
  }
}
