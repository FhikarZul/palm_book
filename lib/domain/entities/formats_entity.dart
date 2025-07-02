import 'package:equatable/equatable.dart';

class FormatEntity extends Equatable {
  final String? plainText;
  final String? imageJpeg;

  const FormatEntity({this.plainText, this.imageJpeg});

  @override
  List<Object?> get props => [plainText ?? "", imageJpeg ?? ""];
}
