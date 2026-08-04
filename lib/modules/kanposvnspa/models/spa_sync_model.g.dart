// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spa_sync_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSpaSyncQueueCollection on Isar {
  IsarCollection<SpaSyncQueue> get spaSyncQueues => this.collection();
}

const SpaSyncQueueSchema = CollectionSchema(
  name: r'SpaSyncQueue',
  id: -7659327448696319294,
  properties: {
    r'action': PropertySchema(
      id: 0,
      name: r'action',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 2,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 3,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'entityType': PropertySchema(
      id: 4,
      name: r'entityType',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'payload': PropertySchema(
      id: 6,
      name: r'payload',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 8,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _spaSyncQueueEstimateSize,
  serialize: _spaSyncQueueSerialize,
  deserialize: _spaSyncQueueDeserialize,
  deserializeProp: _spaSyncQueueDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _spaSyncQueueGetId,
  getLinks: _spaSyncQueueGetLinks,
  attach: _spaSyncQueueAttach,
  version: '3.1.0+1',
);

int _spaSyncQueueEstimateSize(
  SpaSyncQueue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.action.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.entityType.length * 3;
  bytesCount += 3 + object.payload.length * 3;
  return bytesCount;
}

void _spaSyncQueueSerialize(
  SpaSyncQueue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeString(offsets[4], object.entityType);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeString(offsets[6], object.payload);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeLong(offsets[8], object.version);
}

SpaSyncQueue _spaSyncQueueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SpaSyncQueue();
  object.action = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[2]);
  object.deviceId = reader.readString(offsets[3]);
  object.entityType = reader.readString(offsets[4]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[5]);
  object.payload = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.version = reader.readLong(offsets[8]);
  return object;
}

P _spaSyncQueueDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _spaSyncQueueGetId(SpaSyncQueue object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _spaSyncQueueGetLinks(SpaSyncQueue object) {
  return [];
}

void _spaSyncQueueAttach(
    IsarCollection<dynamic> col, Id id, SpaSyncQueue object) {
  object.id = id;
}

extension SpaSyncQueueQueryWhereSort
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QWhere> {
  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension SpaSyncQueueQueryWhere
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QWhereClause> {
  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> idBetween(
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> createdAtEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterWhereClause> createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SpaSyncQueueQueryFilter
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QFilterCondition> {
  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition> actionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      actionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      actionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition> actionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'action',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      actionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      actionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      actionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition> actionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'action',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payload',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payload',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      payloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SpaSyncQueueQueryObject
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QFilterCondition> {}

extension SpaSyncQueueQueryLinks
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QFilterCondition> {}

extension SpaSyncQueueQuerySortBy
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QSortBy> {
  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy>
      sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension SpaSyncQueueQuerySortThenBy
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QSortThenBy> {
  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy>
      thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension SpaSyncQueueQueryWhereDistinct
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> {
  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByAction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByEntityType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByPayload(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payload', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<SpaSyncQueue, SpaSyncQueue, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension SpaSyncQueueQueryProperty
    on QueryBuilder<SpaSyncQueue, SpaSyncQueue, QQueryProperty> {
  QueryBuilder<SpaSyncQueue, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SpaSyncQueue, String, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<SpaSyncQueue, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SpaSyncQueue, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<SpaSyncQueue, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<SpaSyncQueue, String, QQueryOperations> entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<SpaSyncQueue, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<SpaSyncQueue, String, QQueryOperations> payloadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payload');
    });
  }

  QueryBuilder<SpaSyncQueue, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SpaSyncQueue, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
