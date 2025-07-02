import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palm_book/core/constants/error_response_type.dart';
import 'package:palm_book/core/utils/http_client.dart';
import 'package:palm_book/data/datasource/remotes/book_remote_source.dart';

@GenerateNiceMocks([MockSpec<HttpClient>()])
import 'book_remote_source_test.mocks.dart';

void main() {
  late BookRemoteSourceImpl bookRemoteSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    bookRemoteSourceImpl = BookRemoteSourceImpl(mockHttpClient);
  });

  const bookId = 1;
  final json =
      '''
  {
    "id": $bookId,
    "title": "Moby Dick; Or, The Whale",
    "authors": [
      {
        "name": "Melville, Herman",
        "birth_year": 1819,
        "death_year": 1891
      }
    ],
    "summaries": [
      "Lorem"
    ],
    "subjects": [
      "Adventure stories",
      "Ahab, Captain (Fictitious character) -- Fiction"
    ],
    "formats": {
      "text/plain; charset=us-ascii": "https://www.gutenberg.org/ebooks/2701.txt.utf-8",
      "image/jpeg": "https://www.gutenberg.org/cache/epub/2701/pg2701.cover.medium.jpg"
    }
  }
  ''';

  final jsonList =
      '''
  {
    "results":[
      {
        "id": $bookId,
        "title": "Moby Dick; Or, The Whale",
        "authors": [
          {
            "name": "Melville, Herman",
            "birth_year": 1819,
            "death_year": 1891
          }
        ],
        "summaries": [
          "Lorem"
        ],
        "subjects": [
          "Adventure stories",
          "Ahab, Captain (Fictitious character) -- Fiction"
        ],
        "formats": {
          "text/plain; charset=us-ascii": "https://www.gutenberg.org/ebooks/2701.txt.utf-8",
          "image/jpeg": "https://www.gutenberg.org/cache/epub/2701/pg2701.cover.medium.jpg"
        }
      }
    ]
  }
  ''';

  final response = jsonDecode(json);
  final responseList = jsonDecode(jsonList);
  final url1 = "/books/$bookId";
  final url2 = "/books";

  group('getBook', () {
    test(
      'Should return a correct response when the http call is successful',
      () async {
        // Arrange
        when(mockHttpClient.get(url1)).thenAnswer(
          (_) async => Response(
            data: response,
            statusCode: 200,
            requestOptions: RequestOptions(path: url1),
          ),
        );

        // Act
        final result = await bookRemoteSourceImpl.getBook(bookId);

        // Assert
        result.fold(
          (e) => fail("Test failed with error: ${e.internalMessage}"),
          (data) {
            expect(data.id, bookId);
            expect(data.title, "Moby Dick; Or, The Whale");
          },
        );
      },
    );

    test('Should return error server when the http call is fails', () async {
      // Arrange
      when(mockHttpClient.get(url1)).thenAnswer(
        (_) async => Response(
          data: response,
          statusCode: 500,
          requestOptions: RequestOptions(path: url1),
        ),
      );

      // Act
      final result = await bookRemoteSourceImpl.getBook(bookId);

      // Assert
      result.fold((e) {
        expect(e.errorType, ErrorResponseType.server);
      }, (_) {});
    });
  });

  group('getBooks', () {
    test(
      'Should return a correct response when the http call is successful',
      () async {
        // Arrange
        when(
          mockHttpClient.get('/books', query: {'page': '1', 'search': ''}),
        ).thenAnswer(
          (_) async => Response(
            data: responseList,
            statusCode: 200,
            requestOptions: RequestOptions(path: url2),
          ),
        );

        // Act
        final result = await bookRemoteSourceImpl.getBooks(page: 1, search: "");

        // Assert
        result.fold(
          (e) => fail("Test failed with error: ${e.internalMessage}"),
          (data) {
            expect(data.first.id, bookId);
            expect(data.first.title, "Moby Dick; Or, The Whale");
          },
        );
      },
    );

    test('Should return error server when the http call is fails', () async {
      // Arrange
      when(
        mockHttpClient.get('/books', query: {'page': '1', 'search': ''}),
      ).thenAnswer(
        (_) async => Response(
          data: responseList,
          statusCode: 500,
          requestOptions: RequestOptions(path: '/books'),
        ),
      );

      // Act
      final result = await bookRemoteSourceImpl.getBooks(page: 1, search: '');

      // Assert
      result.fold((e) {
        expect(e.errorType, ErrorResponseType.server);
      }, (_) {});
    });
  });
}
