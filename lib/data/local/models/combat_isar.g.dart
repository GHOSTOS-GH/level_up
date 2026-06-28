// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combat_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCombatIsarCollection on Isar {
  IsarCollection<CombatIsar> get combatIsars => this.collection();
}

const CombatIsarSchema = CollectionSchema(
  name: r'CombatIsar',
  id: -2396607293961773187,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.double,
    ),
    r'coefficient': PropertySchema(
      id: 1,
      name: r'coefficient',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'defiName': PropertySchema(
      id: 3,
      name: r'defiName',
      type: IsarType.string,
    ),
    r'durationMinutes': PropertySchema(
      id: 4,
      name: r'durationMinutes',
      type: IsarType.long,
    ),
    r'exercise': PropertySchema(
      id: 5,
      name: r'exercise',
      type: IsarType.string,
    ),
    r'progressionGain': PropertySchema(
      id: 6,
      name: r'progressionGain',
      type: IsarType.double,
    ),
    r'series': PropertySchema(
      id: 7,
      name: r'series',
      type: IsarType.objectList,
      target: r'SerieCombatIsar',
    )
  },
  estimateSize: _combatIsarEstimateSize,
  serialize: _combatIsarSerialize,
  deserialize: _combatIsarDeserialize,
  deserializeProp: _combatIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'exercise': IndexSchema(
      id: -6432778336607541629,
      name: r'exercise',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'exercise',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'SerieCombatIsar': SerieCombatIsarSchema},
  getId: _combatIsarGetId,
  getLinks: _combatIsarGetLinks,
  attach: _combatIsarAttach,
  version: '3.1.0+1',
);

int _combatIsarEstimateSize(
  CombatIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.defiName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.exercise.length * 3;
  bytesCount += 3 + object.series.length * 3;
  {
    final offsets = allOffsets[SerieCombatIsar]!;
    for (var i = 0; i < object.series.length; i++) {
      final value = object.series[i];
      bytesCount +=
          SerieCombatIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _combatIsarSerialize(
  CombatIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.calories);
  writer.writeDouble(offsets[1], object.coefficient);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeString(offsets[3], object.defiName);
  writer.writeLong(offsets[4], object.durationMinutes);
  writer.writeString(offsets[5], object.exercise);
  writer.writeDouble(offsets[6], object.progressionGain);
  writer.writeObjectList<SerieCombatIsar>(
    offsets[7],
    allOffsets,
    SerieCombatIsarSchema.serialize,
    object.series,
  );
}

CombatIsar _combatIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CombatIsar();
  object.calories = reader.readDouble(offsets[0]);
  object.coefficient = reader.readDouble(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.defiName = reader.readStringOrNull(offsets[3]);
  object.durationMinutes = reader.readLong(offsets[4]);
  object.exercise = reader.readString(offsets[5]);
  object.id = id;
  object.progressionGain = reader.readDouble(offsets[6]);
  object.series = reader.readObjectList<SerieCombatIsar>(
        offsets[7],
        SerieCombatIsarSchema.deserialize,
        allOffsets,
        SerieCombatIsar(),
      ) ??
      [];
  return object;
}

P _combatIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readObjectList<SerieCombatIsar>(
            offset,
            SerieCombatIsarSchema.deserialize,
            allOffsets,
            SerieCombatIsar(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _combatIsarGetId(CombatIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _combatIsarGetLinks(CombatIsar object) {
  return [];
}

void _combatIsarAttach(IsarCollection<dynamic> col, Id id, CombatIsar object) {
  object.id = id;
}

extension CombatIsarQueryWhereSort
    on QueryBuilder<CombatIsar, CombatIsar, QWhere> {
  QueryBuilder<CombatIsar, CombatIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension CombatIsarQueryWhere
    on QueryBuilder<CombatIsar, CombatIsar, QWhereClause> {
  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> exerciseEqualTo(
      String exercise) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'exercise',
        value: [exercise],
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> exerciseNotEqualTo(
      String exercise) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exercise',
              lower: [],
              upper: [exercise],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exercise',
              lower: [exercise],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exercise',
              lower: [exercise],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exercise',
              lower: [],
              upper: [exercise],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CombatIsarQueryFilter
    on QueryBuilder<CombatIsar, CombatIsar, QFilterCondition> {
  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> caloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      caloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> caloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> caloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      coefficientEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      coefficientGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      coefficientLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coefficient',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      coefficientBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coefficient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> defiNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defiName',
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      defiNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defiName',
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> defiNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defiName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      defiNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defiName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> defiNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defiName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> defiNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defiName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      defiNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defiName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> defiNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defiName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> defiNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defiName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> defiNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defiName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      defiNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defiName',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      defiNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defiName',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      durationMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      durationMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      durationMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      durationMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> exerciseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      exerciseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> exerciseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> exerciseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exercise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      exerciseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> exerciseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> exerciseContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> exerciseMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exercise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      exerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      exerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      progressionGainEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressionGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      progressionGainGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progressionGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      progressionGainLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progressionGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      progressionGainBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progressionGain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      seriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'series',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> seriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'series',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      seriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'series',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      seriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'series',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      seriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'series',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition>
      seriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'series',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CombatIsarQueryObject
    on QueryBuilder<CombatIsar, CombatIsar, QFilterCondition> {
  QueryBuilder<CombatIsar, CombatIsar, QAfterFilterCondition> seriesElement(
      FilterQuery<SerieCombatIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'series');
    });
  }
}

extension CombatIsarQueryLinks
    on QueryBuilder<CombatIsar, CombatIsar, QFilterCondition> {}

extension CombatIsarQuerySortBy
    on QueryBuilder<CombatIsar, CombatIsar, QSortBy> {
  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByDefiName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defiName', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByDefiNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defiName', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy>
      sortByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> sortByProgressionGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressionGain', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy>
      sortByProgressionGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressionGain', Sort.desc);
    });
  }
}

extension CombatIsarQuerySortThenBy
    on QueryBuilder<CombatIsar, CombatIsar, QSortThenBy> {
  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByDefiName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defiName', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByDefiNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defiName', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy>
      thenByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy> thenByProgressionGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressionGain', Sort.asc);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QAfterSortBy>
      thenByProgressionGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressionGain', Sort.desc);
    });
  }
}

extension CombatIsarQueryWhereDistinct
    on QueryBuilder<CombatIsar, CombatIsar, QDistinct> {
  QueryBuilder<CombatIsar, CombatIsar, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QDistinct> distinctByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coefficient');
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QDistinct> distinctByDefiName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defiName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QDistinct> distinctByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMinutes');
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QDistinct> distinctByExercise(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercise', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CombatIsar, CombatIsar, QDistinct> distinctByProgressionGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressionGain');
    });
  }
}

extension CombatIsarQueryProperty
    on QueryBuilder<CombatIsar, CombatIsar, QQueryProperty> {
  QueryBuilder<CombatIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CombatIsar, double, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<CombatIsar, double, QQueryOperations> coefficientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coefficient');
    });
  }

  QueryBuilder<CombatIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<CombatIsar, String?, QQueryOperations> defiNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defiName');
    });
  }

  QueryBuilder<CombatIsar, int, QQueryOperations> durationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMinutes');
    });
  }

  QueryBuilder<CombatIsar, String, QQueryOperations> exerciseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercise');
    });
  }

  QueryBuilder<CombatIsar, double, QQueryOperations> progressionGainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressionGain');
    });
  }

  QueryBuilder<CombatIsar, List<SerieCombatIsar>, QQueryOperations>
      seriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'series');
    });
  }
}
