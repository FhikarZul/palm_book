import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/domain/entities/liked_book_entity.dart';
import 'package:palm_book/domain/repositories/liked_book_repository.dart';
import 'package:palm_book/domain/usecases/get_liked_books_usecase.dart';

@GenerateMocks([LikedBookRepository])
import 'get_liked_books_usecase_test.mocks.dart';

void main() {
  late GetLikedBooksUsecase getLikedBooksUsecase;
  late MockLikedBookRepository mockLikedBookRepository;

  setUp(() {
    mockLikedBookRepository = MockLikedBookRepository();
    getLikedBooksUsecase = GetLikedBooksUsecase(mockLikedBookRepository);
  });

  final book1 = LikedBookEntity(
    id: 1,
    title: "Test1",
    authors: [],
    imageUrl: "",
  );

  final book2 = LikedBookEntity(
    id: 2,
    title: "Test2",
    authors: [],
    imageUrl: "",
  );

  final books = [book1, book2];

  test(
    'Should return Right(List LikedBookEntity) when repository is successful',
    () {
      // Arrange
      when(
        mockLikedBookRepository.getLikedBooks(),
      ).thenAnswer((_) => Right(books));

      // Act
      final result = getLikedBooksUsecase();

      // Assert
      expect(result, Right(books));
      verify(mockLikedBookRepository.getLikedBooks());
      verifyNoMoreInteractions(mockLikedBookRepository);
    },
  );

  test('Should return Left(String) when repository fails', () async {
    // Arrange
    const errorMessage = 'exception';
    when(
      mockLikedBookRepository.getLikedBooks(),
    ).thenAnswer((_) => Left(errorMessage));

    // Act
    final result = getLikedBooksUsecase();

    // Assert
    expect(result, Left(errorMessage));
    verify(mockLikedBookRepository.getLikedBooks());
    verifyNoMoreInteractions(mockLikedBookRepository);
  });
}
