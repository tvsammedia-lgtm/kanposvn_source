// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCallMessageCollection on Isar {
  IsarCollection<VideoCallMessage> get videoCallMessages => this.collection();
}

const VideoCallMessageSchema = CollectionSchema(
  name: r'VideoCallMessage',
  id: -7337437344932643877,
  properties: {
    r'attachmentId': PropertySchema(
      id: 0,
      name: r'attachmentId',
      type: IsarType.string,
    ),
    r'attachmentUrl': PropertySchema(
      id: 1,
      name: r'attachmentUrl',
      type: IsarType.string,
    ),
    r'clientMessageId': PropertySchema(
      id: 2,
      name: r'clientMessageId',
      type: IsarType.string,
    ),
    r'content': PropertySchema(
      id: 3,
      name: r'content',
      type: IsarType.string,
    ),
    r'conversationUuid': PropertySchema(
      id: 4,
      name: r'conversationUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 6,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'isEdited': PropertySchema(
      id: 7,
      name: r'isEdited',
      type: IsarType.bool,
    ),
    r'messageType': PropertySchema(
      id: 8,
      name: r'messageType',
      type: IsarType.byte,
      enumMap: _VideoCallMessagemessageTypeEnumValueMap,
    ),
    r'replyToId': PropertySchema(
      id: 9,
      name: r'replyToId',
      type: IsarType.string,
    ),
    r'senderUuid': PropertySchema(
      id: 10,
      name: r'senderUuid',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 11,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VideoCallMessagestatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 13,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _VideoCallMessagesyncStatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 14,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _videoCallMessageEstimateSize,
  serialize: _videoCallMessageSerialize,
  deserialize: _videoCallMessageDeserialize,
  deserializeProp: _videoCallMessageDeserializeProp,
  idName: r'id',
  indexes: {
    r'clientMessageId': IndexSchema(
      id: -5446652790308646705,
      name: r'clientMessageId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'clientMessageId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'serverId': IndexSchema(
      id: -7950187970872907662,
      name: r'serverId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'conversationUuid': IndexSchema(
      id: 2014229105734239249,
      name: r'conversationUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'conversationUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'senderUuid': IndexSchema(
      id: -3367767929882528527,
      name: r'senderUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'senderUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _videoCallMessageGetId,
  getLinks: _videoCallMessageGetLinks,
  attach: _videoCallMessageAttach,
  version: '3.1.0+1',
);

int _videoCallMessageEstimateSize(
  VideoCallMessage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attachmentId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.attachmentUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.clientMessageId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.conversationUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.replyToId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.senderUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _videoCallMessageSerialize(
  VideoCallMessage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.attachmentId);
  writer.writeString(offsets[1], object.attachmentUrl);
  writer.writeString(offsets[2], object.clientMessageId);
  writer.writeString(offsets[3], object.content);
  writer.writeString(offsets[4], object.conversationUuid);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeDateTime(offsets[6], object.deletedAt);
  writer.writeBool(offsets[7], object.isEdited);
  writer.writeByte(offsets[8], object.messageType.index);
  writer.writeString(offsets[9], object.replyToId);
  writer.writeString(offsets[10], object.senderUuid);
  writer.writeString(offsets[11], object.serverId);
  writer.writeByte(offsets[12], object.status.index);
  writer.writeByte(offsets[13], object.syncStatus.index);
  writer.writeDateTime(offsets[14], object.updatedAt);
}

VideoCallMessage _videoCallMessageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoCallMessage();
  object.attachmentId = reader.readStringOrNull(offsets[0]);
  object.attachmentUrl = reader.readStringOrNull(offsets[1]);
  object.clientMessageId = reader.readStringOrNull(offsets[2]);
  object.content = reader.readStringOrNull(offsets[3]);
  object.conversationUuid = reader.readStringOrNull(offsets[4]);
  object.createdAt = reader.readDateTimeOrNull(offsets[5]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[6]);
  object.id = id;
  object.isEdited = reader.readBool(offsets[7]);
  object.messageType = _VideoCallMessagemessageTypeValueEnumMap[
          reader.readByteOrNull(offsets[8])] ??
      MessageType.text;
  object.replyToId = reader.readStringOrNull(offsets[9]);
  object.senderUuid = reader.readStringOrNull(offsets[10]);
  object.serverId = reader.readStringOrNull(offsets[11]);
  object.status =
      _VideoCallMessagestatusValueEnumMap[reader.readByteOrNull(offsets[12])] ??
          MessageStatus.pending;
  object.syncStatus = _VideoCallMessagesyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[13])] ??
      SyncStatus.synced;
  object.updatedAt = reader.readDateTimeOrNull(offsets[14]);
  return object;
}

P _videoCallMessageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (_VideoCallMessagemessageTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MessageType.text) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (_VideoCallMessagestatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MessageStatus.pending) as P;
    case 13:
      return (_VideoCallMessagesyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VideoCallMessagemessageTypeEnumValueMap = {
  'text': 0,
  'image': 1,
  'video': 2,
  'file': 3,
  'voice': 4,
  'location': 5,
  'system': 6,
};
const _VideoCallMessagemessageTypeValueEnumMap = {
  0: MessageType.text,
  1: MessageType.image,
  2: MessageType.video,
  3: MessageType.file,
  4: MessageType.voice,
  5: MessageType.location,
  6: MessageType.system,
};
const _VideoCallMessagestatusEnumValueMap = {
  'pending': 0,
  'sending': 1,
  'sent': 2,
  'delivered': 3,
  'read': 4,
  'failed': 5,
  'deleted': 6,
};
const _VideoCallMessagestatusValueEnumMap = {
  0: MessageStatus.pending,
  1: MessageStatus.sending,
  2: MessageStatus.sent,
  3: MessageStatus.delivered,
  4: MessageStatus.read,
  5: MessageStatus.failed,
  6: MessageStatus.deleted,
};
const _VideoCallMessagesyncStatusEnumValueMap = {
  'synced': 0,
  'pending': 1,
  'failed': 2,
};
const _VideoCallMessagesyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pending,
  2: SyncStatus.failed,
};

Id _videoCallMessageGetId(VideoCallMessage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoCallMessageGetLinks(VideoCallMessage object) {
  return [];
}

void _videoCallMessageAttach(
    IsarCollection<dynamic> col, Id id, VideoCallMessage object) {
  object.id = id;
}

extension VideoCallMessageByIndex on IsarCollection<VideoCallMessage> {
  Future<VideoCallMessage?> getByClientMessageId(String? clientMessageId) {
    return getByIndex(r'clientMessageId', [clientMessageId]);
  }

  VideoCallMessage? getByClientMessageIdSync(String? clientMessageId) {
    return getByIndexSync(r'clientMessageId', [clientMessageId]);
  }

  Future<bool> deleteByClientMessageId(String? clientMessageId) {
    return deleteByIndex(r'clientMessageId', [clientMessageId]);
  }

  bool deleteByClientMessageIdSync(String? clientMessageId) {
    return deleteByIndexSync(r'clientMessageId', [clientMessageId]);
  }

  Future<List<VideoCallMessage?>> getAllByClientMessageId(
      List<String?> clientMessageIdValues) {
    final values = clientMessageIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'clientMessageId', values);
  }

  List<VideoCallMessage?> getAllByClientMessageIdSync(
      List<String?> clientMessageIdValues) {
    final values = clientMessageIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'clientMessageId', values);
  }

  Future<int> deleteAllByClientMessageId(List<String?> clientMessageIdValues) {
    final values = clientMessageIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'clientMessageId', values);
  }

  int deleteAllByClientMessageIdSync(List<String?> clientMessageIdValues) {
    final values = clientMessageIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'clientMessageId', values);
  }

  Future<Id> putByClientMessageId(VideoCallMessage object) {
    return putByIndex(r'clientMessageId', object);
  }

  Id putByClientMessageIdSync(VideoCallMessage object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'clientMessageId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClientMessageId(List<VideoCallMessage> objects) {
    return putAllByIndex(r'clientMessageId', objects);
  }

  List<Id> putAllByClientMessageIdSync(List<VideoCallMessage> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'clientMessageId', objects, saveLinks: saveLinks);
  }
}

extension VideoCallMessageQueryWhereSort
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QWhere> {
  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoCallMessageQueryWhere
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QWhereClause> {
  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause> idBetween(
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      clientMessageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientMessageId',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      clientMessageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clientMessageId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      clientMessageIdEqualTo(String? clientMessageId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clientMessageId',
        value: [clientMessageId],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      clientMessageIdNotEqualTo(String? clientMessageId) {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [serverId],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      serverIdNotEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [],
              upper: [serverId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [serverId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [serverId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [],
              upper: [serverId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      conversationUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'conversationUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      conversationUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'conversationUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      conversationUuidEqualTo(String? conversationUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'conversationUuid',
        value: [conversationUuid],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      conversationUuidNotEqualTo(String? conversationUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationUuid',
              lower: [],
              upper: [conversationUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationUuid',
              lower: [conversationUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationUuid',
              lower: [conversationUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationUuid',
              lower: [],
              upper: [conversationUuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      senderUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'senderUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      senderUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'senderUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      senderUuidEqualTo(String? senderUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'senderUuid',
        value: [senderUuid],
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterWhereClause>
      senderUuidNotEqualTo(String? senderUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderUuid',
              lower: [],
              upper: [senderUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderUuid',
              lower: [senderUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderUuid',
              lower: [senderUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'senderUuid',
              lower: [],
              upper: [senderUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VideoCallMessageQueryFilter
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QFilterCondition> {
  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentUrl',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentUrl',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      attachmentUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientMessageId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientMessageId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdEqualTo(
    String? value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdGreaterThan(
    String? value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdLessThan(
    String? value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientMessageId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientMessageId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      clientMessageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientMessageId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentEqualTo(
    String? value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentGreaterThan(
    String? value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentLessThan(
    String? value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentEndsWith(
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conversationUuid',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conversationUuid',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conversationUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conversationUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conversationUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conversationUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'conversationUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'conversationUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'conversationUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'conversationUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conversationUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      conversationUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'conversationUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      isEditedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEdited',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      messageTypeEqualTo(MessageType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'messageType',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      messageTypeGreaterThan(
    MessageType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'messageType',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      messageTypeLessThan(
    MessageType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'messageType',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      messageTypeBetween(
    MessageType lower,
    MessageType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'messageType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'replyToId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'replyToId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'replyToId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'replyToId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'replyToId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'replyToId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'replyToId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'replyToId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'replyToId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'replyToId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'replyToId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      replyToIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'replyToId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'senderUuid',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'senderUuid',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      senderUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      statusEqualTo(MessageStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      statusGreaterThan(
    MessageStatus value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      statusLessThan(
    MessageStatus value, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      statusBetween(
    MessageStatus lower,
    MessageStatus upper, {
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterFilterCondition>
      updatedAtBetween(
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
}

extension VideoCallMessageQueryObject
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QFilterCondition> {}

extension VideoCallMessageQueryLinks
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QFilterCondition> {}

extension VideoCallMessageQuerySortBy
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QSortBy> {
  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByAttachmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByAttachmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByAttachmentUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByAttachmentUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByClientMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByClientMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByConversationUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByConversationUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByIsEdited() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdited', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByIsEditedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdited', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByMessageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageType', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByMessageTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageType', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByReplyToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyToId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByReplyToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyToId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortBySenderUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortBySenderUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension VideoCallMessageQuerySortThenBy
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QSortThenBy> {
  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByAttachmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByAttachmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByAttachmentUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByAttachmentUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByClientMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByClientMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientMessageId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByConversationUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByConversationUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByIsEdited() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdited', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByIsEditedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEdited', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByMessageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageType', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByMessageTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messageType', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByReplyToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyToId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByReplyToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyToId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenBySenderUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenBySenderUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension VideoCallMessageQueryWhereDistinct
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct> {
  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByAttachmentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByAttachmentUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByClientMessageId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientMessageId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByConversationUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conversationUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByIsEdited() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEdited');
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByMessageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'messageType');
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByReplyToId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'replyToId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctBySenderUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallMessage, VideoCallMessage, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension VideoCallMessageQueryProperty
    on QueryBuilder<VideoCallMessage, VideoCallMessage, QQueryProperty> {
  QueryBuilder<VideoCallMessage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations>
      attachmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentId');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations>
      attachmentUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentUrl');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations>
      clientMessageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientMessageId');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations>
      conversationUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conversationUuid');
    });
  }

  QueryBuilder<VideoCallMessage, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VideoCallMessage, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<VideoCallMessage, bool, QQueryOperations> isEditedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEdited');
    });
  }

  QueryBuilder<VideoCallMessage, MessageType, QQueryOperations>
      messageTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'messageType');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations>
      replyToIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'replyToId');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations>
      senderUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderUuid');
    });
  }

  QueryBuilder<VideoCallMessage, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<VideoCallMessage, MessageStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VideoCallMessage, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallMessage, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
