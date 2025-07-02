import 'package:palm_book/domain/entities/formats_entity.dart';

class FormatModelDto {
  final String? plainText;
  final String? imageJpeg;

  FormatModelDto({this.plainText, this.imageJpeg});

  factory FormatModelDto.fromJson(Map<String, dynamic> json) {
    return FormatModelDto(
      plainText: json['text/plain; charset=us-ascii'],
      imageJpeg: json['image/jpeg'],
    );
  }

  FormatEntity toEntity() =>
      FormatEntity(imageJpeg: imageJpeg, plainText: plainText);
}
