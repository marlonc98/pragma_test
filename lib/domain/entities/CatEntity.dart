class CatEntity {
  String id;
  String name;
  String? origin;
  String? countryCode;
  String? description;
  String image;
  double? height;
  String? lifeSpan;
  double? weight;
  int? adaptability;
  int? intelligence;
  int? affectionLevel;
  int? childFriendly;

  CatEntity({
    required this.id,
    required this.name,
    required this.image,
    this.origin,
    this.countryCode,
    this.description,
    this.height,
    this.lifeSpan,
    this.weight,
    this.adaptability,
    this.intelligence,
    this.affectionLevel,
    this.childFriendly,
  });
}
