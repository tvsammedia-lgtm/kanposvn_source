// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGymCheckInCollection on Isar {
  IsarCollection<GymCheckIn> get gymCheckIns => this.collection();
}

const GymCheckInSchema = CollectionSchema(
  name: r'GymCheckIn',
  id: 6257419777397086160,
  properties: {
    r'cardId': PropertySchema(
      id: 0,
      name: r'cardId',
      type: IsarType.string,
    ),
    r'checkInId': PropertySchema(
      id: 1,
      name: r'checkInId',
      type: IsarType.string,
    ),
    r'checkInTime': PropertySchema(
      id: 2,
      name: r'checkInTime',
      type: IsarType.dateTime,
    ),
    r'checkOutTime': PropertySchema(
      id: 3,
      name: r'checkOutTime',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'memberId': PropertySchema(
      id: 5,
      name: r'memberId',
      type: IsarType.string,
    ),
    r'method': PropertySchema(
      id: 6,
      name: r'method',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 7,
      name: r'note',
      type: IsarType.string,
    )
  },
  estimateSize: _gymCheckInEstimateSize,
  serialize: _gymCheckInSerialize,
  deserialize: _gymCheckInDeserialize,
  deserializeProp: _gymCheckInDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'checkInId': IndexSchema(
      id: 1841632595250945841,
      name: r'checkInId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'checkInId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _gymCheckInGetId,
  getLinks: _gymCheckInGetLinks,
  attach: _gymCheckInAttach,
  version: '3.1.0+1',
);

int _gymCheckInEstimateSize(
  GymCheckIn object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cardId.length * 3;
  bytesCount += 3 + object.checkInId.length * 3;
  bytesCount += 3 + object.memberId.length * 3;
  bytesCount += 3 + object.method.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _gymCheckInSerialize(
  GymCheckIn object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cardId);
  writer.writeString(offsets[1], object.checkInId);
  writer.writeDateTime(offsets[2], object.checkInTime);
  writer.writeDateTime(offsets[3], object.checkOutTime);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.memberId);
  writer.writeString(offsets[6], object.method);
  writer.writeString(offsets[7], object.note);
}

GymCheckIn _gymCheckInDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GymCheckIn();
  object.cardId = reader.readString(offsets[0]);
  object.checkInId = reader.readString(offsets[1]);
  object.checkInTime = reader.readDateTime(offsets[2]);
  object.checkOutTime = reader.readDateTimeOrNull(offsets[3]);
  object.isSynced = reader.readBool(offsets[4]);
  object.isarId = id;
  object.memberId = reader.readString(offsets[5]);
  object.method = reader.readString(offsets[6]);
  object.note = reader.readString(offsets[7]);
  return object;
}

P _gymCheckInDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gymCheckInGetId(GymCheckIn object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _gymCheckInGetLinks(GymCheckIn object) {
  return [];
}

void _gymCheckInAttach(IsarCollection<dynamic> col, Id id, GymCheckIn object) {
  object.isarId = id;
}

extension GymCheckInByIndex on IsarCollection<GymCheckIn> {
  Future<GymCheckIn?> getByCheckInId(String checkInId) {
    return getByIndex(r'checkInId', [checkInId]);
  }

  GymCheckIn? getByCheckInIdSync(String checkInId) {
    return getByIndexSync(r'checkInId', [checkInId]);
  }

  Future<bool> deleteByCheckInId(String checkInId) {
    return deleteByIndex(r'checkInId', [checkInId]);
  }

  bool deleteByCheckInIdSync(String checkInId) {
    return deleteByIndexSync(r'checkInId', [checkInId]);
  }

  Future<List<GymCheckIn?>> getAllByCheckInId(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'checkInId', values);
  }

  List<GymCheckIn?> getAllByCheckInIdSync(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'checkInId', values);
  }

  Future<int> deleteAllByCheckInId(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'checkInId', values);
  }

  int deleteAllByCheckInIdSync(List<String> checkInIdValues) {
    final values = checkInIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'checkInId', values);
  }

  Future<Id> putByCheckInId(GymCheckIn object) {
    return putByIndex(r'checkInId', object);
  }

  Id putByCheckInIdSync(GymCheckIn object, {bool saveLinks = true}) {
    return putByIndexSync(r'checkInId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCheckInId(List<GymCheckIn> objects) {
    return putAllByIndex(r'checkInId', objects);
  }

  List<Id> putAllByCheckInIdSync(List<GymCheckIn> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'checkInId', objects, saveLinks: saveLinks);
  }
}

extension GymCheckInQueryWhereSort
    on QueryBuilder<GymCheckIn, GymCheckIn, QWhere> {
  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GymCheckInQueryWhere
    on QueryBuilder<GymCheckIn, GymCheckIn, QWhereClause> {
  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhereClause> checkInIdEqualTo(
      String checkInId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'checkInId',
        value: [checkInId],
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterWhereClause> checkInIdNotEqualTo(
      String checkInId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [],
              upper: [checkInId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [checkInId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [checkInId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkInId',
              lower: [],
              upper: [checkInId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GymCheckInQueryFilter
    on QueryBuilder<GymCheckIn, GymCheckIn, QFilterCondition> {
  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> cardIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      cardIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> checkInIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> checkInIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> checkInIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> checkInIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> checkInIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checkInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> checkInIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checkInId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checkInId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkInTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkInTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkInTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkOutTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'checkOutTime',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkOutTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'checkOutTime',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkOutTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkOutTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkOutTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkOutTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkOutTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkOutTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      checkOutTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkOutTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> memberIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      memberIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> memberIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> memberIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memberId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      memberIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> memberIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> memberIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memberId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> memberIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memberId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      memberIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      memberIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memberId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'method',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'method',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> methodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition>
      methodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'method',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }
}

extension GymCheckInQueryObject
    on QueryBuilder<GymCheckIn, GymCheckIn, QFilterCondition> {}

extension GymCheckInQueryLinks
    on QueryBuilder<GymCheckIn, GymCheckIn, QFilterCondition> {}

extension GymCheckInQuerySortBy
    on QueryBuilder<GymCheckIn, GymCheckIn, QSortBy> {
  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCheckInId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCheckInIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCheckInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCheckInTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCheckOutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByCheckOutTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByMemberIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }
}

extension GymCheckInQuerySortThenBy
    on QueryBuilder<GymCheckIn, GymCheckIn, QSortThenBy> {
  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardId', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCheckInId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCheckInIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInId', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCheckInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCheckInTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkInTime', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCheckOutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByCheckOutTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkOutTime', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByMemberIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }
}

extension GymCheckInQueryWhereDistinct
    on QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> {
  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByCardId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByCheckInId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByCheckInTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkInTime');
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByCheckOutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkOutTime');
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByMemberId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memberId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'method', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymCheckIn, GymCheckIn, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }
}

extension GymCheckInQueryProperty
    on QueryBuilder<GymCheckIn, GymCheckIn, QQueryProperty> {
  QueryBuilder<GymCheckIn, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GymCheckIn, String, QQueryOperations> cardIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardId');
    });
  }

  QueryBuilder<GymCheckIn, String, QQueryOperations> checkInIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInId');
    });
  }

  QueryBuilder<GymCheckIn, DateTime, QQueryOperations> checkInTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkInTime');
    });
  }

  QueryBuilder<GymCheckIn, DateTime?, QQueryOperations> checkOutTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkOutTime');
    });
  }

  QueryBuilder<GymCheckIn, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<GymCheckIn, String, QQueryOperations> memberIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memberId');
    });
  }

  QueryBuilder<GymCheckIn, String, QQueryOperations> methodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'method');
    });
  }

  QueryBuilder<GymCheckIn, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }
}
