import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';

class GetLikedBooksUsecase {
  final LikedBookRepository repository;

  GetLikedBooksUsecase(this.repository);

  Either<String, List<LikedBookEntity>> call() {
    return repository.getLikedBooks();
  }
}
