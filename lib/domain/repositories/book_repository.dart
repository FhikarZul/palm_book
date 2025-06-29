import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/entities/book_entity.dart';

abstract class BookRepository {
  Future<Either<String, List<BookEntity>>> getBooks(int page);
  Future<Either<String, BookEntity>> getBook(int id);
}
