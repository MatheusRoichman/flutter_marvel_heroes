class Ability {
  String name;
  int level;

  Ability({
    required this.name,
    required this.level,
  });

  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'],
      level: map['level'],
    );
  }
}
