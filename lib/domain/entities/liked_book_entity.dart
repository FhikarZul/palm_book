import 'package:equatable/equatable.dart';

class LikedBookEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final List<String> authors;

  const LikedBookEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.authors,
  });

  @override
  List<Object?> get props => [id, title, imageUrl, authors];
}
