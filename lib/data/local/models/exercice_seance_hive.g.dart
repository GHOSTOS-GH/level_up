// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercice_seance_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciceSeanceHiveAdapter extends TypeAdapter<ExerciceSeanceHive> {
  @override
  final typeId = 8;

  @override
  ExerciceSeanceHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciceSeanceHive()
      ..nom = fields[0] as String
      ..series = (fields[1] as num).toInt()
      ..repetitions = (fields[2] as num).toInt()
      ..ordre = (fields[3] as num).toInt()
      ..complete = fields[4] as bool
      ..combatId = (fields[5] as num?)?.toInt();
  }

  @override
  void write(BinaryWriter writer, ExerciceSeanceHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.series)
      ..writeByte(2)
      ..write(obj.repetitions)
      ..writeByte(3)
      ..write(obj.ordre)
      ..writeByte(4)
      ..write(obj.complete)
      ..writeByte(5)
      ..write(obj.combatId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciceSeanceHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
