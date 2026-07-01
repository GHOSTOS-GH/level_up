// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jour_template_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JourTemplateHiveAdapter extends TypeAdapter<JourTemplateHive> {
  @override
  final typeId = 7;

  @override
  JourTemplateHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JourTemplateHive()
      ..dayOfWeek = (fields[0] as num).toInt()
      ..nom = fields[1] as String
      ..exercices = (fields[2] as List).cast<ExerciceTemplateHive>()
      ..estJourRepos = fields[3] as bool
      ..quote = fields[4] as String
      ..bonusProgress = (fields[5] as num).toDouble()
      ..coefficient = (fields[6] as num).toDouble();
  }

  @override
  void write(BinaryWriter writer, JourTemplateHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.dayOfWeek)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.exercices)
      ..writeByte(3)
      ..write(obj.estJourRepos)
      ..writeByte(4)
      ..write(obj.quote)
      ..writeByte(5)
      ..write(obj.bonusProgress)
      ..writeByte(6)
      ..write(obj.coefficient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JourTemplateHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
