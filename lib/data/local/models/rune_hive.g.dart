// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rune_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RuneHiveAdapter extends TypeAdapter<RuneHive> {
  @override
  final typeId = 5;

  @override
  RuneHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RuneHive()
      ..type = fields[0] as String
      ..name = fields[1] as String
      ..description = fields[2] as String
      ..unlocked = fields[3] as bool
      ..active = fields[4] as bool
      ..remainingCombats = (fields[5] as num).toInt()
      ..boostPercent = (fields[6] as num).toDouble();
  }

  @override
  void write(BinaryWriter writer, RuneHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.unlocked)
      ..writeByte(4)
      ..write(obj.active)
      ..writeByte(5)
      ..write(obj.remainingCombats)
      ..writeByte(6)
      ..write(obj.boostPercent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuneHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
