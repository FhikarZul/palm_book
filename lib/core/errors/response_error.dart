import 'package:palm_book/core/configs/log.dart';
import 'package:palm_book/core/constants/error_response_type.dart';

class ResponseException implements Exception {
  String internalMessage = "";
  String message = "";
  ErrorResponseType errorType = ErrorResponseType.internal;

  ResponseException({required int statusCode, String? message}) {
    switch (statusCode) {
      case 401:
        errorType = ErrorResponseType.unauthorized;
        this.message = "Your session has expired";
        break;
      case 400:
        errorType = ErrorResponseType.badRequest;
        this.message = "Bad request";
        break;
      case 403:
        errorType = ErrorResponseType.forbidden;
        this.message = "Access denied";
        break;
      case 404:
        errorType = ErrorResponseType.notfound;
        this.message = "Not found";
        break;
      case 409:
        errorType = ErrorResponseType.conflict;
        this.message = "A conflict has occurred";
        break;
      case 500:
        errorType = ErrorResponseType.server;
        this.message = "Server error occurred";
        break;
      default:
        errorType = ErrorResponseType.internal;
        this.message = "An internal error occurred";
    }

    internalMessage = message ?? "N/A";

    _logError();
  }

  void _logError() {
    Log.create(
      'API Exception - Type: ${errorType.name}, Message: $internalMessage',
    );
  }
}
