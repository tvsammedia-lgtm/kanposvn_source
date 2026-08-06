// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viec_sync.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViecSyncQueueCollection on Isar {
  IsarCollection<ViecSyncQueue> get viecSyncQueues => this.collection();
}

const ViecSyncQueueSchema = CollectionSchema(
  name: r'ViecSyncQueue',
  id: -9055542468309380780,
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
  estimateSize: _viecSyncQueueEstimateSize,
  serialize: _viecSyncQueueSerialize,
  deserialize: _viecSyncQueueDeserialize,
  deserializeProp: _viecSyncQueueDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _viecSyncQueueGetId,
  getLinks: _viecSyncQueueGetLinks,
  attach: _viecSyncQueueAttach,
  version: '3.1.0+1',
);

int _viecSyncQueueEstimateSize(
  ViecSyncQueue object,
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

void _viecSyncQueueSerialize(
  ViecSyncQueue object,
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

ViecSyncQueue _viecSyncQueueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViecSyncQueue();
  object.collectionName = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dataJson = reader.readString(offsets[2]);
  object.isarId = id;
  object.operation = reader.readString(offsets[3]);
  object.recordId = reader.readString(offsets[4]);
  object.retryCount = reader.readLong(offsets[5]);
  return object;
}

P _viecSyncQueueDeserializeProp<P>(
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

Id _viecSyncQueueGetId(ViecSyncQueue object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _viecSyncQueueGetLinks(ViecSyncQueue object) {
  return [];
}

void _viecSyncQueueAttach(
    IsarCollection<dynamic> col, Id id, ViecSyncQueue object) {
  object.isarId = id;
}

extension ViecSyncQueueQueryWhereSort
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QWhere> {
  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViecSyncQueueQueryWhere
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QWhereClause> {
  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterWhereClause>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterWhereClause> isarIdBetween(
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

extension ViecSyncQueueQueryFilter
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QFilterCondition> {
  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      collectionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'collectionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      collectionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'collectionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      collectionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionName',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      collectionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'collectionName',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      dataJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      dataJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      dataJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      dataJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      operationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      operationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      operationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      operationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
      retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterFilterCondition>
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

extension ViecSyncQueueQueryObject
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QFilterCondition> {}

extension ViecSyncQueueQueryLinks
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QFilterCondition> {}

extension ViecSyncQueueQuerySortBy
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QSortBy> {
  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      sortByCollectionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      sortByCollectionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> sortByDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      sortByDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }
}

extension ViecSyncQueueQuerySortThenBy
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QSortThenBy> {
  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      thenByCollectionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      thenByCollectionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionName', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> thenByDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      thenByDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy> thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }
}

extension ViecSyncQueueQueryWhereDistinct
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QDistinct> {
  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QDistinct>
      distinctByCollectionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectionName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QDistinct> distinctByDataJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QDistinct> distinctByOperation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QDistinct> distinctByRecordId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecSyncQueue, ViecSyncQueue, QDistinct> distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }
}

extension ViecSyncQueueQueryProperty
    on QueryBuilder<ViecSyncQueue, ViecSyncQueue, QQueryProperty> {
  QueryBuilder<ViecSyncQueue, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ViecSyncQueue, String, QQueryOperations>
      collectionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionName');
    });
  }

  QueryBuilder<ViecSyncQueue, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ViecSyncQueue, String, QQueryOperations> dataJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataJson');
    });
  }

  QueryBuilder<ViecSyncQueue, String, QQueryOperations> operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<ViecSyncQueue, String, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<ViecSyncQueue, int, QQueryOperations> retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViecSyncConfigCollection on Isar {
  IsarCollection<ViecSyncConfig> get viecSyncConfigs => this.collection();
}

const ViecSyncConfigSchema = CollectionSchema(
  name: r'ViecSyncConfig',
  id: 8726601017078114403,
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
  estimateSize: _viecSyncConfigEstimateSize,
  serialize: _viecSyncConfigSerialize,
  deserialize: _viecSyncConfigDeserialize,
  deserializeProp: _viecSyncConfigDeserializeProp,
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
  getId: _viecSyncConfigGetId,
  getLinks: _viecSyncConfigGetLinks,
  attach: _viecSyncConfigAttach,
  version: '3.1.0+1',
);

int _viecSyncConfigEstimateSize(
  ViecSyncConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apiKey.length * 3;
  bytesCount += 3 + object.configId.length * 3;
  bytesCount += 3 + object.vercelApiUrl.length * 3;
  return bytesCount;
}

void _viecSyncConfigSerialize(
  ViecSyncConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apiKey);
  writer.writeString(offsets[1], object.configId);
  writer.writeDateTime(offsets[2], object.lastSyncTime);
  writer.writeString(offsets[3], object.vercelApiUrl);
}

ViecSyncConfig _viecSyncConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViecSyncConfig();
  object.apiKey = reader.readString(offsets[0]);
  object.configId = reader.readString(offsets[1]);
  object.isarId = id;
  object.lastSyncTime = reader.readDateTimeOrNull(offsets[2]);
  object.vercelApiUrl = reader.readString(offsets[3]);
  return object;
}

P _viecSyncConfigDeserializeProp<P>(
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

Id _viecSyncConfigGetId(ViecSyncConfig object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _viecSyncConfigGetLinks(ViecSyncConfig object) {
  return [];
}

void _viecSyncConfigAttach(
    IsarCollection<dynamic> col, Id id, ViecSyncConfig object) {
  object.isarId = id;
}

extension ViecSyncConfigByIndex on IsarCollection<ViecSyncConfig> {
  Future<ViecSyncConfig?> getByConfigId(String configId) {
    return getByIndex(r'configId', [configId]);
  }

  ViecSyncConfig? getByConfigIdSync(String configId) {
    return getByIndexSync(r'configId', [configId]);
  }

  Future<bool> deleteByConfigId(String configId) {
    return deleteByIndex(r'configId', [configId]);
  }

  bool deleteByConfigIdSync(String configId) {
    return deleteByIndexSync(r'configId', [configId]);
  }

  Future<List<ViecSyncConfig?>> getAllByConfigId(List<String> configIdValues) {
    final values = configIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'configId', values);
  }

  List<ViecSyncConfig?> getAllByConfigIdSync(List<String> configIdValues) {
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

  Future<Id> putByConfigId(ViecSyncConfig object) {
    return putByIndex(r'configId', object);
  }

  Id putByConfigIdSync(ViecSyncConfig object, {bool saveLinks = true}) {
    return putByIndexSync(r'configId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByConfigId(List<ViecSyncConfig> objects) {
    return putAllByIndex(r'configId', objects);
  }

  List<Id> putAllByConfigIdSync(List<ViecSyncConfig> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'configId', objects, saveLinks: saveLinks);
  }
}

extension ViecSyncConfigQueryWhereSort
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QWhere> {
  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViecSyncConfigQueryWhere
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QWhereClause> {
  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhereClause>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhereClause>
      configIdEqualTo(String configId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'configId',
        value: [configId],
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterWhereClause>
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

extension ViecSyncConfigQueryFilter
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QFilterCondition> {
  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      apiKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      apiKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      apiKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      apiKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      configIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'configId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      configIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'configId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      configIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'configId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      configIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'configId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      lastSyncTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncTime',
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      lastSyncTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncTime',
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      lastSyncTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
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

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      vercelApiUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vercelApiUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      vercelApiUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vercelApiUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      vercelApiUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vercelApiUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterFilterCondition>
      vercelApiUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vercelApiUrl',
        value: '',
      ));
    });
  }
}

extension ViecSyncConfigQueryObject
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QFilterCondition> {}

extension ViecSyncConfigQueryLinks
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QFilterCondition> {}

extension ViecSyncConfigQuerySortBy
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QSortBy> {
  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy> sortByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      sortByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy> sortByConfigId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      sortByConfigIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      sortByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      sortByLastSyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      sortByVercelApiUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      sortByVercelApiUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.desc);
    });
  }
}

extension ViecSyncConfigQuerySortThenBy
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QSortThenBy> {
  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy> thenByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      thenByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy> thenByConfigId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      thenByConfigIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'configId', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      thenByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      thenByLastSyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.desc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      thenByVercelApiUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.asc);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QAfterSortBy>
      thenByVercelApiUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vercelApiUrl', Sort.desc);
    });
  }
}

extension ViecSyncConfigQueryWhereDistinct
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QDistinct> {
  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QDistinct> distinctByApiKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QDistinct> distinctByConfigId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'configId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QDistinct>
      distinctByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncTime');
    });
  }

  QueryBuilder<ViecSyncConfig, ViecSyncConfig, QDistinct>
      distinctByVercelApiUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vercelApiUrl', caseSensitive: caseSensitive);
    });
  }
}

extension ViecSyncConfigQueryProperty
    on QueryBuilder<ViecSyncConfig, ViecSyncConfig, QQueryProperty> {
  QueryBuilder<ViecSyncConfig, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ViecSyncConfig, String, QQueryOperations> apiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiKey');
    });
  }

  QueryBuilder<ViecSyncConfig, String, QQueryOperations> configIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'configId');
    });
  }

  QueryBuilder<ViecSyncConfig, DateTime?, QQueryOperations>
      lastSyncTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncTime');
    });
  }

  QueryBuilder<ViecSyncConfig, String, QQueryOperations>
      vercelApiUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vercelApiUrl');
    });
  }
}
