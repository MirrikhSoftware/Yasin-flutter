// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedbackAdapter extends TypeAdapter<FeedbackModel> {
  @override
  final int typeId = 1;

  @override
  FeedbackModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedbackModel()
      .._id = fields[0] as String?
      .._date = fields[1] as int?
      .._isSent = fields[2] as bool?
      .._message = fields[3] as String?
      .._hasError = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, FeedbackModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._date)
      ..writeByte(2)
      ..write(obj._isSent)
      ..writeByte(3)
      ..write(obj._message)
      ..writeByte(4)
      ..write(obj._hasError);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedbackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
