// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMessageIsarCollection on Isar {
  IsarCollection<MessageIsar> get messageIsars => this.collection();
}

const MessageIsarSchema = CollectionSchema(
  name: r'MessageIsar',
  id: 3260995708908258659,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'requiredStreak': PropertySchema(
      id: 1,
      name: r'requiredStreak',
      type: IsarType.long,
    ),
    r'revealed': PropertySchema(
      id: 2,
      name: r'revealed',
      type: IsarType.bool,
    ),
    r'revealedAt': PropertySchema(
      id: 3,
      name: r'revealedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _messageIsarEstimateSize,
  serialize: _messageIsarSerialize,
  deserialize: _messageIsarDeserialize,
  deserializeProp: _messageIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _messageIsarGetId,
  getLinks: _messageIsarGetLinks,
  attach: _messageIsarAttach,
  version: '3.1.0+1',
);

int _messageIsarEstimateSize(
  MessageIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  return bytesCount;
}

void _messageIsarSerialize(
  MessageIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeLong(offsets[1], object.requiredStreak);
  writer.writeBool(offsets[2], object.revealed);
  writer.writeDateTime(offsets[3], object.revealedAt);
}

MessageIsar _messageIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MessageIsar();
  object.content = reader.readString(offsets[0]);
  object.id = id;
  object.requiredStreak = reader.readLong(offsets[1]);
  object.revealed = reader.readBool(offsets[2]);
  object.revealedAt = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _messageIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _messageIsarGetId(MessageIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _messageIsarGetLinks(MessageIsar object) {
  return [];
}

void _messageIsarAttach(
    IsarCollection<dynamic> col, Id id, MessageIsar object) {
  object.id = id;
}

extension MessageIsarQueryWhereSort
    on QueryBuilder<MessageIsar, MessageIsar, QWhere> {
  QueryBuilder<MessageIsar, MessageIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MessageIsarQueryWhere
    on QueryBuilder<MessageIsar, MessageIsar, QWhereClause> {
  QueryBuilder<MessageIsar, MessageIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MessageIsar, MessageIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterWhereClause> idBetween(
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
}

extension MessageIsarQueryFilter
    on QueryBuilder<MessageIsar, MessageIsar, QFilterCondition> {
  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      requiredStreakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiredStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      requiredStreakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requiredStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      requiredStreakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requiredStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      requiredStreakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requiredStreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition> revealedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revealed',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      revealedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revealedAt',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      revealedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revealedAt',
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      revealedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revealedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      revealedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revealedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      revealedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revealedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterFilterCondition>
      revealedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revealedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MessageIsarQueryObject
    on QueryBuilder<MessageIsar, MessageIsar, QFilterCondition> {}

extension MessageIsarQueryLinks
    on QueryBuilder<MessageIsar, MessageIsar, QFilterCondition> {}

extension MessageIsarQuerySortBy
    on QueryBuilder<MessageIsar, MessageIsar, QSortBy> {
  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> sortByRequiredStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredStreak', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy>
      sortByRequiredStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredStreak', Sort.desc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> sortByRevealed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealed', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> sortByRevealedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealed', Sort.desc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> sortByRevealedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealedAt', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> sortByRevealedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealedAt', Sort.desc);
    });
  }
}

extension MessageIsarQuerySortThenBy
    on QueryBuilder<MessageIsar, MessageIsar, QSortThenBy> {
  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByRequiredStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredStreak', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy>
      thenByRequiredStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiredStreak', Sort.desc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByRevealed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealed', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByRevealedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealed', Sort.desc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByRevealedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealedAt', Sort.asc);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QAfterSortBy> thenByRevealedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revealedAt', Sort.desc);
    });
  }
}

extension MessageIsarQueryWhereDistinct
    on QueryBuilder<MessageIsar, MessageIsar, QDistinct> {
  QueryBuilder<MessageIsar, MessageIsar, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QDistinct> distinctByRequiredStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiredStreak');
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QDistinct> distinctByRevealed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revealed');
    });
  }

  QueryBuilder<MessageIsar, MessageIsar, QDistinct> distinctByRevealedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revealedAt');
    });
  }
}

extension MessageIsarQueryProperty
    on QueryBuilder<MessageIsar, MessageIsar, QQueryProperty> {
  QueryBuilder<MessageIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MessageIsar, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<MessageIsar, int, QQueryOperations> requiredStreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiredStreak');
    });
  }

  QueryBuilder<MessageIsar, bool, QQueryOperations> revealedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revealed');
    });
  }

  QueryBuilder<MessageIsar, DateTime?, QQueryOperations> revealedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revealedAt');
    });
  }
}
