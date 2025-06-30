import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HttpClient {
  final Dio _dio = Dio();
  final SharedPreferences _prefs;

  HttpClient(this._prefs);

  Future<Response> get(String url, {Map<String, dynamic>? query}) async {
    final fullQuery = {...?query};
    final fullUrl = Uri.parse(
      url,
    ).replace(queryParameters: fullQuery).toString();

    try {
      final response = await _dio.get(url, queryParameters: fullQuery);
      _prefs.setString(fullUrl, jsonEncode(response.data));
      return response;
    } on DioException {
      final cached = _prefs.getString(fullUrl);
      if (cached != null) {
        return Response(
          data: jsonDecode(cached),
          statusCode: 200,
          requestOptions: RequestOptions(path: fullUrl),
        );
      }
      rethrow;
    }
  }
}
