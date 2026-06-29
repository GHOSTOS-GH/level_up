// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_combat_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SerieCombatHiveAdapter extends TypeAdapter<SerieCombatHive> {
  @override
  final typeId = 0;

  @override
  SerieCombatHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SerieCombatHive()
      ..index = (fields[0] as num).toInt()
      ..reps = (fields[1] as num).toInt()
      ..completed = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, SerieCombatHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.reps)
      ..writeByte(2)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerieCombatHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
