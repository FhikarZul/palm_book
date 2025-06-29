import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';

class GetBooksUsecase {
  final BookRepository repository;

  GetBooksUsecase(this.repository);

  Future<Either<String, List<BookEntity>>> call({
    required int page,
    required String search,
  }) {
    return repository.getBooks(page: page, search: search);
  }
}
