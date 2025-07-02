import 'package:dartz/dartz.dart';
import 'package:palm_book/data/datasource/remotes/book_remote_source.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  final BookRemoteSource remoteSource;

  BookRepositoryImpl(this.remoteSource);

  @override
  Future<Either<String, BookEntity>> getBook(int id) async {
    final result = await remoteSource.getBook(id);

    return result.fold(
      (error) {
        return Left(error.message);
      },
      (data) {
        return Right(data.toEntity());
      },
    );
  }

  @override
  Future<Either<String, List<BookEntity>>> getBooks({
    required int page,
    required String search,
  }) async {
    final result = await remoteSource.getBooks(page: page, search: search);

    return result.fold(
      (error) {
        return Left(error.message);
      },
      (data) {
        return Right(data.map((e) => e.toEntity()).toList());
      },
    );
  }
}
