// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogAdapter extends TypeAdapter<LogModel> {
  @override
  final int typeId = 3;

  @override
  LogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogModel()
      .._file = fields[0] as String?
      .._function = fields[1] as String?
      .._type = fields[2] as String?
      .._date = fields[3] as String?
      .._userId = fields[4] as String?
      .._message = fields[5] as String?
      .._openedTime = fields[6] as int?;
  }

  @override
  void write(BinaryWriter writer, LogModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj._file)
      ..writeByte(1)
      ..write(obj._function)
      ..writeByte(2)
      ..write(obj._type)
      ..writeByte(3)
      ..write(obj._date)
      ..writeByte(4)
      ..write(obj._userId)
      ..writeByte(5)
      ..write(obj._message)
      ..writeByte(6)
      ..write(obj._openedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
