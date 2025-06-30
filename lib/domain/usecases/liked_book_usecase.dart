import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';

class LikedBookUsecase {
  final LikedBookRepository repository;

  LikedBookUsecase(this.repository);

  Either<String, bool> call(LikedBookEntity book) {
    return repository.saveLikedBook(book);
  }
}
