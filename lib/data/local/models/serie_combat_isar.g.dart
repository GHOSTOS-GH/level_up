// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_combat_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SerieCombatIsarSchema = Schema(
  name: r'SerieCombatIsar',
  id: 7200163994857087776,
  properties: {
    r'completed': PropertySchema(
      id: 0,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'index': PropertySchema(
      id: 1,
      name: r'index',
      type: IsarType.long,
    ),
    r'reps': PropertySchema(
      id: 2,
      name: r'reps',
      type: IsarType.long,
    )
  },
  estimateSize: _serieCombatIsarEstimateSize,
  serialize: _serieCombatIsarSerialize,
  deserialize: _serieCombatIsarDeserialize,
  deserializeProp: _serieCombatIsarDeserializeProp,
);

int _serieCombatIsarEstimateSize(
  SerieCombatIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _serieCombatIsarSerialize(
  SerieCombatIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.completed);
  writer.writeLong(offsets[1], object.index);
  writer.writeLong(offsets[2], object.reps);
}

SerieCombatIsar _serieCombatIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SerieCombatIsar();
  object.completed = reader.readBool(offsets[0]);
  object.index = reader.readLong(offsets[1]);
  object.reps = reader.readLong(offsets[2]);
  return object;
}

P _serieCombatIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SerieCombatIsarQueryFilter
    on QueryBuilder<SerieCombatIsar, SerieCombatIsar, QFilterCondition> {
  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      completedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completed',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      indexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      indexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      indexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      indexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      repsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      repsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      repsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieCombatIsar, SerieCombatIsar, QAfterFilterCondition>
      repsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SerieCombatIsarQueryObject
    on QueryBuilder<SerieCombatIsar, SerieCombatIsar, QFilterCondition> {}
