import 'package:palm_book/data/model/dto/author_model_dto.dart';
import 'package:palm_book/data/model/dto/formats_model_dto.dart';
import 'package:palm_book/domain/entities/book_entity.dart';

class BookModelDto extends BookEntity {
  BookModelDto({
    required super.id,
    required super.title,
    required super.authors,
    required super.summaries,
    required super.subjects,
    required super.bookshelves,
    required super.languages,
    required super.copyright,
    required super.mediaType,
    required super.formats,
    required super.downloadCount,
  });

  factory BookModelDto.fromJson(Map<String, dynamic> json) {
    return BookModelDto(
      id: json['id'],
      title: json['title'],
      authors: (json['authors'] as List)
          .map((author) => AuthorModelDto.fromJson(author))
          .toList(),
      summaries: List<String>.from(json['summaries']),
      subjects: List<String>.from(json['subjects']),
      bookshelves: List<String>.from(json['bookshelves']),
      languages: List<String>.from(json['languages']),
      copyright: json['copyright'],
      mediaType: json['media_type'],
      formats: FormatModelDto.fromJson(json['formats']),
      downloadCount: json['download_count'],
    );
  }
}
