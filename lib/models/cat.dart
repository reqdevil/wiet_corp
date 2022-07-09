import 'package:wiet_corp/models/breed.dart';

List<Cat> catsFromJson(List<dynamic> json) =>
    List<Cat>.from(json.map((x) => Cat.fromJson(x)));

class Cat {
  Cat({
    this.breeds,
    required this.id,
    this.url,
    this.hasError = false,
  });

  Breed? breeds;
  String id;
  String? url;
  bool hasError;

  factory Cat.fromJson(Map<String, dynamic> json) {
    List<dynamic> breedList = json["breeds"];

    Breed? breed = breedList.isEmpty ? null : Breed.fromJson(breedList[0]);

    return Cat(
      breeds: breed,
      id: json["id"],
      url: json["url"],
    );
  }
}
