import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/domain/entities/author_entity.dart';
import 'package:palm_book/domain/entities/book_entity.dart';
import 'package:palm_book/domain/entities/formats_entity.dart';
import 'package:palm_book/domain/repositories/book_repository.dart';
import 'package:palm_book/domain/usecases/get_books_usecase.dart';

@GenerateMocks([BookRepository])
import 'get_books_usecase_test.mocks.dart';

void main() {
  late GetBooksUsecase getBooksUsecase;
  late MockBookRepository mockBookRepository;

  setUp(() {
    mockBookRepository = MockBookRepository();
    getBooksUsecase = GetBooksUsecase(mockBookRepository);
  });

  final page = 1;
  final search = "";
  final List<AuthorEntity> authorEntity = [];
  final formatEntity = FormatEntity(plainText: "test", imageJpeg: "test");
  final bookEntity1 = BookEntity(
    id: 1,
    title: "Test1",
    authors: authorEntity,
    summaries: [],
    subjects: [],
    formats: formatEntity,
  );
  final bookEntity2 = BookEntity(
    id: 2,
    title: "Test2",
    authors: authorEntity,
    summaries: [],
    subjects: [],
    formats: formatEntity,
  );
  List<BookEntity> books = [bookEntity1, bookEntity2];

  test(
    'Should return Right(List BookEntity) when repository is successful',
    () async {
      // Arrange
      when(
        mockBookRepository.getBooks(page: page, search: search),
      ).thenAnswer((_) async => Right(books));

      // Act
      final result = await getBooksUsecase(page: page, search: search);

      // Assert
      expect(result, Right(books));
      verify(mockBookRepository.getBooks(page: page, search: search));
      verifyNoMoreInteractions(mockBookRepository);
    },
  );

  test('Should return Left(String) when repository fails', () async {
    // Arrange
    const errorMessage = 'Invalid page';

    when(
      mockBookRepository.getBooks(page: page, search: search),
    ).thenAnswer((_) async => Left(errorMessage));

    // Act
    final result = await getBooksUsecase(page: page, search: search);

    // Assert
    expect(result, Left(errorMessage));
    verify(mockBookRepository.getBooks(page: page, search: search));
    verifyNoMoreInteractions(mockBookRepository);
  });
}
