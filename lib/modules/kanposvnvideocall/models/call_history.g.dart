// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCallHistoryCollection on Isar {
  IsarCollection<VideoCallHistory> get videoCallHistorys => this.collection();
}

const VideoCallHistorySchema = CollectionSchema(
  name: r'VideoCallHistory',
  id: -4568617125064063857,
  properties: {
    r'callerUuid': PropertySchema(
      id: 0,
      name: r'callerUuid',
      type: IsarType.string,
    ),
    r'durationSeconds': PropertySchema(
      id: 1,
      name: r'durationSeconds',
      type: IsarType.long,
    ),
    r'endedAt': PropertySchema(
      id: 2,
      name: r'endedAt',
      type: IsarType.dateTime,
    ),
    r'receiverUuid': PropertySchema(
      id: 3,
      name: r'receiverUuid',
      type: IsarType.string,
    ),
    r'startedAt': PropertySchema(
      id: 4,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VideoCallHistorystatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 6,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _VideoCallHistorysyncStatusEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 7,
      name: r'type',
      type: IsarType.byte,
      enumMap: _VideoCallHistorytypeEnumValueMap,
    ),
    r'uuid': PropertySchema(
      id: 8,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _videoCallHistoryEstimateSize,
  serialize: _videoCallHistorySerialize,
  deserialize: _videoCallHistoryDeserialize,
  deserializeProp: _videoCallHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: true,
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
  getId: _videoCallHistoryGetId,
  getLinks: _videoCallHistoryGetLinks,
  attach: _videoCallHistoryAttach,
  version: '3.1.0+1',
);

int _videoCallHistoryEstimateSize(
  VideoCallHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.callerUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.receiverUuid;
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

void _videoCallHistorySerialize(
  VideoCallHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.callerUuid);
  writer.writeLong(offsets[1], object.durationSeconds);
  writer.writeDateTime(offsets[2], object.endedAt);
  writer.writeString(offsets[3], object.receiverUuid);
  writer.writeDateTime(offsets[4], object.startedAt);
  writer.writeByte(offsets[5], object.status.index);
  writer.writeByte(offsets[6], object.syncStatus.index);
  writer.writeByte(offsets[7], object.type.index);
  writer.writeString(offsets[8], object.uuid);
}

VideoCallHistory _videoCallHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoCallHistory();
  object.callerUuid = reader.readStringOrNull(offsets[0]);
  object.durationSeconds = reader.readLongOrNull(offsets[1]);
  object.endedAt = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.receiverUuid = reader.readStringOrNull(offsets[3]);
  object.startedAt = reader.readDateTimeOrNull(offsets[4]);
  object.status =
      _VideoCallHistorystatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          CallHistoryStatus.completed;
  object.syncStatus = _VideoCallHistorysyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      SyncStatus.synced;
  object.type =
      _VideoCallHistorytypeValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          CallType.voice;
  object.uuid = reader.readStringOrNull(offsets[8]);
  return object;
}

P _videoCallHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (_VideoCallHistorystatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CallHistoryStatus.completed) as P;
    case 6:
      return (_VideoCallHistorysyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 7:
      return (_VideoCallHistorytypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CallType.voice) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VideoCallHistorystatusEnumValueMap = {
  'completed': 0,
  'missed': 1,
  'rejected': 2,
  'cancelled': 3,
};
const _VideoCallHistorystatusValueEnumMap = {
  0: CallHistoryStatus.completed,
  1: CallHistoryStatus.missed,
  2: CallHistoryStatus.rejected,
  3: CallHistoryStatus.cancelled,
};
const _VideoCallHistorysyncStatusEnumValueMap = {
  'synced': 0,
  'pending': 1,
  'failed': 2,
};
const _VideoCallHistorysyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pending,
  2: SyncStatus.failed,
};
const _VideoCallHistorytypeEnumValueMap = {
  'voice': 0,
  'video': 1,
};
const _VideoCallHistorytypeValueEnumMap = {
  0: CallType.voice,
  1: CallType.video,
};

Id _videoCallHistoryGetId(VideoCallHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoCallHistoryGetLinks(VideoCallHistory object) {
  return [];
}

void _videoCallHistoryAttach(
    IsarCollection<dynamic> col, Id id, VideoCallHistory object) {
  object.id = id;
}

extension VideoCallHistoryByIndex on IsarCollection<VideoCallHistory> {
  Future<VideoCallHistory?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  VideoCallHistory? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<VideoCallHistory?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<VideoCallHistory?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(VideoCallHistory object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(VideoCallHistory object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<VideoCallHistory> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<VideoCallHistory> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension VideoCallHistoryQueryWhereSort
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QWhere> {
  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoCallHistoryQueryWhere
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QWhereClause> {
  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause> idBetween(
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterWhereClause>
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

extension VideoCallHistoryQueryFilter
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QFilterCondition> {
  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'callerUuid',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'callerUuid',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'callerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'callerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'callerUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'callerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'callerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'callerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'callerUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      callerUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'callerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      durationSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationSeconds',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      durationSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationSeconds',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      durationSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      durationSecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      durationSecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      durationSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      endedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endedAt',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      endedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endedAt',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      endedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      endedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      endedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      endedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receiverUuid',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receiverUuid',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      receiverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      startedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      startedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      startedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      statusEqualTo(CallHistoryStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      statusGreaterThan(
    CallHistoryStatus value, {
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      statusLessThan(
    CallHistoryStatus value, {
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      statusBetween(
    CallHistoryStatus lower,
    CallHistoryStatus upper, {
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      syncStatusGreaterThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      syncStatusLessThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      typeEqualTo(CallType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      typeGreaterThan(
    CallType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      typeLessThan(
    CallType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      typeBetween(
    CallType lower,
    CallType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
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

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension VideoCallHistoryQueryObject
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QFilterCondition> {}

extension VideoCallHistoryQueryLinks
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QFilterCondition> {}

extension VideoCallHistoryQuerySortBy
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QSortBy> {
  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByCallerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByCallerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByReceiverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByReceiverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension VideoCallHistoryQuerySortThenBy
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QSortThenBy> {
  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByCallerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByCallerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByReceiverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByReceiverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension VideoCallHistoryQueryWhereDistinct
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct> {
  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct>
      distinctByCallerUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'callerUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct>
      distinctByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationSeconds');
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct>
      distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endedAt');
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct>
      distinctByReceiverUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<VideoCallHistory, VideoCallHistory, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension VideoCallHistoryQueryProperty
    on QueryBuilder<VideoCallHistory, VideoCallHistory, QQueryProperty> {
  QueryBuilder<VideoCallHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VideoCallHistory, String?, QQueryOperations>
      callerUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'callerUuid');
    });
  }

  QueryBuilder<VideoCallHistory, int?, QQueryOperations>
      durationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationSeconds');
    });
  }

  QueryBuilder<VideoCallHistory, DateTime?, QQueryOperations>
      endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endedAt');
    });
  }

  QueryBuilder<VideoCallHistory, String?, QQueryOperations>
      receiverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverUuid');
    });
  }

  QueryBuilder<VideoCallHistory, DateTime?, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<VideoCallHistory, CallHistoryStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VideoCallHistory, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallHistory, CallType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<VideoCallHistory, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
