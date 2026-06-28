// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defi_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDefiIsarCollection on Isar {
  IsarCollection<DefiIsar> get defiIsars => this.collection();
}

const DefiIsarSchema = CollectionSchema(
  name: r'DefiIsar',
  id: -1085227947481076926,
  properties: {
    r'bonusProgress': PropertySchema(
      id: 0,
      name: r'bonusProgress',
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
    r'dayOfWeek': PropertySchema(
      id: 3,
      name: r'dayOfWeek',
      type: IsarType.long,
    ),
    r'exercise': PropertySchema(
      id: 4,
      name: r'exercise',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'quote': PropertySchema(
      id: 6,
      name: r'quote',
      type: IsarType.string,
    ),
    r'targetReps': PropertySchema(
      id: 7,
      name: r'targetReps',
      type: IsarType.long,
    ),
    r'targetSets': PropertySchema(
      id: 8,
      name: r'targetSets',
      type: IsarType.long,
    )
  },
  estimateSize: _defiIsarEstimateSize,
  serialize: _defiIsarSerialize,
  deserialize: _defiIsarDeserialize,
  deserializeProp: _defiIsarDeserializeProp,
  idName: r'id',
  indexes: {
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
  embeddedSchemas: {},
  getId: _defiIsarGetId,
  getLinks: _defiIsarGetLinks,
  attach: _defiIsarAttach,
  version: '3.1.0+1',
);

int _defiIsarEstimateSize(
  DefiIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exercise.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.quote.length * 3;
  return bytesCount;
}

void _defiIsarSerialize(
  DefiIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.bonusProgress);
  writer.writeDouble(offsets[1], object.coefficient);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeLong(offsets[3], object.dayOfWeek);
  writer.writeString(offsets[4], object.exercise);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.quote);
  writer.writeLong(offsets[7], object.targetReps);
  writer.writeLong(offsets[8], object.targetSets);
}

DefiIsar _defiIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DefiIsar();
  object.bonusProgress = reader.readDouble(offsets[0]);
  object.coefficient = reader.readDouble(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.dayOfWeek = reader.readLong(offsets[3]);
  object.exercise = reader.readString(offsets[4]);
  object.id = id;
  object.name = reader.readString(offsets[5]);
  object.quote = reader.readString(offsets[6]);
  object.targetReps = reader.readLong(offsets[7]);
  object.targetSets = reader.readLong(offsets[8]);
  return object;
}

P _defiIsarDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _defiIsarGetId(DefiIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _defiIsarGetLinks(DefiIsar object) {
  return [];
}

void _defiIsarAttach(IsarCollection<dynamic> col, Id id, DefiIsar object) {
  object.id = id;
}

extension DefiIsarQueryWhereSort on QueryBuilder<DefiIsar, DefiIsar, QWhere> {
  QueryBuilder<DefiIsar, DefiIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension DefiIsarQueryWhere on QueryBuilder<DefiIsar, DefiIsar, QWhereClause> {
  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> dateNotEqualTo(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> dateGreaterThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> dateLessThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterWhereClause> dateBetween(
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

extension DefiIsarQueryFilter
    on QueryBuilder<DefiIsar, DefiIsar, QFilterCondition> {
  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> bonusProgressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonusProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition>
      bonusProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonusProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> bonusProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonusProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> bonusProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonusProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> coefficientEqualTo(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition>
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> coefficientLessThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> coefficientBetween(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dayOfWeekEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dayOfWeekGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dayOfWeekLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> dayOfWeekBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseEqualTo(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseGreaterThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseLessThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseBetween(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseStartsWith(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseEndsWith(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseContains(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseMatches(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> exerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercise',
        value: '',
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quote',
        value: '',
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> quoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quote',
        value: '',
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetRepsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetRepsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetRepsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetReps',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetRepsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetSetsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetSetsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetSetsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetSets',
        value: value,
      ));
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterFilterCondition> targetSetsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetSets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DefiIsarQueryObject
    on QueryBuilder<DefiIsar, DefiIsar, QFilterCondition> {}

extension DefiIsarQueryLinks
    on QueryBuilder<DefiIsar, DefiIsar, QFilterCondition> {}

extension DefiIsarQuerySortBy on QueryBuilder<DefiIsar, DefiIsar, QSortBy> {
  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByBonusProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusProgress', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByBonusProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusProgress', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByQuote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quote', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByQuoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quote', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByTargetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByTargetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByTargetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSets', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> sortByTargetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSets', Sort.desc);
    });
  }
}

extension DefiIsarQuerySortThenBy
    on QueryBuilder<DefiIsar, DefiIsar, QSortThenBy> {
  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByBonusProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusProgress', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByBonusProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonusProgress', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByCoefficientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coefficient', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercise', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByQuote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quote', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByQuoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quote', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByTargetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByTargetRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetReps', Sort.desc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByTargetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSets', Sort.asc);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QAfterSortBy> thenByTargetSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetSets', Sort.desc);
    });
  }
}

extension DefiIsarQueryWhereDistinct
    on QueryBuilder<DefiIsar, DefiIsar, QDistinct> {
  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByBonusProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonusProgress');
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByCoefficient() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coefficient');
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfWeek');
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByExercise(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercise', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByQuote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByTargetReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetReps');
    });
  }

  QueryBuilder<DefiIsar, DefiIsar, QDistinct> distinctByTargetSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetSets');
    });
  }
}

extension DefiIsarQueryProperty
    on QueryBuilder<DefiIsar, DefiIsar, QQueryProperty> {
  QueryBuilder<DefiIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DefiIsar, double, QQueryOperations> bonusProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonusProgress');
    });
  }

  QueryBuilder<DefiIsar, double, QQueryOperations> coefficientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coefficient');
    });
  }

  QueryBuilder<DefiIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DefiIsar, int, QQueryOperations> dayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfWeek');
    });
  }

  QueryBuilder<DefiIsar, String, QQueryOperations> exerciseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercise');
    });
  }

  QueryBuilder<DefiIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<DefiIsar, String, QQueryOperations> quoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quote');
    });
  }

  QueryBuilder<DefiIsar, int, QQueryOperations> targetRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetReps');
    });
  }

  QueryBuilder<DefiIsar, int, QQueryOperations> targetSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetSets');
    });
  }
}
