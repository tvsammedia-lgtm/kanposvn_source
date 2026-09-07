// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAIRequestCollection on Isar {
  IsarCollection<AIRequest> get aIRequests => this.collection();
}

const AIRequestSchema = CollectionSchema(
  name: r'AIRequest',
  id: 7477487352172697736,
  properties: {
    r'acceptedItemsJson': PropertySchema(
      id: 0,
      name: r'acceptedItemsJson',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'doctorAction': PropertySchema(
      id: 2,
      name: r'doctorAction',
      type: IsarType.string,
    ),
    r'doctorId': PropertySchema(
      id: 3,
      name: r'doctorId',
      type: IsarType.string,
    ),
    r'editedItemsJson': PropertySchema(
      id: 4,
      name: r'editedItemsJson',
      type: IsarType.string,
    ),
    r'encounterId': PropertySchema(
      id: 5,
      name: r'encounterId',
      type: IsarType.string,
    ),
    r'patientId': PropertySchema(
      id: 6,
      name: r'patientId',
      type: IsarType.string,
    ),
    r'promptVersion': PropertySchema(
      id: 7,
      name: r'promptVersion',
      type: IsarType.string,
    ),
    r'rejectedItemsJson': PropertySchema(
      id: 8,
      name: r'rejectedItemsJson',
      type: IsarType.string,
    ),
    r'requestHash': PropertySchema(
      id: 9,
      name: r'requestHash',
      type: IsarType.string,
    ),
    r'requestType': PropertySchema(
      id: 10,
      name: r'requestType',
      type: IsarType.string,
    ),
    r'responseHash': PropertySchema(
      id: 11,
      name: r'responseHash',
      type: IsarType.string,
    ),
    r'suggestionDataJson': PropertySchema(
      id: 12,
      name: r'suggestionDataJson',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 13,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _aIRequestEstimateSize,
  serialize: _aIRequestSerialize,
  deserialize: _aIRequestDeserialize,
  deserializeProp: _aIRequestDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'doctorId': IndexSchema(
      id: -815611514856210898,
      name: r'doctorId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'doctorId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'patientId': IndexSchema(
      id: 403389457658259617,
      name: r'patientId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'patientId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _aIRequestGetId,
  getLinks: _aIRequestGetLinks,
  attach: _aIRequestAttach,
  version: '3.1.0+1',
);

int _aIRequestEstimateSize(
  AIRequest object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.acceptedItemsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.doctorAction;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.doctorId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.editedItemsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.encounterId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.patientId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.promptVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rejectedItemsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.requestHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.requestType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.responseHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.suggestionDataJson;
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

void _aIRequestSerialize(
  AIRequest object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.acceptedItemsJson);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.doctorAction);
  writer.writeString(offsets[3], object.doctorId);
  writer.writeString(offsets[4], object.editedItemsJson);
  writer.writeString(offsets[5], object.encounterId);
  writer.writeString(offsets[6], object.patientId);
  writer.writeString(offsets[7], object.promptVersion);
  writer.writeString(offsets[8], object.rejectedItemsJson);
  writer.writeString(offsets[9], object.requestHash);
  writer.writeString(offsets[10], object.requestType);
  writer.writeString(offsets[11], object.responseHash);
  writer.writeString(offsets[12], object.suggestionDataJson);
  writer.writeString(offsets[13], object.uuid);
}

AIRequest _aIRequestDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AIRequest();
  object.acceptedItemsJson = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.doctorAction = reader.readStringOrNull(offsets[2]);
  object.doctorId = reader.readStringOrNull(offsets[3]);
  object.editedItemsJson = reader.readStringOrNull(offsets[4]);
  object.encounterId = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.patientId = reader.readStringOrNull(offsets[6]);
  object.promptVersion = reader.readStringOrNull(offsets[7]);
  object.rejectedItemsJson = reader.readStringOrNull(offsets[8]);
  object.requestHash = reader.readStringOrNull(offsets[9]);
  object.requestType = reader.readStringOrNull(offsets[10]);
  object.responseHash = reader.readStringOrNull(offsets[11]);
  object.suggestionDataJson = reader.readStringOrNull(offsets[12]);
  object.uuid = reader.readStringOrNull(offsets[13]);
  return object;
}

P _aIRequestDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aIRequestGetId(AIRequest object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aIRequestGetLinks(AIRequest object) {
  return [];
}

void _aIRequestAttach(IsarCollection<dynamic> col, Id id, AIRequest object) {
  object.id = id;
}

extension AIRequestByIndex on IsarCollection<AIRequest> {
  Future<AIRequest?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  AIRequest? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<AIRequest?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<AIRequest?> getAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(AIRequest object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(AIRequest object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<AIRequest> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<AIRequest> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension AIRequestQueryWhereSort
    on QueryBuilder<AIRequest, AIRequest, QWhere> {
  QueryBuilder<AIRequest, AIRequest, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AIRequestQueryWhere
    on QueryBuilder<AIRequest, AIRequest, QWhereClause> {
  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> idBetween(
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

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> uuidNotEqualTo(
      String? uuid) {
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

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> doctorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'doctorId',
        value: [null],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> doctorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'doctorId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> doctorIdEqualTo(
      String? doctorId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'doctorId',
        value: [doctorId],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> doctorIdNotEqualTo(
      String? doctorId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'doctorId',
              lower: [],
              upper: [doctorId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'doctorId',
              lower: [doctorId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'doctorId',
              lower: [doctorId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'doctorId',
              lower: [],
              upper: [doctorId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> patientIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'patientId',
        value: [null],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> patientIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> patientIdEqualTo(
      String? patientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'patientId',
        value: [patientId],
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterWhereClause> patientIdNotEqualTo(
      String? patientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AIRequestQueryFilter
    on QueryBuilder<AIRequest, AIRequest, QFilterCondition> {
  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'acceptedItemsJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'acceptedItemsJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acceptedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'acceptedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'acceptedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'acceptedItemsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'acceptedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'acceptedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'acceptedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'acceptedItemsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acceptedItemsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      acceptedItemsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'acceptedItemsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'doctorAction',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'doctorAction',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorActionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doctorAction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doctorAction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doctorAction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorActionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doctorAction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'doctorAction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'doctorAction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'doctorAction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorActionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'doctorAction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doctorAction',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorActionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'doctorAction',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'doctorId',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'doctorId',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doctorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doctorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doctorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doctorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'doctorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'doctorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'doctorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'doctorId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> doctorIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doctorId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      doctorIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'doctorId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'editedItemsJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'editedItemsJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'editedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'editedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'editedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'editedItemsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'editedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'editedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'editedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'editedItemsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'editedItemsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      editedItemsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'editedItemsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      encounterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'encounterId',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      encounterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'encounterId',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> encounterIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encounterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      encounterIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encounterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> encounterIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encounterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> encounterIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encounterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      encounterIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encounterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> encounterIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encounterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> encounterIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encounterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> encounterIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encounterId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      encounterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encounterId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      encounterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encounterId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'patientId',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      patientIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'patientId',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      patientIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'patientId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> patientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      patientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'patientId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promptVersion',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promptVersion',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promptVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promptVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promptVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promptVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promptVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promptVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promptVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promptVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promptVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      promptVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promptVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rejectedItemsJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rejectedItemsJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rejectedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rejectedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rejectedItemsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rejectedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rejectedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rejectedItemsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rejectedItemsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectedItemsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      rejectedItemsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rejectedItemsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'requestHash',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'requestHash',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requestHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requestHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requestHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'requestHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'requestHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestHashContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'requestHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestHashMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'requestHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestHash',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'requestHash',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'requestType',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'requestType',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requestType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requestType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requestType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'requestType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'requestType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'requestType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> requestTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'requestType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestType',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      requestTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'requestType',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'responseHash',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'responseHash',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> responseHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'responseHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'responseHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'responseHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> responseHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'responseHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'responseHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'responseHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'responseHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> responseHashMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'responseHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'responseHash',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      responseHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'responseHash',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'suggestionDataJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'suggestionDataJson',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestionDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestionDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestionDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestionDataJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suggestionDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suggestionDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suggestionDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suggestionDataJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestionDataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition>
      suggestionDataJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suggestionDataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension AIRequestQueryObject
    on QueryBuilder<AIRequest, AIRequest, QFilterCondition> {}

extension AIRequestQueryLinks
    on QueryBuilder<AIRequest, AIRequest, QFilterCondition> {}

extension AIRequestQuerySortBy on QueryBuilder<AIRequest, AIRequest, QSortBy> {
  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByAcceptedItemsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedItemsJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy>
      sortByAcceptedItemsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedItemsJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByDoctorAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorAction', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByDoctorActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorAction', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByDoctorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByDoctorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByEditedItemsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'editedItemsJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByEditedItemsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'editedItemsJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByEncounterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encounterId', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByEncounterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encounterId', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByPromptVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptVersion', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByPromptVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptVersion', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByRejectedItemsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedItemsJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy>
      sortByRejectedItemsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedItemsJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByRequestHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHash', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByRequestHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHash', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByRequestType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestType', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByRequestTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestType', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByResponseHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHash', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByResponseHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHash', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortBySuggestionDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionDataJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy>
      sortBySuggestionDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionDataJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension AIRequestQuerySortThenBy
    on QueryBuilder<AIRequest, AIRequest, QSortThenBy> {
  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByAcceptedItemsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedItemsJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy>
      thenByAcceptedItemsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acceptedItemsJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByDoctorAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorAction', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByDoctorActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorAction', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByDoctorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByDoctorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByEditedItemsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'editedItemsJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByEditedItemsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'editedItemsJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByEncounterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encounterId', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByEncounterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encounterId', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByPromptVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptVersion', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByPromptVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promptVersion', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByRejectedItemsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedItemsJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy>
      thenByRejectedItemsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedItemsJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByRequestHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHash', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByRequestHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHash', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByRequestType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestType', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByRequestTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestType', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByResponseHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHash', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByResponseHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHash', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenBySuggestionDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionDataJson', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy>
      thenBySuggestionDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestionDataJson', Sort.desc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension AIRequestQueryWhereDistinct
    on QueryBuilder<AIRequest, AIRequest, QDistinct> {
  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByAcceptedItemsJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acceptedItemsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByDoctorAction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doctorAction', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByDoctorId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doctorId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByEditedItemsJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'editedItemsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByEncounterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encounterId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByPatientId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByPromptVersion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promptVersion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByRejectedItemsJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectedItemsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByRequestHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByRequestType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByResponseHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctBySuggestionDataJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestionDataJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIRequest, AIRequest, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension AIRequestQueryProperty
    on QueryBuilder<AIRequest, AIRequest, QQueryProperty> {
  QueryBuilder<AIRequest, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations>
      acceptedItemsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acceptedItemsJson');
    });
  }

  QueryBuilder<AIRequest, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> doctorActionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doctorAction');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> doctorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doctorId');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> editedItemsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'editedItemsJson');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> encounterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encounterId');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> patientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientId');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> promptVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promptVersion');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations>
      rejectedItemsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectedItemsJson');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> requestHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestHash');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> requestTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestType');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> responseHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseHash');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations>
      suggestionDataJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestionDataJson');
    });
  }

  QueryBuilder<AIRequest, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAuditLogCollection on Isar {
  IsarCollection<AuditLog> get auditLogs => this.collection();
}

const AuditLogSchema = CollectionSchema(
  name: r'AuditLog',
  id: -471939227267967960,
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
    r'details': PropertySchema(
      id: 2,
      name: r'details',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _auditLogEstimateSize,
  serialize: _auditLogSerialize,
  deserialize: _auditLogDeserialize,
  deserializeProp: _auditLogDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'action': IndexSchema(
      id: -2948318935682215514,
      name: r'action',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'action',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _auditLogGetId,
  getLinks: _auditLogGetLinks,
  attach: _auditLogAttach,
  version: '3.1.0+1',
);

int _auditLogEstimateSize(
  AuditLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.action;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.details;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _auditLogSerialize(
  AuditLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.details);
  writer.writeString(offsets[3], object.userId);
}

AuditLog _auditLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditLog();
  object.action = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.details = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.userId = reader.readStringOrNull(offsets[3]);
  return object;
}

P _auditLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditLogGetId(AuditLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditLogGetLinks(AuditLog object) {
  return [];
}

void _auditLogAttach(IsarCollection<dynamic> col, Id id, AuditLog object) {
  object.id = id;
}

extension AuditLogQueryWhereSort on QueryBuilder<AuditLog, AuditLog, QWhere> {
  QueryBuilder<AuditLog, AuditLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditLogQueryWhere on QueryBuilder<AuditLog, AuditLog, QWhereClause> {
  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> idBetween(
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

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> userIdEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> userIdNotEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> actionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'action',
        value: [null],
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> actionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'action',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> actionEqualTo(
      String? action) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'action',
        value: [action],
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterWhereClause> actionNotEqualTo(
      String? action) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [],
              upper: [action],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [action],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [action],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [],
              upper: [action],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AuditLogQueryFilter
    on QueryBuilder<AuditLog, AuditLog, QFilterCondition> {
  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'action',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'action',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionEqualTo(
    String? value, {
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionGreaterThan(
    String? value, {
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionLessThan(
    String? value, {
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionStartsWith(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionEndsWith(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionMatches(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'details',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'details',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'details',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'details',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'details',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'details',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension AuditLogQueryObject
    on QueryBuilder<AuditLog, AuditLog, QFilterCondition> {}

extension AuditLogQueryLinks
    on QueryBuilder<AuditLog, AuditLog, QFilterCondition> {}

extension AuditLogQuerySortBy on QueryBuilder<AuditLog, AuditLog, QSortBy> {
  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AuditLogQuerySortThenBy
    on QueryBuilder<AuditLog, AuditLog, QSortThenBy> {
  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AuditLogQueryWhereDistinct
    on QueryBuilder<AuditLog, AuditLog, QDistinct> {
  QueryBuilder<AuditLog, AuditLog, QDistinct> distinctByAction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AuditLog, AuditLog, QDistinct> distinctByDetails(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'details', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditLog, AuditLog, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension AuditLogQueryProperty
    on QueryBuilder<AuditLog, AuditLog, QQueryProperty> {
  QueryBuilder<AuditLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditLog, String?, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<AuditLog, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AuditLog, String?, QQueryOperations> detailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'details');
    });
  }

  QueryBuilder<AuditLog, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
