import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';

class DeleteLikedBookUsecase {
  final LikedBookRepository repository;

  DeleteLikedBookUsecase(this.repository);

  Either<String, bool> call(int id) {
    return repository.deleteLikedBook(id);
  }
}
