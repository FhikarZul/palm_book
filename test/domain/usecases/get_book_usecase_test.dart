import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/domain/entities/author_entity.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/entities/formats_entity.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';
import 'package:palm_book/domain/usecases/get_book_usecase.dart';

@GenerateMocks([BookRepository])
import 'get_book_usecase_test.mocks.dart';

void main() {
  late GetBookUsecase getBookUsecase;
  late MockBookRepository mockBookRepository;

  setUp(() {
    mockBookRepository = MockBookRepository();
    getBookUsecase = GetBookUsecase(mockBookRepository);
  });

  final bookId = 1;
  final List<AuthorEntity> authorEntity = [];
  final formatEntity = FormatEntity(plainText: "test", imageJpeg: "test");
  final bookEntity = BookEntity(
    id: 1,
    title: "Test",
    authors: authorEntity,
    summaries: [],
    subjects: [],
    formats: formatEntity,
  );

  test(
    'Should return Right(BookEntity) when repository is successful',
    () async {
      // Arrange
      when(
        mockBookRepository.getBook(bookId),
      ).thenAnswer((_) async => Right(bookEntity));

      // Act
      final result = await getBookUsecase(bookId);

      // Assert
      expect(result, Right(bookEntity));
      verify(mockBookRepository.getBook(bookId));
      verifyNoMoreInteractions(mockBookRepository);
    },
  );

  test('Should return Left(String) when repository fails', () async {
    // Arrange
    const errorMessage = 'Book not found';
    when(
      mockBookRepository.getBook(bookId),
    ).thenAnswer((_) async => Left(errorMessage));

    // Act
    final result = await getBookUsecase(bookId);

    // Assert
    expect(result, Left(errorMessage));
    verify(mockBookRepository.getBook(bookId));
    verifyNoMoreInteractions(mockBookRepository);
  });
}
