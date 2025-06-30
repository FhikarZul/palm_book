// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_book_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikedBookAdapter extends TypeAdapter<LikedBookDao> {
  @override
  final int typeId = 0;

  @override
  LikedBookDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedBookDao(
      bookId: fields[0] as int,
      title: fields[1] as String,
      imageUrl: fields[2] as String,
      authors: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, LikedBookDao obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.authors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
