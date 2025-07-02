import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/core/errors/response_error.dart';
import 'package:palm_book/data/datasource/remotes/book_remote_source.dart';
import 'package:palm_book/data/model/dto/author_model_dto.dart';
import 'package:palm_book/data/model/dto/book_model_dto.dart';
import 'package:palm_book/data/model/dto/formats_model_dto.dart';
import 'package:palm_book/data/repositories/book_repository_impl.dart';
import 'package:palm_book/domain/entities/book_entity.dart';

@GenerateMocks([BookRemoteSource])
import 'book_repository_impl_test.mocks.dart';

void main() {
  late BookRepositoryImpl bookRepositoryImpl;
  late MockBookRemoteSource mockBookRemoteSource;

  setUp(() {
    mockBookRemoteSource = MockBookRemoteSource();
    bookRepositoryImpl = BookRepositoryImpl(mockBookRemoteSource);
  });

  final bookId = 1;
  final List<AuthorModelDto> authorModelDto = [];
  final formatModelDto = FormatModelDto(plainText: "test", imageJpeg: "test");
  final bookModelDto = BookModelDto(
    id: 1,
    title: "Test",
    authors: authorModelDto,
    summaries: [],
    subjects: [],
    formats: formatModelDto,
  );
  final List<BookModelDto> bookListModelDto = [bookModelDto];
  final bookEntity = BookEntity(
    id: 1,
    title: "Test",
    authors: authorModelDto.map((e) => e.toEntity()).toList(),
    summaries: [],
    subjects: [],
    formats: formatModelDto.toEntity(),
  );
  final List<BookEntity> bookListEntity = [bookEntity];

  group('getBook', () {
    test(
      'Should return Right(BookEntity) when remotesource successful',
      () async {
        // Arrange
        when(
          mockBookRemoteSource.getBook(bookId),
        ).thenAnswer((_) async => Right(bookModelDto));

        // Act
        final result = await bookRepositoryImpl.getBook(bookId);

        // Assert
        expect(result, Right(bookEntity));
        verify(mockBookRemoteSource.getBook(bookId));
      },
    );

    test('Should return Left(Not found) when remotesource fails', () async {
      // Arrange
      when(
        mockBookRemoteSource.getBook(bookId),
      ).thenAnswer((_) async => Left(ResponseException(statusCode: 404)));

      // Act
      final result = await bookRepositoryImpl.getBook(bookId);

      // Assert
      expect(result, Left("Not found"));
      verify(mockBookRemoteSource.getBook(bookId));
    });
  });

  group('getBooks', () {
    test(
      'Should return (List BookEntity) when remotesource successful',
      () async {
        // Arrange
        when(
          mockBookRemoteSource.getBooks(page: 1, search: ""),
        ).thenAnswer((_) async => Right(bookListModelDto));

        // Act
        final result = await bookRepositoryImpl.getBooks(page: 1, search: "");

        // Assert
        result.fold(
          (e) {
            fail(e);
          },
          (data) {
            expect(data, bookListEntity);
          },
        );
        verify(mockBookRemoteSource.getBooks(page: 1, search: ""));
      },
    );

    test('Should return Left(Not found) when remotesource fails', () async {
      // Arrange
      when(
        mockBookRemoteSource.getBooks(page: 1, search: ""),
      ).thenAnswer((_) async => Left(ResponseException(statusCode: 404)));

      // Act
      final result = await bookRepositoryImpl.getBooks(page: 1, search: "");

      // Assert
      expect(result, Left("Not found"));
      verify(mockBookRemoteSource.getBooks(page: 1, search: ""));
    });
  });
}
