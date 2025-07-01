import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';
import 'package:palm_book/domain/usecases/liked_book_usecase.dart';

@GenerateMocks([LikedBookRepository])
import 'liked_book_usecase_test.mocks.dart';

void main() {
  late LikedBookUsecase likedBookUsecase;
  late MockLikedBookRepository mockLikedBookRepository;

  setUp(() {
    mockLikedBookRepository = MockLikedBookRepository();
    likedBookUsecase = LikedBookUsecase(mockLikedBookRepository);
  });

  final book = LikedBookEntity(id: 1, title: "Test", imageUrl: "", authors: []);

  test('Should return Right(true) when repository is successful', () {
    // Arrange
    when(
      mockLikedBookRepository.saveLikedBook(book),
    ).thenAnswer((_) => Right(true));

    // Act
    final result = likedBookUsecase(book);

    // Assert
    expect(result, Right(true));
    verify(mockLikedBookRepository.saveLikedBook(book));
    verifyNoMoreInteractions(mockLikedBookRepository);
  });

  test('Should return Left(String) when repository fails', () async {
    // Arrange
    const errorMessage = 'exception';
    when(
      mockLikedBookRepository.saveLikedBook(book),
    ).thenAnswer((_) => Left(errorMessage));

    // Act
    final result = likedBookUsecase(book);

    // Assert
    expect(result, Left(errorMessage));
    verify(mockLikedBookRepository.saveLikedBook(book));
    verifyNoMoreInteractions(mockLikedBookRepository);
  });
}
