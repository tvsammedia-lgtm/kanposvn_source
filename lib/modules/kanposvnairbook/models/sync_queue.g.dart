// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_queue.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncQueueLocalCollection on Isar {
  IsarCollection<SyncQueueLocal> get syncQueueLocals => this.collection();
}

const SyncQueueLocalSchema = CollectionSchema(
  name: r'SyncQueueLocal',
  id: 24064044507578442,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'entity': PropertySchema(
      id: 1,
      name: r'entity',
      type: IsarType.string,
    ),
    r'entityUuid': PropertySchema(
      id: 2,
      name: r'entityUuid',
      type: IsarType.string,
    ),
    r'operation': PropertySchema(
      id: 3,
      name: r'operation',
      type: IsarType.string,
    ),
    r'payload': PropertySchema(
      id: 4,
      name: r'payload',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.byte,
      enumMap: _SyncQueueLocalstatusEnumValueMap,
    ),
    r'uuid': PropertySchema(
      id: 6,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _syncQueueLocalEstimateSize,
  serialize: _syncQueueLocalSerialize,
  deserialize: _syncQueueLocalDeserialize,
  deserializeProp: _syncQueueLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncQueueLocalGetId,
  getLinks: _syncQueueLocalGetLinks,
  attach: _syncQueueLocalAttach,
  version: '3.1.0+1',
);

int _syncQueueLocalEstimateSize(
  SyncQueueLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.entity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.entityUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.operation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.payload;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _syncQueueLocalSerialize(
  SyncQueueLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.entity);
  writer.writeString(offsets[2], object.entityUuid);
  writer.writeString(offsets[3], object.operation);
  writer.writeString(offsets[4], object.payload);
  writer.writeByte(offsets[5], object.status.index);
  writer.writeString(offsets[6], object.uuid);
}

SyncQueueLocal _syncQueueLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncQueueLocal();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.entity = reader.readStringOrNull(offsets[1]);
  object.entityUuid = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.operation = reader.readStringOrNull(offsets[3]);
  object.payload = reader.readStringOrNull(offsets[4]);
  object.status =
      _SyncQueueLocalstatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          SyncStatus.pending;
  object.uuid = reader.readStringOrNull(offsets[6]);
  return object;
}

P _syncQueueLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_SyncQueueLocalstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.pending) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SyncQueueLocalstatusEnumValueMap = {
  'pending': 0,
  'processing': 1,
  'success': 2,
  'failed': 3,
};
const _SyncQueueLocalstatusValueEnumMap = {
  0: SyncStatus.pending,
  1: SyncStatus.processing,
  2: SyncStatus.success,
  3: SyncStatus.failed,
};

Id _syncQueueLocalGetId(SyncQueueLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncQueueLocalGetLinks(SyncQueueLocal object) {
  return [];
}

void _syncQueueLocalAttach(
    IsarCollection<dynamic> col, Id id, SyncQueueLocal object) {
  object.id = id;
}

extension SyncQueueLocalQueryWhereSort
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QWhere> {
  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncQueueLocalQueryWhere
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QWhereClause> {
  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterWhereClause>
      uuidNotEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SyncQueueLocalQueryFilter
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QFilterCondition> {
  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entity',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entity',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entity',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entity',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entityUuid',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entityUuid',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      entityUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'operation',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'operation',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationEqualTo(
    String? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationGreaterThan(
    String? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationLessThan(
    String? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      operationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'payload',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'payload',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadEqualTo(
    String? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadGreaterThan(
    String? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadLessThan(
    String? value, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
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

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payload',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payload',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      payloadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payload',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      statusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      statusGreaterThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      statusLessThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      statusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension SyncQueueLocalQueryObject
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QFilterCondition> {}

extension SyncQueueLocalQueryLinks
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QFilterCondition> {}

extension SyncQueueLocalQuerySortBy
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QSortBy> {
  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> sortByEntity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      sortByEntityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      sortByEntityUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      sortByEntityUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> sortByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      sortByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension SyncQueueLocalQuerySortThenBy
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QSortThenBy> {
  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByEntity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      thenByEntityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      thenByEntityUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      thenByEntityUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByPayload() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      thenByPayloadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payload', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension SyncQueueLocalQueryWhereDistinct
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct> {
  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct> distinctByEntity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct> distinctByEntityUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct> distinctByOperation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct> distinctByPayload(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payload', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<SyncQueueLocal, SyncQueueLocal, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension SyncQueueLocalQueryProperty
    on QueryBuilder<SyncQueueLocal, SyncQueueLocal, QQueryProperty> {
  QueryBuilder<SyncQueueLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncQueueLocal, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SyncQueueLocal, String?, QQueryOperations> entityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entity');
    });
  }

  QueryBuilder<SyncQueueLocal, String?, QQueryOperations> entityUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityUuid');
    });
  }

  QueryBuilder<SyncQueueLocal, String?, QQueryOperations> operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<SyncQueueLocal, String?, QQueryOperations> payloadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payload');
    });
  }

  QueryBuilder<SyncQueueLocal, SyncStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<SyncQueueLocal, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
