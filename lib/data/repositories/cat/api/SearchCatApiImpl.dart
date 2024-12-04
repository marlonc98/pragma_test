import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:pragma/data/dto/ImageCatDto.dart';
import 'package:pragma/data/hosts/CatApi.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/domain/entities/ExceptionEntity.dart';
import 'package:pragma/utils/KeyWordsConstants.dart';

Future<Either<ExceptionEntity, List<CatEntity>>> SearchCatApiImpl(
    String query, int page, int itemsPerPage) async {
  String relativeUrl =
      "/images/search?limit=$itemsPerPage&page=$page&has_breeds=1&q=$query";
  try {
    print(relativeUrl);
    dynamic responseText = await CatApi().get(relativeUrl);
    if (responseText == null)
      return Left(
          ExceptionEntity(code: KeyWordsConstants.server_error_getting_cats));
    print('responseText $responseText');
    List<dynamic> responseJson = jsonDecode(responseText);
    print(responseJson);
    List<CatEntity> cats =
        responseJson.expand((e) => ImageCatDto.fromJSON(e)).toList();
    print('cats $cats');
    return Right(cats);
  } catch (e) {
    if (e is Exception)
      return Left(ExceptionEntity.fromE(e));
    else
      return Left(ExceptionEntity());
  }
}
