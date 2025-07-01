import 'package:palm_book/domain/entities/formats_entity.dart';

class FormatModelDto extends FormatEntity {
  FormatModelDto({super.plainText, super.imageJpeg});

  factory FormatModelDto.fromJson(Map<String, dynamic> json) {
    return FormatModelDto(
      plainText: json['text/plain; charset=us-ascii'],
      imageJpeg: json['image/jpeg'],
    );
  }
}
