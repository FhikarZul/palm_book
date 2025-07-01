// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_book_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikedBookDaoAdapter extends TypeAdapter<LikedBookDao> {
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
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LikedBookDao obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.authors)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedBookDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
