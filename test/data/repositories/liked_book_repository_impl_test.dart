import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/data/datasource/locals/liked_book_local_source.dart';
import 'package:palm_book/data/model/dao/liked_book_dao.dart';
import 'package:palm_book/data/repositories/liked_book_repository_impl.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';

@GenerateMocks([LikedBookLocalSource])
import 'liked_book_repository_impl_test.mocks.dart';

void main() {
  late LikedBookRepositoryImpl repository;
  late MockLikedBookLocalSource mockLocalSource;

  final testEntity = LikedBookEntity(
    id: 1,
    title: "Test Book",
    imageUrl: "http://example.com/image.jpg",
    authors: ["Author 1", "Author 2"],
  );

  final testDao = LikedBookDao(
    bookId: 1,
    title: "Test Book",
    imageUrl: "http://example.com/image.jpg",
    authors: ["Author 1", "Author 2"],
    createdAt: DateTime.now(),
  );

  setUp(() {
    mockLocalSource = MockLikedBookLocalSource();
    repository = LikedBookRepositoryImpl(mockLocalSource);
  });

  group('getLikedBooks', () {
    test('should return list of LikedBookEntity when successful', () {
      // Arrange
      final daos = [
        testDao,
        LikedBookDao(
          bookId: 2,
          title: "Another Book",
          imageUrl: "http://example.com/another.jpg",
          authors: ["Author 3"],
          createdAt: DateTime.now(),
        ),
      ];

      when(mockLocalSource.getLikedBooks()).thenReturn(Right(daos));

      // Act
      final result = repository.getLikedBooks();

      // Assert
      result.fold((error) => fail('should not return error'), (entities) {
        expect(entities.length, 2);
        expect(entities[0].id, 1);
        expect(entities[0].title, "Test Book");
        expect(entities[1].id, 2);
      });
    });

    test('should return error message when local source fails', () {
      // Arrange
      when(
        mockLocalSource.getLikedBooks(),
      ).thenReturn(Left(Exception('Database error')));

      // Act
      final result = repository.getLikedBooks();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, 'Exception: Database error'),
        (_) => fail('should return error'),
      );
    });
  });

  group('saveLikedBook', () {
    test('should return true when book is saved successfully', () {
      // Arrange
      when(mockLocalSource.saveLikedBook(any)).thenReturn(Right(true));

      // Act
      final result = repository.saveLikedBook(testEntity);

      // Assert
      expect(result, Right(true));
      verify(
        mockLocalSource.saveLikedBook(
          argThat(
            isA<LikedBookDao>()
                .having((d) => d.bookId, 'bookId', testEntity.id)
                .having((d) => d.title, 'title', testEntity.title),
          ),
        ),
      ).called(1);
    });

    test('should return error message when save fails', () {
      // Arrange
      when(
        mockLocalSource.saveLikedBook(any),
      ).thenReturn(Left(Exception('Save failed')));

      // Act
      final result = repository.saveLikedBook(testEntity);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, 'Exception: Save failed'),
        (_) => fail('should return error'),
      );
    });
  });

  group('deleteLikedBook', () {
    test('should return true when book is deleted successfully', () {
      // Arrange
      when(mockLocalSource.deleteLikedBook(any)).thenReturn(Right(true));

      // Act
      final result = repository.deleteLikedBook(1);

      // Assert
      expect(result, Right(true));
      verify(mockLocalSource.deleteLikedBook(1)).called(1);
    });

    test('should return error message when delete fails', () {
      // Arrange
      when(
        mockLocalSource.deleteLikedBook(any),
      ).thenReturn(Left(Exception('Delete failed')));

      // Act
      final result = repository.deleteLikedBook(1);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, 'Exception: Delete failed'),
        (_) => fail('should return error'),
      );
    });
  });

  group('checkIsLikedBook', () {
    test('should return true when book exists', () {
      // Arrange
      when(mockLocalSource.checkIsLikedBook(any)).thenReturn(Right(true));

      // Act
      final result = repository.checkIsLikedBook(1);

      // Assert
      expect(result, Right(true));
      verify(mockLocalSource.checkIsLikedBook(1)).called(1);
    });

    test('should return false when book does not exist', () {
      // Arrange
      when(mockLocalSource.checkIsLikedBook(any)).thenReturn(Right(false));

      // Act
      final result = repository.checkIsLikedBook(1);

      // Assert
      expect(result, Right(false));
    });

    test('should return error message when check fails', () {
      // Arrange
      when(
        mockLocalSource.checkIsLikedBook(any),
      ).thenReturn(Left(Exception('Check failed')));

      // Act
      final result = repository.checkIsLikedBook(1);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, 'Exception: Check failed'),
        (_) => fail('should return error'),
      );
    });
  });
}
