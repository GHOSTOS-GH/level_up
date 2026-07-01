// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercice_template_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciceTemplateHiveAdapter extends TypeAdapter<ExerciceTemplateHive> {
  @override
  final typeId = 6;

  @override
  ExerciceTemplateHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciceTemplateHive()
      ..nom = fields[0] as String
      ..series = (fields[1] as num).toInt()
      ..repetitions = (fields[2] as num).toInt()
      ..ordre = (fields[3] as num).toInt();
  }

  @override
  void write(BinaryWriter writer, ExerciceTemplateHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.series)
      ..writeByte(2)
      ..write(obj.repetitions)
      ..writeByte(3)
      ..write(obj.ordre);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciceTemplateHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
