import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';
import 'package:palm_book/domain/usecases/delete_liked_book_usecase.dart';

@GenerateMocks([LikedBookRepository])
import 'delete_liked_book_usecase_test.mocks.dart';

void main() {
  late DeleteLikedBookUsecase deleteLikedBookUsecase;
  late MockLikedBookRepository mockLikedBookRepository;

  setUp(() {
    mockLikedBookRepository = MockLikedBookRepository();
    deleteLikedBookUsecase = DeleteLikedBookUsecase(mockLikedBookRepository);
  });

  final bookId = 1;

  test('Should return Right(true) when repository is successful', () {
    // Arrange
    when(
      mockLikedBookRepository.deleteLikedBook(bookId),
    ).thenAnswer((_) => Right(true));

    // Act
    final result = deleteLikedBookUsecase(bookId);

    // Assert
    expect(result, Right(true));
    verify(mockLikedBookRepository.deleteLikedBook(bookId));
    verifyNoMoreInteractions(mockLikedBookRepository);
  });

  test('Should return Left(String) when repository fails', () async {
    // Arrange
    const errorMessage = 'exception';
    when(
      mockLikedBookRepository.deleteLikedBook(bookId),
    ).thenAnswer((_) => Left(errorMessage));

    // Act
    final result = deleteLikedBookUsecase(bookId);

    // Assert
    expect(result, Left(errorMessage));
    verify(mockLikedBookRepository.deleteLikedBook(bookId));
    verifyNoMoreInteractions(mockLikedBookRepository);
  });
}
