class LikedBookEntity {
  final int id;
  final String title;
  final String imageUrl;
  final List<String> authors;

  LikedBookEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.authors,
  });
}
