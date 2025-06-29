class ResponseParse {
  static dynamic dataParse(dynamic source) {
    final meta = source['results'];
    return meta;
  }

  static dynamic messageParse(dynamic source) {
    final meta = source['detail'];
    return meta;
  }
}
