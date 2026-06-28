// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veilleur_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVeilleurIsarCollection on Isar {
  IsarCollection<VeilleurIsar> get veilleurIsars => this.collection();
}

const VeilleurIsarSchema = CollectionSchema(
  name: r'VeilleurIsar',
  id: 5287410668119252668,
  properties: {
    r'lastCombatDate': PropertySchema(
      id: 0,
      name: r'lastCombatDate',
      type: IsarType.dateTime,
    ),
    r'lastDeclineDate': PropertySchema(
      id: 1,
      name: r'lastDeclineDate',
      type: IsarType.dateTime,
    ),
    r'lastProgressDate': PropertySchema(
      id: 2,
      name: r'lastProgressDate',
      type: IsarType.dateTime,
    ),
    r'niveau': PropertySchema(
      id: 3,
      name: r'niveau',
      type: IsarType.long,
    ),
    r'nom': PropertySchema(
      id: 4,
      name: r'nom',
      type: IsarType.string,
    ),
    r'notificationHour': PropertySchema(
      id: 5,
      name: r'notificationHour',
      type: IsarType.long,
    ),
    r'notificationMinute': PropertySchema(
      id: 6,
      name: r'notificationMinute',
      type: IsarType.long,
    ),
    r'notificationsEnabled': PropertySchema(
      id: 7,
      name: r'notificationsEnabled',
      type: IsarType.bool,
    ),
    r'progression': PropertySchema(
      id: 8,
      name: r'progression',
      type: IsarType.double,
    ),
    r'streakDays': PropertySchema(
      id: 9,
      name: r'streakDays',
      type: IsarType.long,
    ),
    r'todayProgressGain': PropertySchema(
      id: 10,
      name: r'todayProgressGain',
      type: IsarType.double,
    ),
    r'totalCombats': PropertySchema(
      id: 11,
      name: r'totalCombats',
      type: IsarType.long,
    )
  },
  estimateSize: _veilleurIsarEstimateSize,
  serialize: _veilleurIsarSerialize,
  deserialize: _veilleurIsarDeserialize,
  deserializeProp: _veilleurIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'progression': IndexSchema(
      id: -7839806929848461732,
      name: r'progression',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'progression',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _veilleurIsarGetId,
  getLinks: _veilleurIsarGetLinks,
  attach: _veilleurIsarAttach,
  version: '3.1.0+1',
);

int _veilleurIsarEstimateSize(
  VeilleurIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nom.length * 3;
  return bytesCount;
}

void _veilleurIsarSerialize(
  VeilleurIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastCombatDate);
  writer.writeDateTime(offsets[1], object.lastDeclineDate);
  writer.writeDateTime(offsets[2], object.lastProgressDate);
  writer.writeLong(offsets[3], object.niveau);
  writer.writeString(offsets[4], object.nom);
  writer.writeLong(offsets[5], object.notificationHour);
  writer.writeLong(offsets[6], object.notificationMinute);
  writer.writeBool(offsets[7], object.notificationsEnabled);
  writer.writeDouble(offsets[8], object.progression);
  writer.writeLong(offsets[9], object.streakDays);
  writer.writeDouble(offsets[10], object.todayProgressGain);
  writer.writeLong(offsets[11], object.totalCombats);
}

VeilleurIsar _veilleurIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VeilleurIsar();
  object.id = id;
  object.lastCombatDate = reader.readDateTimeOrNull(offsets[0]);
  object.lastDeclineDate = reader.readDateTimeOrNull(offsets[1]);
  object.lastProgressDate = reader.readDateTimeOrNull(offsets[2]);
  object.niveau = reader.readLong(offsets[3]);
  object.nom = reader.readString(offsets[4]);
  object.notificationHour = reader.readLong(offsets[5]);
  object.notificationMinute = reader.readLong(offsets[6]);
  object.notificationsEnabled = reader.readBool(offsets[7]);
  object.progression = reader.readDouble(offsets[8]);
  object.streakDays = reader.readLong(offsets[9]);
  object.todayProgressGain = reader.readDouble(offsets[10]);
  object.totalCombats = reader.readLong(offsets[11]);
  return object;
}

P _veilleurIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _veilleurIsarGetId(VeilleurIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _veilleurIsarGetLinks(VeilleurIsar object) {
  return [];
}

void _veilleurIsarAttach(
    IsarCollection<dynamic> col, Id id, VeilleurIsar object) {
  object.id = id;
}

extension VeilleurIsarQueryWhereSort
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QWhere> {
  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhere> anyProgression() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'progression'),
      );
    });
  }
}

extension VeilleurIsarQueryWhere
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QWhereClause> {
  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause>
      progressionEqualTo(double progression) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'progression',
        value: [progression],
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause>
      progressionNotEqualTo(double progression) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'progression',
              lower: [],
              upper: [progression],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'progression',
              lower: [progression],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'progression',
              lower: [progression],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'progression',
              lower: [],
              upper: [progression],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause>
      progressionGreaterThan(
    double progression, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'progression',
        lower: [progression],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause>
      progressionLessThan(
    double progression, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'progression',
        lower: [],
        upper: [progression],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterWhereClause>
      progressionBetween(
    double lowerProgression,
    double upperProgression, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'progression',
        lower: [lowerProgression],
        includeLower: includeLower,
        upper: [upperProgression],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VeilleurIsarQueryFilter
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QFilterCondition> {
  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastCombatDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCombatDate',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastCombatDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCombatDate',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastCombatDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCombatDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastCombatDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCombatDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastCombatDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCombatDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastCombatDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCombatDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastDeclineDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastDeclineDate',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastDeclineDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastDeclineDate',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastDeclineDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastDeclineDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastDeclineDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastDeclineDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastDeclineDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastDeclineDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastDeclineDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastDeclineDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastProgressDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastProgressDate',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastProgressDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastProgressDate',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastProgressDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastProgressDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastProgressDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastProgressDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastProgressDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastProgressDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      lastProgressDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastProgressDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> niveauEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'niveau',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      niveauGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'niveau',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      niveauLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'niveau',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> niveauBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'niveau',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      nomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition> nomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom',
        value: '',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      nomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nom',
        value: '',
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationHour',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationHourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationHour',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationHourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationHour',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationMinuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationMinuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      notificationsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      progressionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progression',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      progressionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progression',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      progressionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progression',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      progressionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progression',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      streakDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      streakDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      streakDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      streakDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streakDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      todayProgressGainEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todayProgressGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      todayProgressGainGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todayProgressGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      todayProgressGainLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todayProgressGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      todayProgressGainBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todayProgressGain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      totalCombatsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCombats',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      totalCombatsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCombats',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      totalCombatsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCombats',
        value: value,
      ));
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterFilterCondition>
      totalCombatsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCombats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VeilleurIsarQueryObject
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QFilterCondition> {}

extension VeilleurIsarQueryLinks
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QFilterCondition> {}

extension VeilleurIsarQuerySortBy
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QSortBy> {
  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByLastCombatDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCombatDate', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByLastCombatDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCombatDate', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByLastDeclineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDeclineDate', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByLastDeclineDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDeclineDate', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByLastProgressDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProgressDate', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByLastProgressDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProgressDate', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> sortByNiveau() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'niveau', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> sortByNiveauDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'niveau', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> sortByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> sortByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByNotificationHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHour', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByNotificationHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHour', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByNotificationMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationMinute', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByNotificationMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationMinute', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> sortByProgression() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progression', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByProgressionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progression', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> sortByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByTodayProgressGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayProgressGain', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByTodayProgressGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayProgressGain', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> sortByTotalCombats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCombats', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      sortByTotalCombatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCombats', Sort.desc);
    });
  }
}

extension VeilleurIsarQuerySortThenBy
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QSortThenBy> {
  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByLastCombatDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCombatDate', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByLastCombatDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCombatDate', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByLastDeclineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDeclineDate', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByLastDeclineDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDeclineDate', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByLastProgressDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProgressDate', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByLastProgressDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastProgressDate', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByNiveau() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'niveau', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByNiveauDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'niveau', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByNotificationHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHour', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByNotificationHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationHour', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByNotificationMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationMinute', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByNotificationMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationMinute', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByProgression() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progression', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByProgressionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progression', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByTodayProgressGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayProgressGain', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByTodayProgressGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayProgressGain', Sort.desc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy> thenByTotalCombats() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCombats', Sort.asc);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QAfterSortBy>
      thenByTotalCombatsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCombats', Sort.desc);
    });
  }
}

extension VeilleurIsarQueryWhereDistinct
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct> {
  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct>
      distinctByLastCombatDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCombatDate');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct>
      distinctByLastDeclineDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastDeclineDate');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct>
      distinctByLastProgressDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastProgressDate');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct> distinctByNiveau() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'niveau');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct> distinctByNom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct>
      distinctByNotificationHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationHour');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct>
      distinctByNotificationMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationMinute');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct>
      distinctByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationsEnabled');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct> distinctByProgression() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progression');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct> distinctByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakDays');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct>
      distinctByTodayProgressGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todayProgressGain');
    });
  }

  QueryBuilder<VeilleurIsar, VeilleurIsar, QDistinct> distinctByTotalCombats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCombats');
    });
  }
}

extension VeilleurIsarQueryProperty
    on QueryBuilder<VeilleurIsar, VeilleurIsar, QQueryProperty> {
  QueryBuilder<VeilleurIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VeilleurIsar, DateTime?, QQueryOperations>
      lastCombatDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCombatDate');
    });
  }

  QueryBuilder<VeilleurIsar, DateTime?, QQueryOperations>
      lastDeclineDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastDeclineDate');
    });
  }

  QueryBuilder<VeilleurIsar, DateTime?, QQueryOperations>
      lastProgressDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastProgressDate');
    });
  }

  QueryBuilder<VeilleurIsar, int, QQueryOperations> niveauProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'niveau');
    });
  }

  QueryBuilder<VeilleurIsar, String, QQueryOperations> nomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nom');
    });
  }

  QueryBuilder<VeilleurIsar, int, QQueryOperations> notificationHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationHour');
    });
  }

  QueryBuilder<VeilleurIsar, int, QQueryOperations>
      notificationMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationMinute');
    });
  }

  QueryBuilder<VeilleurIsar, bool, QQueryOperations>
      notificationsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationsEnabled');
    });
  }

  QueryBuilder<VeilleurIsar, double, QQueryOperations> progressionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progression');
    });
  }

  QueryBuilder<VeilleurIsar, int, QQueryOperations> streakDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakDays');
    });
  }

  QueryBuilder<VeilleurIsar, double, QQueryOperations>
      todayProgressGainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todayProgressGain');
    });
  }

  QueryBuilder<VeilleurIsar, int, QQueryOperations> totalCombatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCombats');
    });
  }
}
