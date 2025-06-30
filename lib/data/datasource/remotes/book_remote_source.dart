import 'package:dartz/dartz.dart';
import 'package:palm_book/core/configs/main_setup.dart';
import 'package:palm_book/core/errors/response_error.dart';
import 'package:palm_book/core/utils/http_client.dart';
import 'package:palm_book/core/utils/response_parse.dart';
import 'package:palm_book/data/model/dto/book_model_dto.dart';

abstract class BookRemoteSource {
  Future<Either<ResponseException, List<BookModelDto>>> getBooks({
    required int page,
    required String search,
  });
  Future<Either<ResponseException, BookModelDto>> getBook(int id);
}

class BookRemoteSourceImpl extends BookRemoteSource {
  final HttpClient dio;

  BookRemoteSourceImpl(this.dio);

  @override
  Future<Either<ResponseException, BookModelDto>> getBook(int id) async {
    try {
      final response = await dio.get("${MainSetup.baseUrl}/books/$id");

      if (response.statusCode == 200) {
        return Right(BookModelDto.fromJson(response.data));
      }

      return Left(
        ResponseException(
          statusCode: response.statusCode ?? 0,
          message: ResponseParse.messageParse(response.data),
        ),
      );
    } catch (e) {
      return Left(ResponseException(statusCode: 0, message: e.toString()));
    }
  }

  @override
  Future<Either<ResponseException, List<BookModelDto>>> getBooks({
    required int page,
    required String search,
  }) async {
    try {
      final response = await dio.get(
        "${MainSetup.baseUrl}/books",
        query: {'page': page.toString(), 'search': search},
      );

      if (response.statusCode == 200) {
        return Right(
          List<BookModelDto>.from(
            ResponseParse.dataParse(
              response.data,
            ).map((e) => BookModelDto.fromJson(e)),
          ).toList(),
        );
      }

      return Left(
        ResponseException(
          statusCode: response.statusCode ?? 0,
          message: ResponseParse.messageParse(response.data),
        ),
      );
    } catch (e) {
      return Left(ResponseException(statusCode: 0, message: e.toString()));
    }
  }
}
