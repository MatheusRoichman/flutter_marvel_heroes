import 'dart:convert';

import 'ability_model.dart';

class Character {
  int id;
  String realName;
  String characterName;
  String imageUrl;
  int age;
  int weight;
  double height;
  String homePlanet;
  String description;
  List<Ability> abilities;
  List<int> filmIds;

  Character({
    required this.id,
    required this.realName,
    required this.characterName,
    required this.imageUrl,
    required this.age,
    required this.weight,
    required this.height,
    required this.homePlanet,
    required this.description,
    required this.abilities,
    required this.filmIds,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      realName: map['realName'],
      characterName: map['characterName'],
      imageUrl: map['imageUrl'],
      age: map['age'],
      weight: map['weight'],
      height: map['height'],
      homePlanet: map['homePlanet'],
      description: map['description'],
      abilities: List<Ability>.from(map['abilities']?.map((x) => Ability.fromMap(x))),
      filmIds: List<int>.from(map['filmIds']),
    );
  }

  factory Character.fromJson(String source) => Character.fromMap(json.decode(source));
}
