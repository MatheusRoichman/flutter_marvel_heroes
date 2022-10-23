class Film {
  int id;
  String name;
  int releaseYear;
  String description;
  String imageUrl;

  Film({
    required this.id,
    required this.name,
    required this.releaseYear,
    required this.description,
    required this.imageUrl,
  });

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      id: map['id'],
      name: map['name'],
      releaseYear: map['release_year'],
      description: map['description'],
      imageUrl: map['image_url'],
    );
  }
}
