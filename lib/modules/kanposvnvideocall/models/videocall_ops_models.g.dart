// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videocall_ops_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCallSessionCollection on Isar {
  IsarCollection<VideoCallSession> get videoCallSessions => this.collection();
}

const VideoCallSessionSchema = CollectionSchema(
  name: r'VideoCallSession',
  id: 2790390404316081456,
  properties: {
    r'callId': PropertySchema(
      id: 0,
      name: r'callId',
      type: IsarType.string,
    ),
    r'callType': PropertySchema(
      id: 1,
      name: r'callType',
      type: IsarType.string,
    ),
    r'callerUuid': PropertySchema(
      id: 2,
      name: r'callerUuid',
      type: IsarType.string,
    ),
    r'connectedAt': PropertySchema(
      id: 3,
      name: r'connectedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endedAt': PropertySchema(
      id: 5,
      name: r'endedAt',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'receiverUuid': PropertySchema(
      id: 7,
      name: r'receiverUuid',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 8,
      name: r'state',
      type: IsarType.byte,
      enumMap: _VideoCallSessionstateEnumValueMap,
    )
  },
  estimateSize: _videoCallSessionEstimateSize,
  serialize: _videoCallSessionSerialize,
  deserialize: _videoCallSessionDeserialize,
  deserializeProp: _videoCallSessionDeserializeProp,
  idName: r'id',
  indexes: {
    r'callId': IndexSchema(
      id: 7116320153300369584,
      name: r'callId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'callId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _videoCallSessionGetId,
  getLinks: _videoCallSessionGetLinks,
  attach: _videoCallSessionAttach,
  version: '3.1.0+1',
);

int _videoCallSessionEstimateSize(
  VideoCallSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.callId.length * 3;
  bytesCount += 3 + object.callType.length * 3;
  bytesCount += 3 + object.callerUuid.length * 3;
  bytesCount += 3 + object.receiverUuid.length * 3;
  return bytesCount;
}

void _videoCallSessionSerialize(
  VideoCallSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.callId);
  writer.writeString(offsets[1], object.callType);
  writer.writeString(offsets[2], object.callerUuid);
  writer.writeDateTime(offsets[3], object.connectedAt);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDateTime(offsets[5], object.endedAt);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.receiverUuid);
  writer.writeByte(offsets[8], object.state.index);
}

VideoCallSession _videoCallSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoCallSession();
  object.callId = reader.readString(offsets[0]);
  object.callType = reader.readString(offsets[1]);
  object.callerUuid = reader.readString(offsets[2]);
  object.connectedAt = reader.readDateTimeOrNull(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.endedAt = reader.readDateTimeOrNull(offsets[5]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[6]);
  object.receiverUuid = reader.readString(offsets[7]);
  object.state =
      _VideoCallSessionstateValueEnumMap[reader.readByteOrNull(offsets[8])] ??
          CallSessionState.calling;
  return object;
}

P _videoCallSessionDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_VideoCallSessionstateValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CallSessionState.calling) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VideoCallSessionstateEnumValueMap = {
  'calling': 0,
  'ringing': 1,
  'accepted': 2,
  'connecting': 3,
  'connected': 4,
  'reconnecting': 5,
  'ended': 6,
  'rejected': 7,
  'busy': 8,
  'missed': 9,
  'cancelled': 10,
  'failed': 11,
};
const _VideoCallSessionstateValueEnumMap = {
  0: CallSessionState.calling,
  1: CallSessionState.ringing,
  2: CallSessionState.accepted,
  3: CallSessionState.connecting,
  4: CallSessionState.connected,
  5: CallSessionState.reconnecting,
  6: CallSessionState.ended,
  7: CallSessionState.rejected,
  8: CallSessionState.busy,
  9: CallSessionState.missed,
  10: CallSessionState.cancelled,
  11: CallSessionState.failed,
};

Id _videoCallSessionGetId(VideoCallSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoCallSessionGetLinks(VideoCallSession object) {
  return [];
}

void _videoCallSessionAttach(
    IsarCollection<dynamic> col, Id id, VideoCallSession object) {
  object.id = id;
}

extension VideoCallSessionByIndex on IsarCollection<VideoCallSession> {
  Future<VideoCallSession?> getByCallId(String callId) {
    return getByIndex(r'callId', [callId]);
  }

  VideoCallSession? getByCallIdSync(String callId) {
    return getByIndexSync(r'callId', [callId]);
  }

  Future<bool> deleteByCallId(String callId) {
    return deleteByIndex(r'callId', [callId]);
  }

  bool deleteByCallIdSync(String callId) {
    return deleteByIndexSync(r'callId', [callId]);
  }

  Future<List<VideoCallSession?>> getAllByCallId(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'callId', values);
  }

  List<VideoCallSession?> getAllByCallIdSync(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'callId', values);
  }

  Future<int> deleteAllByCallId(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'callId', values);
  }

  int deleteAllByCallIdSync(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'callId', values);
  }

  Future<Id> putByCallId(VideoCallSession object) {
    return putByIndex(r'callId', object);
  }

  Id putByCallIdSync(VideoCallSession object, {bool saveLinks = true}) {
    return putByIndexSync(r'callId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCallId(List<VideoCallSession> objects) {
    return putAllByIndex(r'callId', objects);
  }

  List<Id> putAllByCallIdSync(List<VideoCallSession> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'callId', objects, saveLinks: saveLinks);
  }
}

extension VideoCallSessionQueryWhereSort
    on QueryBuilder<VideoCallSession, VideoCallSession, QWhere> {
  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoCallSessionQueryWhere
    on QueryBuilder<VideoCallSession, VideoCallSession, QWhereClause> {
  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhereClause>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhereClause> idBetween(
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhereClause>
      callIdEqualTo(String callId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'callId',
        value: [callId],
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterWhereClause>
      callIdNotEqualTo(String callId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [],
              upper: [callId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [callId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [callId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [],
              upper: [callId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VideoCallSessionQueryFilter
    on QueryBuilder<VideoCallSession, VideoCallSession, QFilterCondition> {
  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'callId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'callId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'callId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'callType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'callType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'callType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'callType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'callType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'callType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'callType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callType',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'callType',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidEqualTo(
    String value, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidGreaterThan(
    String value, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidLessThan(
    String value, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'callerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'callerUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      callerUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'callerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      connectedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'connectedAt',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      connectedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'connectedAt',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      connectedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      connectedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'connectedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      connectedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'connectedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      connectedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'connectedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      endedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endedAt',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      endedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endedAt',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      endedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidEqualTo(
    String value, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidGreaterThan(
    String value, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidLessThan(
    String value, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
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

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      receiverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      stateEqualTo(CallSessionState value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      stateGreaterThan(
    CallSessionState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      stateLessThan(
    CallSessionState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterFilterCondition>
      stateBetween(
    CallSessionState lower,
    CallSessionState upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VideoCallSessionQueryObject
    on QueryBuilder<VideoCallSession, VideoCallSession, QFilterCondition> {}

extension VideoCallSessionQueryLinks
    on QueryBuilder<VideoCallSession, VideoCallSession, QFilterCondition> {}

extension VideoCallSessionQuerySortBy
    on QueryBuilder<VideoCallSession, VideoCallSession, QSortBy> {
  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCallId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCallIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCallType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callType', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCallTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callType', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCallerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCallerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByConnectedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByConnectedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByReceiverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByReceiverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension VideoCallSessionQuerySortThenBy
    on QueryBuilder<VideoCallSession, VideoCallSession, QSortThenBy> {
  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCallId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCallIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCallType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callType', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCallTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callType', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCallerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCallerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callerUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByConnectedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByConnectedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByReceiverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByReceiverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QAfterSortBy>
      thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension VideoCallSessionQueryWhereDistinct
    on QueryBuilder<VideoCallSession, VideoCallSession, QDistinct> {
  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct> distinctByCallId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'callId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByCallType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'callType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByCallerUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'callerUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByConnectedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connectedAt');
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endedAt');
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByReceiverUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSession, VideoCallSession, QDistinct>
      distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state');
    });
  }
}

extension VideoCallSessionQueryProperty
    on QueryBuilder<VideoCallSession, VideoCallSession, QQueryProperty> {
  QueryBuilder<VideoCallSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VideoCallSession, String, QQueryOperations> callIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'callId');
    });
  }

  QueryBuilder<VideoCallSession, String, QQueryOperations> callTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'callType');
    });
  }

  QueryBuilder<VideoCallSession, String, QQueryOperations>
      callerUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'callerUuid');
    });
  }

  QueryBuilder<VideoCallSession, DateTime?, QQueryOperations>
      connectedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connectedAt');
    });
  }

  QueryBuilder<VideoCallSession, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VideoCallSession, DateTime?, QQueryOperations>
      endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endedAt');
    });
  }

  QueryBuilder<VideoCallSession, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VideoCallSession, String, QQueryOperations>
      receiverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverUuid');
    });
  }

  QueryBuilder<VideoCallSession, CallSessionState, QQueryOperations>
      stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCallReactionCollection on Isar {
  IsarCollection<VideoCallReaction> get videoCallReactions => this.collection();
}

const VideoCallReactionSchema = CollectionSchema(
  name: r'VideoCallReaction',
  id: -1572627302125362934,
  properties: {
    r'clientMessageId': PropertySchema(
      id: 0,
      name: r'clientMessageId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'emoji': PropertySchema(
      id: 2,
      name: r'emoji',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'reactionId': PropertySchema(
      id: 4,
      name: r'reactionId',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _videoCallReactionEstimateSize,
  serialize: _videoCallReactionSerialize,
  deserialize: _videoCallReactionDeserialize,
  deserializeProp: _videoCallReactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'reactionId': IndexSchema(
      id: -3458145932292683308,
      name: r'reactionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'reactionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'clientMessageId': IndexSchema(
      id: -5446652790308646705,
      name: r'clientMessageId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'clientMessageId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _videoCallReactionGetId,
  getLinks: _videoCallReactionGetLinks,
  attach: _videoCallReactionAttach,
  version: '3.1.0+1',
);

int _videoCallReactionEstimateSize(
  VideoCallReaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.clientMessageId.length * 3;
  bytesCount += 3 + object.emoji.length * 3;
  bytesCount += 3 + object.reactionId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _videoCallReactionSerialize(
  VideoCallReaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.clientMessageId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.emoji);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.reactionId);
  writer.writeString(offsets[5], object.userId);
}

VideoCallReaction _videoCallReactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoCallReaction();
  object.clientMessageId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.emoji = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.reactionId = reader.readString(offsets[4]);
  object.userId = reader.readString(offsets[5]);
  return object;
}

P _videoCallReactionDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _videoCallReactionGetId(VideoCallReaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoCallReactionGetLinks(
    VideoCallReaction object) {
  return [];
}

void _videoCallReactionAttach(
    IsarCollection<dynamic> col, Id id, VideoCallReaction object) {
  object.id = id;
}

extension VideoCallReactionByIndex on IsarCollection<VideoCallReaction> {
  Future<VideoCallReaction?> getByReactionId(String reactionId) {
    return getByIndex(r'reactionId', [reactionId]);
  }

  VideoCallReaction? getByReactionIdSync(String reactionId) {
    return getByIndexSync(r'reactionId', [reactionId]);
  }

  Future<bool> deleteByReactionId(String reactionId) {
    return deleteByIndex(r'reactionId', [reactionId]);
  }

  bool deleteByReactionIdSync(String reactionId) {
    return deleteByIndexSync(r'reactionId', [reactionId]);
  }

  Future<List<VideoCallReaction?>> getAllByReactionId(
      List<String> reactionIdValues) {
    final values = reactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'reactionId', values);
  }

  List<VideoCallReaction?> getAllByReactionIdSync(
      List<String> reactionIdValues) {
    final values = reactionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'reactionId', values);
  }

  Future<int> deleteAllByReactionId(List<String> reactionIdValues) {
    final values = reactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'reactionId', values);
  }

  int deleteAllByReactionIdSync(List<String> reactionIdValues) {
    final values = reactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'reactionId', values);
  }

  Future<Id> putByReactionId(VideoCallReaction object) {
    return putByIndex(r'reactionId', object);
  }

  Id putByReactionIdSync(VideoCallReaction object, {bool saveLinks = true}) {
    return putByIndexSync(r'reactionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByReactionId(List<VideoCallReaction> objects) {
    return putAllByIndex(r'reactionId', objects);
  }

  List<Id> putAllByReactionIdSync(List<VideoCallReaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'reactionId', objects, saveLinks: saveLinks);
  }
}

extension VideoCallReactionQueryWhereSort
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QWhere> {
  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoCallReactionQueryWhere
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QWhereClause> {
  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      reactionIdEqualTo(String reactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reactionId',
        value: [reactionId],
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      reactionIdNotEqualTo(String reactionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reactionId',
              lower: [],
              upper: [reactionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reactionId',
              lower: [reactionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reactionId',
              lower: [reactionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reactionId',
              lower: [],
              upper: [reactionId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      clientMessageIdEqualTo(String clientMessageId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientMessageId',
        value: [clientMessageId],
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterWhereClause>
      clientMessageIdNotEqualTo(String clientMessageId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMessageId',
              lower: [],
              upper: [clientMessageId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMessageId',
              lower: [clientMessageId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMessageId',
              lower: [clientMessageId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clientMessageId',
              lower: [],
              upper: [clientMessageId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VideoCallReactionQueryFilter
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QFilterCondition> {
  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientMessageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientMessageId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientMessageId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      clientMessageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientMessageId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emoji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emoji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      emojiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reactionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      reactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdLessThan(
    String value, {
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdStartsWith(
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdEndsWith(
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

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension VideoCallReactionQueryObject
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QFilterCondition> {}

extension VideoCallReactionQueryLinks
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QFilterCondition> {}

extension VideoCallReactionQuerySortBy
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QSortBy> {
  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByClientMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByClientMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByReactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByReactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VideoCallReactionQuerySortThenBy
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QSortThenBy> {
  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByClientMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByClientMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByReactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByReactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reactionId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension VideoCallReactionQueryWhereDistinct
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QDistinct> {
  QueryBuilder<VideoCallReaction, VideoCallReaction, QDistinct>
      distinctByClientMessageId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientMessageId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QDistinct> distinctByEmoji(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emoji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QDistinct>
      distinctByReactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reactionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallReaction, VideoCallReaction, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension VideoCallReactionQueryProperty
    on QueryBuilder<VideoCallReaction, VideoCallReaction, QQueryProperty> {
  QueryBuilder<VideoCallReaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VideoCallReaction, String, QQueryOperations>
      clientMessageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientMessageId');
    });
  }

  QueryBuilder<VideoCallReaction, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VideoCallReaction, String, QQueryOperations> emojiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emoji');
    });
  }

  QueryBuilder<VideoCallReaction, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<VideoCallReaction, String, QQueryOperations>
      reactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reactionId');
    });
  }

  QueryBuilder<VideoCallReaction, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCallSyncQueueItemCollection on Isar {
  IsarCollection<VideoCallSyncQueueItem> get videoCallSyncQueueItems =>
      this.collection();
}

const VideoCallSyncQueueItemSchema = CollectionSchema(
  name: r'VideoCallSyncQueueItem',
  id: 1089035037259564526,
  properties: {
    r'entityType': PropertySchema(
      id: 0,
      name: r'entityType',
      type: IsarType.string,
    ),
    r'entityUuid': PropertySchema(
      id: 1,
      name: r'entityUuid',
      type: IsarType.string,
    ),
    r'lastError': PropertySchema(
      id: 2,
      name: r'lastError',
      type: IsarType.string,
    ),
    r'operation': PropertySchema(
      id: 3,
      name: r'operation',
      type: IsarType.string,
    ),
    r'payloadJson': PropertySchema(
      id: 4,
      name: r'payloadJson',
      type: IsarType.string,
    ),
    r'queueId': PropertySchema(
      id: 5,
      name: r'queueId',
      type: IsarType.string,
    ),
    r'retryCount': PropertySchema(
      id: 6,
      name: r'retryCount',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _videoCallSyncQueueItemEstimateSize,
  serialize: _videoCallSyncQueueItemSerialize,
  deserialize: _videoCallSyncQueueItemDeserialize,
  deserializeProp: _videoCallSyncQueueItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'queueId': IndexSchema(
      id: -3743451411909378321,
      name: r'queueId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'queueId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _videoCallSyncQueueItemGetId,
  getLinks: _videoCallSyncQueueItemGetLinks,
  attach: _videoCallSyncQueueItemAttach,
  version: '3.1.0+1',
);

int _videoCallSyncQueueItemEstimateSize(
  VideoCallSyncQueueItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entityType.length * 3;
  bytesCount += 3 + object.entityUuid.length * 3;
  {
    final value = object.lastError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.operation.length * 3;
  bytesCount += 3 + object.payloadJson.length * 3;
  bytesCount += 3 + object.queueId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _videoCallSyncQueueItemSerialize(
  VideoCallSyncQueueItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.entityType);
  writer.writeString(offsets[1], object.entityUuid);
  writer.writeString(offsets[2], object.lastError);
  writer.writeString(offsets[3], object.operation);
  writer.writeString(offsets[4], object.payloadJson);
  writer.writeString(offsets[5], object.queueId);
  writer.writeLong(offsets[6], object.retryCount);
  writer.writeString(offsets[7], object.status);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

VideoCallSyncQueueItem _videoCallSyncQueueItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoCallSyncQueueItem();
  object.entityType = reader.readString(offsets[0]);
  object.entityUuid = reader.readString(offsets[1]);
  object.id = id;
  object.lastError = reader.readStringOrNull(offsets[2]);
  object.operation = reader.readString(offsets[3]);
  object.payloadJson = reader.readString(offsets[4]);
  object.queueId = reader.readString(offsets[5]);
  object.retryCount = reader.readLong(offsets[6]);
  object.status = reader.readString(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  return object;
}

P _videoCallSyncQueueItemDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _videoCallSyncQueueItemGetId(VideoCallSyncQueueItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoCallSyncQueueItemGetLinks(
    VideoCallSyncQueueItem object) {
  return [];
}

void _videoCallSyncQueueItemAttach(
    IsarCollection<dynamic> col, Id id, VideoCallSyncQueueItem object) {
  object.id = id;
}

extension VideoCallSyncQueueItemByIndex
    on IsarCollection<VideoCallSyncQueueItem> {
  Future<VideoCallSyncQueueItem?> getByQueueId(String queueId) {
    return getByIndex(r'queueId', [queueId]);
  }

  VideoCallSyncQueueItem? getByQueueIdSync(String queueId) {
    return getByIndexSync(r'queueId', [queueId]);
  }

  Future<bool> deleteByQueueId(String queueId) {
    return deleteByIndex(r'queueId', [queueId]);
  }

  bool deleteByQueueIdSync(String queueId) {
    return deleteByIndexSync(r'queueId', [queueId]);
  }

  Future<List<VideoCallSyncQueueItem?>> getAllByQueueId(
      List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'queueId', values);
  }

  List<VideoCallSyncQueueItem?> getAllByQueueIdSync(
      List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'queueId', values);
  }

  Future<int> deleteAllByQueueId(List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'queueId', values);
  }

  int deleteAllByQueueIdSync(List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'queueId', values);
  }

  Future<Id> putByQueueId(VideoCallSyncQueueItem object) {
    return putByIndex(r'queueId', object);
  }

  Id putByQueueIdSync(VideoCallSyncQueueItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'queueId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQueueId(List<VideoCallSyncQueueItem> objects) {
    return putAllByIndex(r'queueId', objects);
  }

  List<Id> putAllByQueueIdSync(List<VideoCallSyncQueueItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'queueId', objects, saveLinks: saveLinks);
  }
}

extension VideoCallSyncQueueItemQueryWhereSort
    on QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QWhere> {
  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoCallSyncQueueItemQueryWhere on QueryBuilder<
    VideoCallSyncQueueItem, VideoCallSyncQueueItem, QWhereClause> {
  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterWhereClause> queueIdEqualTo(String queueId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'queueId',
        value: [queueId],
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterWhereClause> queueIdNotEqualTo(String queueId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [],
              upper: [queueId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [queueId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [queueId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [],
              upper: [queueId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VideoCallSyncQueueItemQueryFilter on QueryBuilder<
    VideoCallSyncQueueItem, VideoCallSyncQueueItem, QFilterCondition> {
  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeEqualTo(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeGreaterThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeLessThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeBetween(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeStartsWith(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeEndsWith(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidEqualTo(
    String value, {
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidGreaterThan(
    String value, {
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidLessThan(
    String value, {
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidBetween(
    String lower,
    String upper, {
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidStartsWith(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidEndsWith(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      entityUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      entityUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> entityUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastError',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastError',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      lastErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      lastErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastError',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastError',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> lastErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastError',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationEqualTo(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationGreaterThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationLessThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationBetween(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationStartsWith(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationEndsWith(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      operationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      operationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> operationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payloadJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      payloadJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payloadJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      payloadJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payloadJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> payloadJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'queueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      queueIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      queueIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'queueId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queueId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> queueIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'queueId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> retryCountGreaterThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> retryCountLessThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> retryCountBetween(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem,
      QAfterFilterCondition> updatedAtBetween(
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
}

extension VideoCallSyncQueueItemQueryObject on QueryBuilder<
    VideoCallSyncQueueItem, VideoCallSyncQueueItem, QFilterCondition> {}

extension VideoCallSyncQueueItemQueryLinks on QueryBuilder<
    VideoCallSyncQueueItem, VideoCallSyncQueueItem, QFilterCondition> {}

extension VideoCallSyncQueueItemQuerySortBy
    on QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QSortBy> {
  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByEntityUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByEntityUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByQueueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByQueueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension VideoCallSyncQueueItemQuerySortThenBy on QueryBuilder<
    VideoCallSyncQueueItem, VideoCallSyncQueueItem, QSortThenBy> {
  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByEntityUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByEntityUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByQueueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByQueueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension VideoCallSyncQueueItemQueryWhereDistinct
    on QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct> {
  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByEntityType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByEntityUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByLastError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByOperation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByPayloadJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payloadJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByQueueId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'queueId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, VideoCallSyncQueueItem, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension VideoCallSyncQueueItemQueryProperty on QueryBuilder<
    VideoCallSyncQueueItem, VideoCallSyncQueueItem, QQueryProperty> {
  QueryBuilder<VideoCallSyncQueueItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, String, QQueryOperations>
      entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, String, QQueryOperations>
      entityUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityUuid');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, String?, QQueryOperations>
      lastErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastError');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, String, QQueryOperations>
      operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, String, QQueryOperations>
      payloadJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payloadJson');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, String, QQueryOperations>
      queueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queueId');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, int, QQueryOperations>
      retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, String, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VideoCallSyncQueueItem, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
