import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final String name;
  final int? birthYear;
  final int? deathYear;

  const AuthorEntity({required this.name, this.birthYear, this.deathYear});

  @override
  List<Object> get props => [name, birthYear ?? 0, deathYear ?? 0];
}
