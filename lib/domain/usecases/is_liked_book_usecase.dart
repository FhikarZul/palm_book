import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';

class IsLikedBookUsecase {
  final LikedBookRepository repository;

  IsLikedBookUsecase(this.repository);

  Either<String, bool> call(int id) {
    return repository.checkIsLikedBook(id);
  }
}
