// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seance_programmee_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeanceProgrammeeHiveAdapter extends TypeAdapter<SeanceProgrammeeHive> {
  @override
  final typeId = 9;

  @override
  SeanceProgrammeeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeanceProgrammeeHive()
      ..date = fields[0] as DateTime
      ..nom = fields[1] as String
      ..exercices = (fields[2] as List).cast<ExerciceSeanceHive>()
      ..estJourRepos = fields[3] as bool
      ..quote = fields[4] as String
      ..bonusProgress = (fields[5] as num).toDouble()
      ..coefficient = (fields[6] as num).toDouble()
      ..bonusApplique = fields[7] as bool;
  }

  @override
  void write(BinaryWriter writer, SeanceProgrammeeHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.date)
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
      ..write(obj.coefficient)
      ..writeByte(7)
      ..write(obj.bonusApplique);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeanceProgrammeeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
