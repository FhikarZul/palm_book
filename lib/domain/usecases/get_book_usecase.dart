import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';

class GetBookUsecase {
  final BookRepository repository;

  GetBookUsecase(this.repository);

  Future<Either<String, BookEntity>> call(int id) {
    return repository.getBook(id);
  }
}
