import 'package:dartz/dartz.dart';
import 'package:palm_book/data/datasource/locals/liked_book_local_source.dart';
import 'package:palm_book/data/models/dao/liked_book_dao.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';

class LikedBookRepositoryImpl extends LikedBookRepository {
  final LikedBookLocalSource localSource;

  LikedBookRepositoryImpl(this.localSource);

  @override
  Either<String, bool> checkIsLikedBook(int id) {
    final result = localSource.checkIsLikedBook(id);
    return result.fold(
      (error) {
        return Left(error.toString());
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Either<String, bool> deleteLikedBook(int id) {
    final result = localSource.deleteLikedBook(id);
    return result.fold(
      (error) {
        return Left(error.toString());
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Either<String, List<LikedBookEntity>> getLikedBooks() {
    final result = localSource.getLikedBooks();
    return result.fold(
      (error) {
        return Left(error.toString());
      },
      (data) {
        return Right(data.map((e) => e.toEntity()).toList());
      },
    );
  }

  @override
  Either<String, bool> saveLikedBook(LikedBookEntity book) {
    final toDao = LikedBookDao(
      bookId: book.id,
      title: book.title,
      imageUrl: book.imageUrl,
      authors: book.authors,
    );

    final result = localSource.saveLikedBook(toDao);
    return result.fold(
      (error) {
        return Left(error.toString());
      },
      (data) {
        return Right(data);
      },
    );
  }
}
