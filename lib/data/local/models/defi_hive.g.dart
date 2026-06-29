// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defi_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DefiHiveAdapter extends TypeAdapter<DefiHive> {
  @override
  final typeId = 3;

  @override
  DefiHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DefiHive()
      ..dayOfWeek = (fields[0] as num).toInt()
      ..name = fields[1] as String
      ..exercise = fields[2] as String
      ..targetSets = (fields[3] as num).toInt()
      ..targetReps = (fields[4] as num).toInt()
      ..quote = fields[5] as String
      ..bonusProgress = (fields[6] as num).toDouble()
      ..coefficient = (fields[7] as num).toDouble()
      ..date = fields[8] as DateTime;
  }

  @override
  void write(BinaryWriter writer, DefiHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.dayOfWeek)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.exercise)
      ..writeByte(3)
      ..write(obj.targetSets)
      ..writeByte(4)
      ..write(obj.targetReps)
      ..writeByte(5)
      ..write(obj.quote)
      ..writeByte(6)
      ..write(obj.bonusProgress)
      ..writeByte(7)
      ..write(obj.coefficient)
      ..writeByte(8)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefiHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
