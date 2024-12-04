import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:pragma/data/dto/CatDto.dart';
import 'package:pragma/data/hosts/CatApi.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/domain/entities/SearchResultEntity.dart';
import 'package:pragma/utils/KeyWordsConstants.dart';

Future<Either<ExceptionEntity, SearchResultEntity<CatEntity>>> SearchCatApiImpl(
    String query, int page, int itemsPerPage) async {
  String endPoint = query.isEmpty ? "/breeds" : "/breeds/search";
  String params = "?limit=$itemsPerPage&page=$page&has_breeds=1";
  if (query.isNotEmpty) params += "&q=$query";
  String relativeUrl = endPoint + params;
  try {
    print("relative $relativeUrl");
    dynamic responseText = await CatApi().get(relativeUrl);
    if (responseText == null)
      return Left(
          ExceptionEntity(code: KeyWordsConstants.server_error_getting_cats));
    List<dynamic> responseJson = jsonDecode(responseText);
    List<CatEntity> cats = responseJson.map((e) => CatDto.fromJSON(e)).toList();
    SearchResultEntity<CatEntity> result = SearchResultEntity(
        currentPage: page,
        totalItems: cats.length,
        data: cats,
        itemsPerPage: itemsPerPage,
        lastpage: 1);
    return Right(result);
  } catch (e) {
    if (e is Exception)
      return Left(ExceptionEntity.fromE(e));
    else
      return Left(ExceptionEntity());
  }
}
