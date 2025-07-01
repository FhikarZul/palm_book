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
    required super.formats,
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
      formats: FormatModelDto.fromJson(json['formats']),
    );
  }
}
