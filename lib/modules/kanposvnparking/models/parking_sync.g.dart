// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_sync.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingSyncQueueCollection on Isar {
  IsarCollection<ParkingSyncQueue> get parkingSyncQueues => this.collection();
}

const ParkingSyncQueueSchema = CollectionSchema(
  name: r'ParkingSyncQueue',
  id: 1463112250420972888,
  properties: {
    r'collectionName': PropertySchema(
      id: 0,
      name: r'collectionName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dataJson': PropertySchema(
      id: 2,
      name: r'dataJson',
      type: IsarType.string,
    ),
    r'operation': PropertySchema(
      id: 3,
      name: r'operation',
      type: IsarType.string,
    ),
    r'recordId': PropertySchema(
      id: 4,
      name: r'recordId',
      type: IsarType.string,
    ),
    r'retryCount': PropertySchema(
      id: 5,
      name: r'retryCount',
      type: IsarType.long,
    )
  },
  estimateSize: _parkingSyncQueueEstimateSize,
  serialize: _parkingSyncQueueSerialize,
  deserialize: _parkingSyncQueueDeserialize,
  deserializeProp: _parkingSyncQueueDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _parkingSyncQueueGetId,
  getLinks: _parkingSyncQueueGetLinks,
  attach: _parkingSyncQueueAttach,
  version: '3.1.0+1',
);

int _parkingSyncQueueEstimateSize(
  ParkingSyncQueue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.collectionName.length * 3;
  bytesCount += 3 + object.dataJson.length * 3;
  bytesCount += 3 + object.operation.length * 3;
  bytesCount += 3 + object.recordId.length * 3;
  return bytesCount;
}

void _parkingSyncQueueSerialize(
  ParkingSyncQueue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.collectionName);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.dataJson);
  writer.writeString(offsets[3], object.operation);
  writer.writeString(offsets[4], object.recordId);
  writer.writeLong(offsets[5], object.retryCount);
}

ParkingSyncQueue _parkingSyncQueueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingSyncQueue();
  object.collectionName = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dataJson = reader.readString(offsets[2]);
  object.isarId = id;
  object.operation = reader.readString(offsets[3]);
  object.recordId = reader.readString(offsets[4]);
  object.retryCount = reader.readLong(offsets[5]);
  return object;
}

P _parkingSyncQueueDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingSyncQueueGetId(ParkingSyncQueue object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingSyncQueueGetLinks(ParkingSyncQueue object) {
  return [];
}

void _parkingSyncQueueAttach(
    IsarCollection<dynamic> col, Id id, ParkingSyncQueue object) {
  object.isarId = id;
}

extension ParkingSyncQueueQueryWhereSort
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QWhere> {
  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingSyncQueueQueryWhere
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QWhereClause> {
  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterWhereClause>
      isarIdBetween(
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
}

extension ParkingSyncQueueQueryFilter
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QFilterCondition> {
  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collectionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collectionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collectionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'collectionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'collectionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'collectionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'collectionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      collectionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'collectionName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      dataJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      isarIdGreaterThan(
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

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      isarIdLessThan(
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

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      isarIdBetween(
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

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      operationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      retryCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      retryCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterFilterCondition>
      retryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retryCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ParkingSyncQueueQueryObject
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QFilterCondition> {}

extension ParkingSyncQueueQueryLinks
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QFilterCondition> {}

extension ParkingSyncQueueQuerySortBy
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QSortBy> {
  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByCollectionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByCollectionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }
}

extension ParkingSyncQueueQuerySortThenBy
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QSortThenBy> {
  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByCollectionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByCollectionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }
}

extension ParkingSyncQueueQueryWhereDistinct
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QDistinct> {
  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QDistinct>
      distinctByCollectionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectionName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QDistinct>
      distinctByDataJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QDistinct>
      distinctByOperation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QDistinct>
      distinctByRecordId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QDistinct>
      distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }
}

extension ParkingSyncQueueQueryProperty
    on QueryBuilder<ParkingSyncQueue, ParkingSyncQueue, QQueryProperty> {
  QueryBuilder<ParkingSyncQueue, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingSyncQueue, String, QQueryOperations>
      collectionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionName');
    });
  }

  QueryBuilder<ParkingSyncQueue, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ParkingSyncQueue, String, QQueryOperations> dataJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataJson');
    });
  }

  QueryBuilder<ParkingSyncQueue, String, QQueryOperations> operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<ParkingSyncQueue, String, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<ParkingSyncQueue, int, QQueryOperations> retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingSyncConfigCollection on Isar {
  IsarCollection<ParkingSyncConfig> get parkingSyncConfigs => this.collection();
}

const ParkingSyncConfigSchema = CollectionSchema(
  name: r'ParkingSyncConfig',
  id: 6363205645226052949,
  properties: {
    r'apiKey': PropertySchema(
      id: 0,
      name: r'apiKey',
      type: IsarType.string,
    ),
    r'configId': PropertySchema(
      id: 1,
      name: r'configId',
      type: IsarType.string,
    ),
    r'lastSyncTime': PropertySchema(
      id: 2,
      name: r'lastSyncTime',
      type: IsarType.dateTime,
    ),
    r'vercelApiUrl': PropertySchema(
      id: 3,
      name: r'vercelApiUrl',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingSyncConfigEstimateSize,
  serialize: _parkingSyncConfigSerialize,
  deserialize: _parkingSyncConfigDeserialize,
  deserializeProp: _parkingSyncConfigDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'configId': IndexSchema(
      id: 7164334513802924883,
      name: r'configId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'configId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parkingSyncConfigGetId,
  getLinks: _parkingSyncConfigGetLinks,
  attach: _parkingSyncConfigAttach,
  version: '3.1.0+1',
);

int _parkingSyncConfigEstimateSize(
  ParkingSyncConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apiKey.length * 3;
  bytesCount += 3 + object.configId.length * 3;
  bytesCount += 3 + object.vercelApiUrl.length * 3;
  return bytesCount;
}

void _parkingSyncConfigSerialize(
  ParkingSyncConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apiKey);
  writer.writeString(offsets[1], object.configId);
  writer.writeDateTime(offsets[2], object.lastSyncTime);
  writer.writeString(offsets[3], object.vercelApiUrl);
}

ParkingSyncConfig _parkingSyncConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingSyncConfig();
  object.apiKey = reader.readString(offsets[0]);
  object.configId = reader.readString(offsets[1]);
  object.isarId = id;
  object.lastSyncTime = reader.readDateTimeOrNull(offsets[2]);
  object.vercelApiUrl = reader.readString(offsets[3]);
  return object;
}

P _parkingSyncConfigDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingSyncConfigGetId(ParkingSyncConfig object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingSyncConfigGetLinks(
    ParkingSyncConfig object) {
  return [];
}

void _parkingSyncConfigAttach(
    IsarCollection<dynamic> col, Id id, ParkingSyncConfig object) {
  object.isarId = id;
}

extension ParkingSyncConfigByIndex on IsarCollection<ParkingSyncConfig> {
  Future<ParkingSyncConfig?> getByConfigId(String configId) {
    return getByIndex(r'configId', [configId]);
  }

  ParkingSyncConfig? getByConfigIdSync(String configId) {
    return getByIndexSync(r'configId', [configId]);
  }

  Future<bool> deleteByConfigId(String configId) {
    return deleteByIndex(r'configId', [configId]);
  }

  bool deleteByConfigIdSync(String configId) {
    return deleteByIndexSync(r'configId', [configId]);
  }

  Future<List<ParkingSyncConfig?>> getAllByConfigId(
      List<String> configIdValues) {
    final values = configIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'configId', values);
  }

  List<ParkingSyncConfig?> getAllByConfigIdSync(List<String> configIdValues) {
    final values = configIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'configId', values);
  }

  Future<int> deleteAllByConfigId(List<String> configIdValues) {
    final values = configIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'configId', values);
  }

  int deleteAllByConfigIdSync(List<String> configIdValues) {
    final values = configIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'configId', values);
  }

  Future<Id> putByConfigId(ParkingSyncConfig object) {
    return putByIndex(r'configId', object);
  }

  Id putByConfigIdSync(ParkingSyncConfig object, {bool saveLinks = true}) {
    return putByIndexSync(r'configId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByConfigId(List<ParkingSyncConfig> objects) {
    return putAllByIndex(r'configId', objects);
  }

  List<Id> putAllByConfigIdSync(List<ParkingSyncConfig> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'configId', objects, saveLinks: saveLinks);
  }
}

extension ParkingSyncConfigQueryWhereSort
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QWhere> {
  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingSyncConfigQueryWhere
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QWhereClause> {
  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhereClause>
      isarIdBetween(
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

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhereClause>
      configIdEqualTo(String configId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'configId',
        value: [configId],
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterWhereClause>
      configIdNotEqualTo(String configId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'configId',
              lower: [],
              upper: [configId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'configId',
              lower: [configId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'configId',
              lower: [configId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'configId',
              lower: [],
              upper: [configId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParkingSyncConfigQueryFilter
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QFilterCondition> {
  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      apiKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'configId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'configId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'configId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'configId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'configId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'configId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'configId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'configId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'configId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      configIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'configId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      isarIdGreaterThan(
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

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      isarIdLessThan(
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

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      isarIdBetween(
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

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      lastSyncTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncTime',
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      lastSyncTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncTime',
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      lastSyncTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      lastSyncTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      lastSyncTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      lastSyncTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vercelApiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vercelApiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vercelApiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vercelApiUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vercelApiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vercelApiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vercelApiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vercelApiUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vercelApiUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterFilterCondition>
      vercelApiUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vercelApiUrl',
        value: '',
      ));
    });
  }
}

extension ParkingSyncConfigQueryObject
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QFilterCondition> {}

extension ParkingSyncConfigQueryLinks
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QFilterCondition> {}

extension ParkingSyncConfigQuerySortBy
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QSortBy> {
  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByConfigId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByConfigIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByLastSyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByVercelApiUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      sortByVercelApiUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.desc);
    });
  }
}

extension ParkingSyncConfigQuerySortThenBy
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QSortThenBy> {
  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByConfigId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByConfigIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByLastSyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByVercelApiUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.asc);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QAfterSortBy>
      thenByVercelApiUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.desc);
    });
  }
}

extension ParkingSyncConfigQueryWhereDistinct
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QDistinct> {
  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QDistinct>
      distinctByApiKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QDistinct>
      distinctByConfigId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'configId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QDistinct>
      distinctByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncTime');
    });
  }

  QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QDistinct>
      distinctByVercelApiUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vercelApiUrl', caseSensitive: caseSensitive);
    });
  }
}

extension ParkingSyncConfigQueryProperty
    on QueryBuilder<ParkingSyncConfig, ParkingSyncConfig, QQueryProperty> {
  QueryBuilder<ParkingSyncConfig, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingSyncConfig, String, QQueryOperations> apiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiKey');
    });
  }

  QueryBuilder<ParkingSyncConfig, String, QQueryOperations> configIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'configId');
    });
  }

  QueryBuilder<ParkingSyncConfig, DateTime?, QQueryOperations>
      lastSyncTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncTime');
    });
  }

  QueryBuilder<ParkingSyncConfig, String, QQueryOperations>
      vercelApiUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vercelApiUrl');
    });
  }
}
