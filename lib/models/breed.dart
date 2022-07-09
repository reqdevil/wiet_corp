import 'package:wiet_corp/models/weight.dart';

List<Breed> breedFromJson(List<dynamic> json) =>
    List<Breed>.from(json.map((x) => Breed.fromJson(x)));

class Breed {
  Breed({
    this.weight,
    this.id,
    this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
  });

  Weight? weight;
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? description;
  String? lifeSpan;

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        weight: Weight.fromJson(json["weight"]),
        id: json["id"],
        name: json["name"],
        temperament: json["temperament"],
        origin: json["origin"],
        description: json["description"],
        lifeSpan: json["life_span"],
      );
}
