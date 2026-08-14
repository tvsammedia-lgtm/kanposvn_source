// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguLessonCollection on Isar {
  IsarCollection<NgoaiNguLesson> get ngoaiNguLessons => this.collection();
}

const NgoaiNguLessonSchema = CollectionSchema(
  name: r'NgoaiNguLesson',
  id: 1286303390800548432,
  properties: {
    r'branchId': PropertySchema(
      id: 0,
      name: r'branchId',
      type: IsarType.string,
    ),
    r'centerId': PropertySchema(
      id: 1,
      name: r'centerId',
      type: IsarType.string,
    ),
    r'classUuid': PropertySchema(
      id: 2,
      name: r'classUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endTime': PropertySchema(
      id: 4,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'homework': PropertySchema(
      id: 5,
      name: r'homework',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 6,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'lessonTopic': PropertySchema(
      id: 7,
      name: r'lessonTopic',
      type: IsarType.string,
    ),
    r'roomUuid': PropertySchema(
      id: 8,
      name: r'roomUuid',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 9,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'syncVersion': PropertySchema(
      id: 10,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'teacherNote': PropertySchema(
      id: 11,
      name: r'teacherNote',
      type: IsarType.string,
    ),
    r'teacherUuid': PropertySchema(
      id: 12,
      name: r'teacherUuid',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 14,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguLessonEstimateSize,
  serialize: _ngoaiNguLessonSerialize,
  deserialize: _ngoaiNguLessonDeserialize,
  deserializeProp: _ngoaiNguLessonDeserializeProp,
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
  getId: _ngoaiNguLessonGetId,
  getLinks: _ngoaiNguLessonGetLinks,
  attach: _ngoaiNguLessonAttach,
  version: '3.1.0+1',
);

int _ngoaiNguLessonEstimateSize(
  NgoaiNguLesson object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.branchId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.centerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.classUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.homework;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lessonTopic;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.roomUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.teacherNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.teacherUuid;
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

void _ngoaiNguLessonSerialize(
  NgoaiNguLesson object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.branchId);
  writer.writeString(offsets[1], object.centerId);
  writer.writeString(offsets[2], object.classUuid);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.endTime);
  writer.writeString(offsets[5], object.homework);
  writer.writeBool(offsets[6], object.isDeleted);
  writer.writeString(offsets[7], object.lessonTopic);
  writer.writeString(offsets[8], object.roomUuid);
  writer.writeDateTime(offsets[9], object.startTime);
  writer.writeLong(offsets[10], object.syncVersion);
  writer.writeString(offsets[11], object.teacherNote);
  writer.writeString(offsets[12], object.teacherUuid);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.uuid);
}

NgoaiNguLesson _ngoaiNguLessonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguLesson();
  object.branchId = reader.readStringOrNull(offsets[0]);
  object.centerId = reader.readStringOrNull(offsets[1]);
  object.classUuid = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.endTime = reader.readDateTimeOrNull(offsets[4]);
  object.homework = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[6]);
  object.lessonTopic = reader.readStringOrNull(offsets[7]);
  object.roomUuid = reader.readStringOrNull(offsets[8]);
  object.startTime = reader.readDateTimeOrNull(offsets[9]);
  object.syncVersion = reader.readLong(offsets[10]);
  object.teacherNote = reader.readStringOrNull(offsets[11]);
  object.teacherUuid = reader.readStringOrNull(offsets[12]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[13]);
  object.uuid = reader.readStringOrNull(offsets[14]);
  return object;
}

P _ngoaiNguLessonDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguLessonGetId(NgoaiNguLesson object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguLessonGetLinks(NgoaiNguLesson object) {
  return [];
}

void _ngoaiNguLessonAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguLesson object) {
  object.id = id;
}

extension NgoaiNguLessonByIndex on IsarCollection<NgoaiNguLesson> {
  Future<NgoaiNguLesson?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguLesson? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguLesson?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguLesson?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguLesson object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguLesson object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguLesson> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguLesson> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguLessonQueryWhereSort
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QWhere> {
  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguLessonQueryWhere
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QWhereClause> {
  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterWhereClause>
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

extension NgoaiNguLessonQueryFilter
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QFilterCondition> {
  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'branchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'centerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      classUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homework',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homework',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homework',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'homework',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'homework',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'homework',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'homework',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'homework',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'homework',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'homework',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homework',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      homeworkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'homework',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lessonTopic',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lessonTopic',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonTopic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonTopic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonTopic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonTopic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lessonTopic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lessonTopic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lessonTopic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lessonTopic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonTopic',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      lessonTopicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lessonTopic',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      roomUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      startTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startTime',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      startTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startTime',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      startTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      startTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      startTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      syncVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      syncVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      syncVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teacherNote',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teacherNote',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teacherNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teacherNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teacherNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teacherNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teacherNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teacherNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teacherNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherNote',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teacherNote',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teacherUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teacherUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teacherUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teacherUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      teacherUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teacherUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguLessonQueryObject
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QFilterCondition> {}

extension NgoaiNguLessonQueryLinks
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QFilterCondition> {}

extension NgoaiNguLessonQuerySortBy
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QSortBy> {
  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByHomework() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homework', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByHomeworkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homework', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByLessonTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonTopic', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByLessonTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonTopic', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByTeacherNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherNote', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByTeacherNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherNote', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByTeacherUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByTeacherUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguLessonQuerySortThenBy
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QSortThenBy> {
  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByHomework() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homework', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByHomeworkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homework', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByLessonTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonTopic', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByLessonTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonTopic', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByTeacherNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherNote', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByTeacherNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherNote', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByTeacherUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByTeacherUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguLessonQueryWhereDistinct
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> {
  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByBranchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByCenterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByClassUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByHomework(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'homework', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByLessonTopic(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonTopic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByRoomUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByTeacherNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teacherNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByTeacherUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teacherUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguLessonQueryProperty
    on QueryBuilder<NgoaiNguLesson, NgoaiNguLesson, QQueryProperty> {
  QueryBuilder<NgoaiNguLesson, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations> branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations> centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations> classUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classUuid');
    });
  }

  QueryBuilder<NgoaiNguLesson, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguLesson, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations> homeworkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'homework');
    });
  }

  QueryBuilder<NgoaiNguLesson, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations>
      lessonTopicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonTopic');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations> roomUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomUuid');
    });
  }

  QueryBuilder<NgoaiNguLesson, DateTime?, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<NgoaiNguLesson, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations>
      teacherNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teacherNote');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations>
      teacherUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teacherUuid');
    });
  }

  QueryBuilder<NgoaiNguLesson, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguLesson, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguAttendanceCollection on Isar {
  IsarCollection<NgoaiNguAttendance> get ngoaiNguAttendances =>
      this.collection();
}

const NgoaiNguAttendanceSchema = CollectionSchema(
  name: r'NgoaiNguAttendance',
  id: -5570487969302232021,
  properties: {
    r'branchId': PropertySchema(
      id: 0,
      name: r'branchId',
      type: IsarType.string,
    ),
    r'centerId': PropertySchema(
      id: 1,
      name: r'centerId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 3,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'lessonUuid': PropertySchema(
      id: 4,
      name: r'lessonUuid',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 5,
      name: r'note',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _NgoaiNguAttendancestatusEnumValueMap,
    ),
    r'studentUuid': PropertySchema(
      id: 7,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'syncVersion': PropertySchema(
      id: 8,
      name: r'syncVersion',
      type: IsarType.long,
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
  estimateSize: _ngoaiNguAttendanceEstimateSize,
  serialize: _ngoaiNguAttendanceSerialize,
  deserialize: _ngoaiNguAttendanceDeserialize,
  deserializeProp: _ngoaiNguAttendanceDeserializeProp,
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
  getId: _ngoaiNguAttendanceGetId,
  getLinks: _ngoaiNguAttendanceGetLinks,
  attach: _ngoaiNguAttendanceAttach,
  version: '3.1.0+1',
);

int _ngoaiNguAttendanceEstimateSize(
  NgoaiNguAttendance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.branchId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.centerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lessonUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.studentUuid;
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

void _ngoaiNguAttendanceSerialize(
  NgoaiNguAttendance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.branchId);
  writer.writeString(offsets[1], object.centerId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeBool(offsets[3], object.isDeleted);
  writer.writeString(offsets[4], object.lessonUuid);
  writer.writeString(offsets[5], object.note);
  writer.writeByte(offsets[6], object.status.index);
  writer.writeString(offsets[7], object.studentUuid);
  writer.writeLong(offsets[8], object.syncVersion);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeString(offsets[10], object.uuid);
}

NgoaiNguAttendance _ngoaiNguAttendanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguAttendance();
  object.branchId = reader.readStringOrNull(offsets[0]);
  object.centerId = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[3]);
  object.lessonUuid = reader.readStringOrNull(offsets[4]);
  object.note = reader.readStringOrNull(offsets[5]);
  object.status = _NgoaiNguAttendancestatusValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      AttendanceStatus.present;
  object.studentUuid = reader.readStringOrNull(offsets[7]);
  object.syncVersion = reader.readLong(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  object.uuid = reader.readStringOrNull(offsets[10]);
  return object;
}

P _ngoaiNguAttendanceDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (_NgoaiNguAttendancestatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AttendanceStatus.present) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguAttendancestatusEnumValueMap = {
  'present': 0,
  'absent': 1,
  'late': 2,
  'excused': 3,
  'makeup': 4,
};
const _NgoaiNguAttendancestatusValueEnumMap = {
  0: AttendanceStatus.present,
  1: AttendanceStatus.absent,
  2: AttendanceStatus.late,
  3: AttendanceStatus.excused,
  4: AttendanceStatus.makeup,
};

Id _ngoaiNguAttendanceGetId(NgoaiNguAttendance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguAttendanceGetLinks(
    NgoaiNguAttendance object) {
  return [];
}

void _ngoaiNguAttendanceAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguAttendance object) {
  object.id = id;
}

extension NgoaiNguAttendanceByIndex on IsarCollection<NgoaiNguAttendance> {
  Future<NgoaiNguAttendance?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguAttendance? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguAttendance?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguAttendance?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguAttendance object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguAttendance object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguAttendance> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguAttendance> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguAttendanceQueryWhereSort
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QWhere> {
  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguAttendanceQueryWhere
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QWhereClause> {
  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterWhereClause>
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

extension NgoaiNguAttendanceQueryFilter
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QFilterCondition> {
  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'branchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'centerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lessonUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lessonUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lessonUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      lessonUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lessonUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      statusEqualTo(AttendanceStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      statusGreaterThan(
    AttendanceStatus value, {
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      statusLessThan(
    AttendanceStatus value, {
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      statusBetween(
    AttendanceStatus lower,
    AttendanceStatus upper, {
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      syncVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      syncVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      syncVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguAttendanceQueryObject
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QFilterCondition> {}

extension NgoaiNguAttendanceQueryLinks
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QFilterCondition> {}

extension NgoaiNguAttendanceQuerySortBy
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QSortBy> {
  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByLessonUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByLessonUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguAttendanceQuerySortThenBy
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QSortThenBy> {
  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByLessonUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByLessonUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguAttendanceQueryWhereDistinct
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct> {
  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByBranchId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByCenterId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByLessonUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguAttendanceQueryProperty
    on QueryBuilder<NgoaiNguAttendance, NgoaiNguAttendance, QQueryProperty> {
  QueryBuilder<NgoaiNguAttendance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguAttendance, String?, QQueryOperations>
      branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguAttendance, String?, QQueryOperations>
      centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguAttendance, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguAttendance, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAttendance, String?, QQueryOperations>
      lessonUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonUuid');
    });
  }

  QueryBuilder<NgoaiNguAttendance, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<NgoaiNguAttendance, AttendanceStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NgoaiNguAttendance, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguAttendance, int, QQueryOperations>
      syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAttendance, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguAttendance, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
