import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:pragma/data/dto/cat_dto.dart';
import 'package:pragma/data/crud_host_setttings/cat_api.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/domain/entities/exception_entity.dart';
import 'package:pragma/domain/entities/search_result_entity.dart';
import 'package:pragma/utils/error_constants.dart';

Future<Either<ExceptionEntity, SearchResultEntity<CatEntity>>> searchCatApiImpl(
    {required String query,
    required int page,
    required int itemsPerPage}) async {
  String endPoint = query.isEmpty ? "/breeds" : "/breeds/search";
  String params = "?limit=$itemsPerPage&page=$page&has_breeds=1";
  if (query.isNotEmpty) params += "&q=$query";
  String relativeUrl = endPoint + params;
  try {
    dynamic responseText = await CatApi().get(relativeUrl);
    if (responseText == null) {
      return Left(ExceptionEntity(code: ErrorConstants.errorGettingCats));
    }
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
    return Left(ExceptionEntity.fromException(e));
  }
}
