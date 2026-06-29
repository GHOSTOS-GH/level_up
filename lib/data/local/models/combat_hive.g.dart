// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combat_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CombatHiveAdapter extends TypeAdapter<CombatHive> {
  @override
  final typeId = 2;

  @override
  CombatHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CombatHive()
      ..exercise = fields[0] as String
      ..date = fields[1] as DateTime
      ..series = (fields[2] as List).cast<SerieCombatHive>()
      ..durationMinutes = (fields[3] as num).toInt()
      ..calories = (fields[4] as num).toDouble()
      ..progressionGain = (fields[5] as num).toDouble()
      ..defiName = fields[6] as String?
      ..coefficient = (fields[7] as num).toDouble();
  }

  @override
  void write(BinaryWriter writer, CombatHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.exercise)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.series)
      ..writeByte(3)
      ..write(obj.durationMinutes)
      ..writeByte(4)
      ..write(obj.calories)
      ..writeByte(5)
      ..write(obj.progressionGain)
      ..writeByte(6)
      ..write(obj.defiName)
      ..writeByte(7)
      ..write(obj.coefficient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CombatHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
