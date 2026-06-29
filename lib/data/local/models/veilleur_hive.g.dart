// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veilleur_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VeilleurHiveAdapter extends TypeAdapter<VeilleurHive> {
  @override
  final typeId = 1;

  @override
  VeilleurHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VeilleurHive()
      ..nom = fields[0] as String
      ..progression = (fields[1] as num).toDouble()
      ..niveau = (fields[2] as num).toInt()
      ..streakDays = (fields[3] as num).toInt()
      ..lastCombatDate = fields[4] as DateTime?
      ..todayProgressGain = (fields[5] as num).toDouble()
      ..lastProgressDate = fields[6] as DateTime?
      ..lastDeclineDate = fields[7] as DateTime?
      ..totalCombats = (fields[8] as num).toInt()
      ..notificationHour = (fields[9] as num).toInt()
      ..notificationMinute = (fields[10] as num).toInt()
      ..notificationsEnabled = fields[11] as bool;
  }

  @override
  void write(BinaryWriter writer, VeilleurHive obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.progression)
      ..writeByte(2)
      ..write(obj.niveau)
      ..writeByte(3)
      ..write(obj.streakDays)
      ..writeByte(4)
      ..write(obj.lastCombatDate)
      ..writeByte(5)
      ..write(obj.todayProgressGain)
      ..writeByte(6)
      ..write(obj.lastProgressDate)
      ..writeByte(7)
      ..write(obj.lastDeclineDate)
      ..writeByte(8)
      ..write(obj.totalCombats)
      ..writeByte(9)
      ..write(obj.notificationHour)
      ..writeByte(10)
      ..write(obj.notificationMinute)
      ..writeByte(11)
      ..write(obj.notificationsEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VeilleurHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
