import 'package:palm_book/domain/entities/author_entity.dart';

class AuthorModelDto extends AuthorEntity {
  AuthorModelDto({required super.name, super.birthYear, super.deathYear});

  factory AuthorModelDto.fromJson(Map<String, dynamic> json) {
    return AuthorModelDto(
      name: json['name'],
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }
}
