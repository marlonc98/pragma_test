import 'package:pragma/domain/entities/CatEntity.dart';

class CatDto {
  static CatEntity fromJSON(Map<String, dynamic> json) {
    return CatEntity(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      countryCode: json['country_code'],
      image:
          "https://cdn2.thecatapi.com/images/${json['reference_image_id']}.jpg",
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      description: json['description'],
      height: json['height']['metric'],
      intelligence: json['intelligence'],
      lifeSpan: json['life_span'],
      weight: json['weight']['metric'],
    );
  }
}
