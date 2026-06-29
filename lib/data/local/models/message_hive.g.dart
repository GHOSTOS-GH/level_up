// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageHiveAdapter extends TypeAdapter<MessageHive> {
  @override
  final typeId = 4;

  @override
  MessageHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageHive()
      ..content = fields[0] as String
      ..requiredStreak = (fields[1] as num).toInt()
      ..revealed = fields[2] as bool
      ..revealedAt = fields[3] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, MessageHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.requiredStreak)
      ..writeByte(2)
      ..write(obj.revealed)
      ..writeByte(3)
      ..write(obj.revealedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
