class Ability {
  String name;
  int level;
  int maxLevel;

  Ability({
    required this.name,
    required this.level,
    required this.maxLevel,
  });

  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'],
      level: map['level'],
      maxLevel: map['max_level'],
    );
  }
}
