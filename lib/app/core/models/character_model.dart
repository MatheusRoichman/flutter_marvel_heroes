import 'dart:convert';

import 'ability_model.dart';

class Character {
  int id;
  String realName;
  String characterName;
  String category;
  String imageUrl;
  int age;
  int weight;
  double height;
  String homePlanet;
  String description;
  List<Ability> abilities;
  List<int> films;

  Character({
    required this.id,
    required this.realName,
    required this.characterName,
    required this.category,
    required this.imageUrl,
    required this.age,
    required this.weight,
    required this.height,
    required this.homePlanet,
    required this.description,
    required this.abilities,
    required this.films,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      realName: map['real_name'],
      characterName: map['character_name'],
      category: map['category'],
      imageUrl: map['image_url'],
      age: map['age'],
      weight: map['weight'],
      height: map['height'],
      homePlanet: map['home_planet'],
      description: map['description'],
      abilities: List<Ability>.from(map['abilities']?.map((x) => Ability.fromMap(x))),
      films: List<int>.from(map['films']?.map((x) => x)),
    );
  }

  factory Character.fromJson(String source) => Character.fromMap(json.decode(source));
}
