import 'package:palm_book/domain/entities/author_entity.dart';
import 'package:palm_book/domain/entities/formats_entity.dart';

class BookEntity {
  final int id;
  final String title;
  final List<AuthorEntity> authors;
  final List<String> summaries;
  final List<String> subjects;
  final FormatEntity formats;

  BookEntity({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.subjects,
    required this.formats,
  });

  factory BookEntity.initial() {
    return BookEntity(
      id: 0,
      title: '',
      authors: [],
      summaries: [],
      subjects: [],
      formats: FormatEntity(),
    );
  }
}
