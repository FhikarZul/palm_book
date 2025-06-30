import 'package:dartz/dartz.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';

abstract class LikedBookRepository {
  Either<String, List<LikedBookEntity>> getLikedBooks();
  Either<String, bool> saveLikedBook(LikedBookEntity book);
  Either<String, bool> deleteLikedBook(int id);
  Either<String, bool> checkIsLikedBook(int id);
}
