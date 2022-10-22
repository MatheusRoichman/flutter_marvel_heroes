class Category {
  String name;
  String displayName;

  Category({
    required this.name,
    required this.displayName,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      displayName: map['display_name'],
    );
  }
}
