class Film {
  int id;
  String name;
  int releaseYear;
  String description;
  String bannerUrl;

  Film({
    required this.id,
    required this.name,
    required this.releaseYear,
    required this.description,
    required this.bannerUrl,
  });

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      id: map['id'],
      name: map['name'],
      releaseYear: map['releaseYear'],
      description: map['description'],
      bannerUrl: map['banner_url'],
    );
  }
}
