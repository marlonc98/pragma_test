import 'package:pragma/data/dto/CatDto.dart';
import 'package:pragma/domain/entities/CatEntity.dart';

class ImageCatDto {
  static List<CatEntity> fromJSON(dynamic json) {
    print('for json $json');
    List<CatEntity> cats = (json['breeds'] as List<dynamic>).map((breed) {
      breed['image_url'] = json['url'];
      return CatDto.fromJSON(breed);
    }).toList();
    return cats;
  }
}
