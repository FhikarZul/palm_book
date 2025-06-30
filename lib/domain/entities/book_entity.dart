import 'package:palm_book/domain/entities/author_entity.dart';
import 'package:palm_book/domain/entities/formats_entity.dart';

class BookEntity {
  final int id;
  final String title;
  final List<AuthorEntity> authors;
  final List<String> summaries;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final FormatEntity formats;
  final int downloadCount;

  BookEntity({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  factory BookEntity.initial() {
    return BookEntity(
      id: 0,
      title: '',
      authors: [],
      summaries: [],
      subjects: [],
      bookshelves: [],
      languages: [],
      copyright: false,
      mediaType: '',
      formats: FormatEntity(),
      downloadCount: 0,
    );
  }
}
