import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/data/datasource/locals/liked_book_local_source.dart';
import 'package:palm_book/data/model/dao/liked_book_dao.dart';

@GenerateMocks([Box<LikedBookDao>])
import 'liked_book_local_source_test.mocks.dart';

void main() {
  late LikedBookLocalSourceImpl localSource;
  late MockBox<LikedBookDao> mockBox;

  final testBook = LikedBookDao(
    bookId: 1,
    title: "Book",
    createdAt: DateTime.now(),
    imageUrl: '',
    authors: [],
  );

  setUp(() {
    mockBox = MockBox<LikedBookDao>();
    localSource = LikedBookLocalSourceImpl(mockBox);
  });

  group('getLikedBooks', () {
    test('should return list of liked books sorted by createdAt desc', () {
      // Arrange
      final books = [
        LikedBookDao(
          bookId: 1,
          title: "Book1",
          authors: [],
          imageUrl: "",
          createdAt: DateTime(2023, 1, 1),
        ),
        LikedBookDao(
          bookId: 2,
          title: "Book2",
          authors: [],
          imageUrl: "",
          createdAt: DateTime(2023, 1, 3),
        ),
        LikedBookDao(
          bookId: 3,
          title: "Book3",
          authors: [],
          imageUrl: "",
          createdAt: DateTime(2023, 1, 2),
        ),
      ];

      when(mockBox.values).thenReturn(books);

      // Act
      final result = localSource.getLikedBooks();

      // Assert
      result.fold((fail) => fail, (result) {
        expect(result.length, 3);
        expect(result[0].bookId, 2);
        expect(result[1].bookId, 3);
        expect(result[2].bookId, 1);
      });
    });

    test('should return exception when error occurs', () {
      // Arrange
      when(mockBox.values).thenThrow(Exception('Database error'));

      // Act
      final result = localSource.getLikedBooks();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, isA<Exception>()),
        (_) => fail('should return error'),
      );
    });
  });

  group('saveLikedBook', () {
    test('should return true when book is saved successfully', () {
      // Arrange
      when(mockBox.put(any, any)).thenAnswer((_) async {});

      // Act
      final result = localSource.saveLikedBook(testBook);

      // Assert
      expect(result, Right(true));
      verify(mockBox.put(testBook.bookId, testBook)).called(1);
    });

    test('should return exception when save fails', () {
      // Arrange
      when(mockBox.put(any, any)).thenThrow(Exception('Save failed'));

      // Act
      final result = localSource.saveLikedBook(testBook);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, isA<Exception>()),
        (_) => fail('should return error'),
      );
    });
  });

  group('deleteLikedBook', () {
    test('should return true when book is deleted successfully', () {
      // Arrange
      when(mockBox.delete(any)).thenAnswer((_) async {});

      // Act
      final result = localSource.deleteLikedBook(1);

      // Assert
      expect(result, Right(true));
      verify(mockBox.delete(1)).called(1);
    });

    test('should return exception when delete fails', () {
      // Arrange
      when(mockBox.delete(any)).thenThrow(Exception('Delete failed'));

      // Act
      final result = localSource.deleteLikedBook(1);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, isA<Exception>()),
        (_) => fail('should return error'),
      );
    });
  });

  group('checkIsLikedBook', () {
    test('should return true when book exists', () {
      // Arrange
      when(mockBox.containsKey(any)).thenReturn(true);

      // Act
      final result = localSource.checkIsLikedBook(1);

      // Assert
      expect(result, Right(true));
      verify(mockBox.containsKey(1)).called(1);
    });

    test('should return false when book does not exist', () {
      // Arrange
      when(mockBox.containsKey(any)).thenReturn(false);

      // Act
      final result = localSource.checkIsLikedBook(1);

      // Assert
      expect(result, Right(false));
    });

    test('should return exception when check fails', () {
      // Arrange
      when(mockBox.containsKey(any)).thenThrow(Exception('Check failed'));

      // Act
      final result = localSource.checkIsLikedBook(1);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, isA<Exception>()),
        (_) => fail('should return error'),
      );
    });
  });
}
