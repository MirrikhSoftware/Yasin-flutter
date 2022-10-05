// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<NewsModel> {
  @override
  final int typeId = 7;

  @override
  NewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsModel()
      .._sId = fields[0] as String?
      .._status = fields[1] as String?
      .._type = fields[2] as String?
      .._title = fields[3] as String?
      .._hTMLText = fields[4] as String?
      .._date = fields[5] as int?
      .._image = fields[6] as String?
      .._images = (fields[7] as List?)?.cast<String>()
      .._createdAt = fields[8] as String?
      .._updatedAt = fields[9] as String?
      .._iV = fields[10] as int?
      .._describtion = fields[11] as String?;
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj._sId)
      ..writeByte(1)
      ..write(obj._status)
      ..writeByte(2)
      ..write(obj._type)
      ..writeByte(3)
      ..write(obj._title)
      ..writeByte(4)
      ..write(obj._hTMLText)
      ..writeByte(5)
      ..write(obj._date)
      ..writeByte(6)
      ..write(obj._image)
      ..writeByte(7)
      ..write(obj._images)
      ..writeByte(8)
      ..write(obj._createdAt)
      ..writeByte(9)
      ..write(obj._updatedAt)
      ..writeByte(10)
      ..write(obj._iV)
      ..writeByte(11)
      ..write(obj._describtion);
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
