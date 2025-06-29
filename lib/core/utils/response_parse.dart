import 'dart:convert';

class ResponseParse {
  static dynamic dataParse(String source) {
    final meta = jsonDecode(source)['results'];
    return meta;
  }

  static dynamic messageParse(String source) {
    final meta = jsonDecode(source)['detail'];
    return meta;
  }
}
