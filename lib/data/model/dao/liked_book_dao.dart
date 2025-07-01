import 'package:hive/hive.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';

part 'liked_book_dao.g.dart';

@HiveType(typeId: 0)
class LikedBookDao extends HiveObject {
  @HiveField(0)
  final int bookId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final List<String> authors;

  @HiveField(4)
  final DateTime createdAt;

  LikedBookDao({
    required this.bookId,
    required this.title,
    required this.imageUrl,
    required this.authors,
    required this.createdAt,
  });

  LikedBookEntity toEntity() {
    return LikedBookEntity(
      id: bookId,
      title: title,
      imageUrl: imageUrl,
      authors: authors,
    );
  }
}
