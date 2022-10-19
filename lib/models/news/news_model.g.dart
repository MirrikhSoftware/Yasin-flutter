// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<NewsModel> {
  @override
  final int typeId = 2;

  @override
  NewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsModel()
      .._id = fields[0] as String?
      .._body = fields[1] as String?
      .._newsType = fields[2] as String?
      .._createdAt = fields[3] as String?
      .._isActive = fields[4] as bool?
      .._images = (fields[5] as List?)?.cast<String>()
      .._shown = (fields[6] as List?)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._body)
      ..writeByte(2)
      ..write(obj._newsType)
      ..writeByte(3)
      ..write(obj._createdAt)
      ..writeByte(4)
      ..write(obj._isActive)
      ..writeByte(5)
      ..write(obj._images)
      ..writeByte(6)
      ..write(obj._shown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
