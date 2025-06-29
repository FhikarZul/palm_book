import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/entities/book_entity.dart';

abstract class BookRepository {
  Future<Either<String, List<BookEntity>>> getBooks({
    required int page,
    required String search,
  });
  Future<Either<String, BookEntity>> getBook(int id);
}
