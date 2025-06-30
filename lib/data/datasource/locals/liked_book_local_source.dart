import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:palm_book/data/models/dao/liked_book_dao.dart';

abstract class LikedBookLocalSource {
  Either<Exception, List<LikedBookDao>> getLikedBooks();
  Either<Exception, bool> saveLikedBook(LikedBookDao book);
  Either<Exception, bool> deleteLikedBook(int id);
  Either<Exception, bool> checkIsLikedBook(int id);
}

class LikedBookLocalSourceImpl extends LikedBookLocalSource {
  final Box<LikedBookDao> box;

  LikedBookLocalSourceImpl(this.box);

  @override
  Either<Exception, bool> deleteLikedBook(int id) {
    try {
      box.delete(id);

      return Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Either<Exception, List<LikedBookDao>> getLikedBooks() {
    try {
      List<LikedBookDao> books = box.values.toList();

      return Right(books);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Either<Exception, bool> saveLikedBook(LikedBookDao book) {
    try {
      box.put(book.bookId, book);

      return Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Either<Exception, bool> checkIsLikedBook(int id) {
    try {
      bool isLiked = box.containsKey(id);

      return Right(isLiked);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
