import 'package:palm_book/data/model/dto/author_model_dto.dart';
import 'package:palm_book/data/model/dto/formats_model_dto.dart';
import 'package:palm_book/domain/entities/book_entity.dart';

class BookModelDto {
  final int id;
  final String title;
  final List<AuthorModelDto> authors;
  final List<String> summaries;
  final List<String> subjects;
  final FormatModelDto formats;

  BookModelDto({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.subjects,
    required this.formats,
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

  BookEntity toEntity() => BookEntity(
    id: id,
    title: title,
    authors: authors.map((e) => e.toEntity()).toList(),
    summaries: summaries,
    subjects: subjects,
    formats: formats.toEntity(),
  );
}
