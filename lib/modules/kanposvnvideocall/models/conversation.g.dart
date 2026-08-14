// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCallConversationCollection on Isar {
  IsarCollection<VideoCallConversation> get videoCallConversations =>
      this.collection();
}

const VideoCallConversationSchema = CollectionSchema(
  name: r'VideoCallConversation',
  id: -4419540172177115229,
  properties: {
    r'avatarUrl': PropertySchema(
      id: 0,
      name: r'avatarUrl',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'lastMessageAt': PropertySchema(
      id: 2,
      name: r'lastMessageAt',
      type: IsarType.dateTime,
    ),
    r'lastMessageContent': PropertySchema(
      id: 3,
      name: r'lastMessageContent',
      type: IsarType.string,
    ),
    r'lastMessageId': PropertySchema(
      id: 4,
      name: r'lastMessageId',
      type: IsarType.string,
    ),
    r'memberUuids': PropertySchema(
      id: 5,
      name: r'memberUuids',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 7,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _VideoCallConversationsyncStatusEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 8,
      name: r'type',
      type: IsarType.byte,
      enumMap: _VideoCallConversationtypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 10,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _videoCallConversationEstimateSize,
  serialize: _videoCallConversationSerialize,
  deserialize: _videoCallConversationDeserialize,
  deserializeProp: _videoCallConversationDeserializeProp,
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
  getId: _videoCallConversationGetId,
  getLinks: _videoCallConversationGetLinks,
  attach: _videoCallConversationAttach,
  version: '3.1.0+1',
);

int _videoCallConversationEstimateSize(
  VideoCallConversation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastMessageContent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastMessageId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.memberUuids.length * 3;
  {
    for (var i = 0; i < object.memberUuids.length; i++) {
      final value = object.memberUuids[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.name;
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

void _videoCallConversationSerialize(
  VideoCallConversation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatarUrl);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.lastMessageAt);
  writer.writeString(offsets[3], object.lastMessageContent);
  writer.writeString(offsets[4], object.lastMessageId);
  writer.writeStringList(offsets[5], object.memberUuids);
  writer.writeString(offsets[6], object.name);
  writer.writeByte(offsets[7], object.syncStatus.index);
  writer.writeByte(offsets[8], object.type.index);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeString(offsets[10], object.uuid);
}

VideoCallConversation _videoCallConversationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoCallConversation();
  object.avatarUrl = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.lastMessageAt = reader.readDateTimeOrNull(offsets[2]);
  object.lastMessageContent = reader.readStringOrNull(offsets[3]);
  object.lastMessageId = reader.readStringOrNull(offsets[4]);
  object.memberUuids = reader.readStringList(offsets[5]) ?? [];
  object.name = reader.readStringOrNull(offsets[6]);
  object.syncStatus = _VideoCallConversationsyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      SyncStatus.synced;
  object.type = _VideoCallConversationtypeValueEnumMap[
          reader.readByteOrNull(offsets[8])] ??
      ConversationType.direct;
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  object.uuid = reader.readStringOrNull(offsets[10]);
  return object;
}

P _videoCallConversationDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_VideoCallConversationsyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 8:
      return (_VideoCallConversationtypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ConversationType.direct) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VideoCallConversationsyncStatusEnumValueMap = {
  'synced': 0,
  'pending': 1,
  'failed': 2,
};
const _VideoCallConversationsyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pending,
  2: SyncStatus.failed,
};
const _VideoCallConversationtypeEnumValueMap = {
  'direct': 0,
  'group': 1,
};
const _VideoCallConversationtypeValueEnumMap = {
  0: ConversationType.direct,
  1: ConversationType.group,
};

Id _videoCallConversationGetId(VideoCallConversation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoCallConversationGetLinks(
    VideoCallConversation object) {
  return [];
}

void _videoCallConversationAttach(
    IsarCollection<dynamic> col, Id id, VideoCallConversation object) {
  object.id = id;
}

extension VideoCallConversationByIndex
    on IsarCollection<VideoCallConversation> {
  Future<VideoCallConversation?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  VideoCallConversation? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<VideoCallConversation?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<VideoCallConversation?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(VideoCallConversation object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(VideoCallConversation object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<VideoCallConversation> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<VideoCallConversation> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension VideoCallConversationQueryWhereSort
    on QueryBuilder<VideoCallConversation, VideoCallConversation, QWhere> {
  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoCallConversationQueryWhere on QueryBuilder<VideoCallConversation,
    VideoCallConversation, QWhereClause> {
  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
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

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
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

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
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

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterWhereClause>
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

extension VideoCallConversationQueryFilter on QueryBuilder<
    VideoCallConversation, VideoCallConversation, QFilterCondition> {
  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarUrl',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarUrl',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      avatarUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      avatarUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> avatarUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastMessageAt',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastMessageAt',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMessageAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMessageAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMessageAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMessageAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastMessageContent',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastMessageContent',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMessageContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMessageContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMessageContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMessageContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastMessageContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastMessageContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      lastMessageContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastMessageContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      lastMessageContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastMessageContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMessageContent',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastMessageContent',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastMessageId',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastMessageId',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMessageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      lastMessageIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      lastMessageIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastMessageId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMessageId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> lastMessageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastMessageId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memberUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memberUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memberUuids',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memberUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memberUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      memberUuidsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memberUuids',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      memberUuidsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memberUuids',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberUuids',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memberUuids',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberUuids',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberUuids',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberUuids',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberUuids',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberUuids',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> memberUuidsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memberUuids',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> syncStatusGreaterThan(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> syncStatusLessThan(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> syncStatusBetween(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> typeEqualTo(ConversationType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> typeGreaterThan(
    ConversationType value, {
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> typeLessThan(
    ConversationType value, {
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> typeBetween(
    ConversationType lower,
    ConversationType upper, {
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
          QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation,
      QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension VideoCallConversationQueryObject on QueryBuilder<
    VideoCallConversation, VideoCallConversation, QFilterCondition> {}

extension VideoCallConversationQueryLinks on QueryBuilder<VideoCallConversation,
    VideoCallConversation, QFilterCondition> {}

extension VideoCallConversationQuerySortBy
    on QueryBuilder<VideoCallConversation, VideoCallConversation, QSortBy> {
  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByLastMessageAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByLastMessageAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByLastMessageContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageContent', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByLastMessageContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageContent', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByLastMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByLastMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension VideoCallConversationQuerySortThenBy
    on QueryBuilder<VideoCallConversation, VideoCallConversation, QSortThenBy> {
  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByLastMessageAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByLastMessageAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByLastMessageContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageContent', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByLastMessageContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageContent', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByLastMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByLastMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastMessageId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension VideoCallConversationQueryWhereDistinct
    on QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct> {
  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByAvatarUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByLastMessageAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMessageAt');
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByLastMessageContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMessageContent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByLastMessageId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastMessageId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByMemberUuids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memberUuids');
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VideoCallConversation, VideoCallConversation, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension VideoCallConversationQueryProperty on QueryBuilder<
    VideoCallConversation, VideoCallConversation, QQueryProperty> {
  QueryBuilder<VideoCallConversation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VideoCallConversation, String?, QQueryOperations>
      avatarUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarUrl');
    });
  }

  QueryBuilder<VideoCallConversation, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VideoCallConversation, DateTime?, QQueryOperations>
      lastMessageAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMessageAt');
    });
  }

  QueryBuilder<VideoCallConversation, String?, QQueryOperations>
      lastMessageContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMessageContent');
    });
  }

  QueryBuilder<VideoCallConversation, String?, QQueryOperations>
      lastMessageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastMessageId');
    });
  }

  QueryBuilder<VideoCallConversation, List<String>, QQueryOperations>
      memberUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memberUuids');
    });
  }

  QueryBuilder<VideoCallConversation, String?, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<VideoCallConversation, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallConversation, ConversationType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<VideoCallConversation, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VideoCallConversation, String?, QQueryOperations>
      uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
