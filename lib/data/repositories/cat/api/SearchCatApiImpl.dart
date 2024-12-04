import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:pragma/data/dto/CatDto.dart';
import 'package:pragma/data/hosts/CatApi.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/utils/KeyWordsConstants.dart';

Future<Either<ExceptionEntity, List<CatEntity>>> SearchCatApiImpl(
    String query, int page, int itemsPerPage) async {
  String relativeUrl = "/breeds/search?limit=$itemsPerPage&page=$page&q=$query";
  try {
    dynamic responseText = await CatApi().get(relativeUrl);
    if (responseText == null)
      return Left(
          ExceptionEntity(code: KeyWordsConstants.server_error_getting_cats));
    Map<String, dynamic> responseJson = jsonDecode(responseText);
    List<CatEntity> cats =
        (responseJson as List<dynamic>).map((e) => CatDto.fromJSON(e)).toList();
    return Right(cats);
  } catch (e) {
    if (e is Exception)
      throw ExceptionEntity.fromE(e);
    else
      throw ExceptionEntity();
  }
}
