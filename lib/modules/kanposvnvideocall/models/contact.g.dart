// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoCallContactCollection on Isar {
  IsarCollection<VideoCallContact> get videoCallContacts => this.collection();
}

const VideoCallContactSchema = CollectionSchema(
  name: r'VideoCallContact',
  id: -7713995700112492550,
  properties: {
    r'contactAvatarUrl': PropertySchema(
      id: 0,
      name: r'contactAvatarUrl',
      type: IsarType.string,
    ),
    r'contactName': PropertySchema(
      id: 1,
      name: r'contactName',
      type: IsarType.string,
    ),
    r'contactUuid': PropertySchema(
      id: 2,
      name: r'contactUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'ownerUuid': PropertySchema(
      id: 4,
      name: r'ownerUuid',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VideoCallContactstatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 6,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _VideoCallContactsyncStatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 8,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _videoCallContactEstimateSize,
  serialize: _videoCallContactSerialize,
  deserialize: _videoCallContactDeserialize,
  deserializeProp: _videoCallContactDeserializeProp,
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
    ),
    r'ownerUuid': IndexSchema(
      id: -4549126636694143499,
      name: r'ownerUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ownerUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'contactUuid': IndexSchema(
      id: -4815538406699943073,
      name: r'contactUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'contactUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _videoCallContactGetId,
  getLinks: _videoCallContactGetLinks,
  attach: _videoCallContactAttach,
  version: '3.1.0+1',
);

int _videoCallContactEstimateSize(
  VideoCallContact object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contactAvatarUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ownerUuid;
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

void _videoCallContactSerialize(
  VideoCallContact object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contactAvatarUrl);
  writer.writeString(offsets[1], object.contactName);
  writer.writeString(offsets[2], object.contactUuid);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.ownerUuid);
  writer.writeByte(offsets[5], object.status.index);
  writer.writeByte(offsets[6], object.syncStatus.index);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeString(offsets[8], object.uuid);
}

VideoCallContact _videoCallContactDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoCallContact();
  object.contactAvatarUrl = reader.readStringOrNull(offsets[0]);
  object.contactName = reader.readStringOrNull(offsets[1]);
  object.contactUuid = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.ownerUuid = reader.readStringOrNull(offsets[4]);
  object.status =
      _VideoCallContactstatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          ContactStatus.pending;
  object.syncStatus = _VideoCallContactsyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      SyncStatus.synced;
  object.updatedAt = reader.readDateTimeOrNull(offsets[7]);
  object.uuid = reader.readStringOrNull(offsets[8]);
  return object;
}

P _videoCallContactDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_VideoCallContactstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ContactStatus.pending) as P;
    case 6:
      return (_VideoCallContactsyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.synced) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VideoCallContactstatusEnumValueMap = {
  'pending': 0,
  'accepted': 1,
  'blocked': 2,
  'rejected': 3,
};
const _VideoCallContactstatusValueEnumMap = {
  0: ContactStatus.pending,
  1: ContactStatus.accepted,
  2: ContactStatus.blocked,
  3: ContactStatus.rejected,
};
const _VideoCallContactsyncStatusEnumValueMap = {
  'synced': 0,
  'pending': 1,
  'failed': 2,
};
const _VideoCallContactsyncStatusValueEnumMap = {
  0: SyncStatus.synced,
  1: SyncStatus.pending,
  2: SyncStatus.failed,
};

Id _videoCallContactGetId(VideoCallContact object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _videoCallContactGetLinks(VideoCallContact object) {
  return [];
}

void _videoCallContactAttach(
    IsarCollection<dynamic> col, Id id, VideoCallContact object) {
  object.id = id;
}

extension VideoCallContactByIndex on IsarCollection<VideoCallContact> {
  Future<VideoCallContact?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  VideoCallContact? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<VideoCallContact?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<VideoCallContact?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(VideoCallContact object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(VideoCallContact object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<VideoCallContact> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<VideoCallContact> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension VideoCallContactQueryWhereSort
    on QueryBuilder<VideoCallContact, VideoCallContact, QWhere> {
  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VideoCallContactQueryWhere
    on QueryBuilder<VideoCallContact, VideoCallContact, QWhereClause> {
  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause> idBetween(
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      ownerUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ownerUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      ownerUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ownerUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      ownerUuidEqualTo(String? ownerUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ownerUuid',
        value: [ownerUuid],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      ownerUuidNotEqualTo(String? ownerUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerUuid',
              lower: [],
              upper: [ownerUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerUuid',
              lower: [ownerUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerUuid',
              lower: [ownerUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerUuid',
              lower: [],
              upper: [ownerUuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      contactUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'contactUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      contactUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'contactUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      contactUuidEqualTo(String? contactUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'contactUuid',
        value: [contactUuid],
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterWhereClause>
      contactUuidNotEqualTo(String? contactUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contactUuid',
              lower: [],
              upper: [contactUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contactUuid',
              lower: [contactUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contactUuid',
              lower: [contactUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contactUuid',
              lower: [],
              upper: [contactUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VideoCallContactQueryFilter
    on QueryBuilder<VideoCallContact, VideoCallContact, QFilterCondition> {
  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactAvatarUrl',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactAvatarUrl',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactAvatarUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactAvatarUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactAvatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactAvatarUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactAvatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactName',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactName',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactName',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactName',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactUuid',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactUuid',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      contactUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownerUuid',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownerUuid',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      ownerUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      statusEqualTo(ContactStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      statusGreaterThan(
    ContactStatus value, {
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      statusLessThan(
    ContactStatus value, {
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      statusBetween(
    ContactStatus lower,
    ContactStatus upper, {
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
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

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension VideoCallContactQueryObject
    on QueryBuilder<VideoCallContact, VideoCallContact, QFilterCondition> {}

extension VideoCallContactQueryLinks
    on QueryBuilder<VideoCallContact, VideoCallContact, QFilterCondition> {}

extension VideoCallContactQuerySortBy
    on QueryBuilder<VideoCallContact, VideoCallContact, QSortBy> {
  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByContactAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactAvatarUrl', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByContactAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactAvatarUrl', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByContactUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByContactUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByOwnerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByOwnerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension VideoCallContactQuerySortThenBy
    on QueryBuilder<VideoCallContact, VideoCallContact, QSortThenBy> {
  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByContactAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactAvatarUrl', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByContactAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactAvatarUrl', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByContactUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByContactUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByOwnerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByOwnerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUuid', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension VideoCallContactQueryWhereDistinct
    on QueryBuilder<VideoCallContact, VideoCallContact, QDistinct> {
  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctByContactAvatarUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactAvatarUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctByContactName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctByContactUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctByOwnerUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<VideoCallContact, VideoCallContact, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension VideoCallContactQueryProperty
    on QueryBuilder<VideoCallContact, VideoCallContact, QQueryProperty> {
  QueryBuilder<VideoCallContact, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VideoCallContact, String?, QQueryOperations>
      contactAvatarUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactAvatarUrl');
    });
  }

  QueryBuilder<VideoCallContact, String?, QQueryOperations>
      contactNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactName');
    });
  }

  QueryBuilder<VideoCallContact, String?, QQueryOperations>
      contactUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactUuid');
    });
  }

  QueryBuilder<VideoCallContact, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VideoCallContact, String?, QQueryOperations>
      ownerUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerUuid');
    });
  }

  QueryBuilder<VideoCallContact, ContactStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VideoCallContact, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<VideoCallContact, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<VideoCallContact, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
