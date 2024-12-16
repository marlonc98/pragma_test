import 'package:pragma/data/dto/cat_dto.dart';
import 'package:pragma/domain/entities/cat_entity.dart';

class ImageApiToCatListDto {
  static List<CatEntity> fromJSON(dynamic json) {
    List<CatEntity> cats = (json['breeds'] as List<dynamic>).map((breed) {
      breed['image_url'] = json['url'];
      return CatDto.fromJSON(breed);
    }).toList();
    return cats;
  }
}
