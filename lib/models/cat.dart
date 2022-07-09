import 'dart:convert';
import 'package:wiet_corp/models/breed.dart';

Cat catsFromJson(String str) => Cat.fromJson(json.decode(str));

class Cat {
  Cat({
    this.breeds,
    this.id,
    this.url,
  });

  Breed? breeds;
  String? id;
  String? url;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        breeds: json["breeds"][0],
        id: json["id"],
        url: json["url"],
      );
}
