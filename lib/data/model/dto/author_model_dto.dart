import 'package:palm_book/domain/entities/author_entity.dart';

class AuthorModelDto {
  final String name;
  final int? birthYear;
  final int? deathYear;

  AuthorModelDto({required this.name, this.birthYear, this.deathYear});

  factory AuthorModelDto.fromJson(Map<String, dynamic> json) {
    return AuthorModelDto(
      name: json['name'],
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }

  AuthorEntity toEntity() =>
      AuthorEntity(name: name, birthYear: birthYear, deathYear: deathYear);
}
