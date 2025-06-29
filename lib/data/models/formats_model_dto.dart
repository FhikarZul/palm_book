import 'package:palm_book/domain/entities/formats_entity.dart';

class FormatModelDto extends FormatEntity {
  FormatModelDto({
    super.textHtml,
    super.epub,
    super.mobi,
    super.plainText,
    super.rdfXml,
    super.imageJpeg,
    super.octetStream,
  });

  factory FormatModelDto.fromJson(Map<String, dynamic> json) {
    return FormatModelDto(
      textHtml: json['text/html'],
      epub: json['application/epub+zip'],
      mobi: json['application/x-mobipocket-ebook'],
      plainText: json['text/plain; charset=us-ascii'],
      rdfXml: json['application/rdf+xml'],
      imageJpeg: json['image/jpeg'],
      octetStream: json['application/octet-stream'],
    );
  }
}
