// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_class.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguCourseCollection on Isar {
  IsarCollection<NgoaiNguCourse> get ngoaiNguCourses => this.collection();
}

const NgoaiNguCourseSchema = CollectionSchema(
  name: r'NgoaiNguCourse',
  id: 2442066840075848207,
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
    r'courseCode': PropertySchema(
      id: 2,
      name: r'courseCode',
      type: IsarType.string,
    ),
    r'courseName': PropertySchema(
      id: 3,
      name: r'courseName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'defaultTuition': PropertySchema(
      id: 5,
      name: r'defaultTuition',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 6,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'language': PropertySchema(
      id: 7,
      name: r'language',
      type: IsarType.string,
    ),
    r'level': PropertySchema(
      id: 8,
      name: r'level',
      type: IsarType.string,
    ),
    r'syncVersion': PropertySchema(
      id: 9,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 11,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguCourseEstimateSize,
  serialize: _ngoaiNguCourseSerialize,
  deserialize: _ngoaiNguCourseDeserialize,
  deserializeProp: _ngoaiNguCourseDeserializeProp,
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
  getId: _ngoaiNguCourseGetId,
  getLinks: _ngoaiNguCourseGetLinks,
  attach: _ngoaiNguCourseAttach,
  version: '3.1.0+1',
);

int _ngoaiNguCourseEstimateSize(
  NgoaiNguCourse object,
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
    final value = object.courseCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.courseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.level;
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

void _ngoaiNguCourseSerialize(
  NgoaiNguCourse object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.branchId);
  writer.writeString(offsets[1], object.centerId);
  writer.writeString(offsets[2], object.courseCode);
  writer.writeString(offsets[3], object.courseName);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDouble(offsets[5], object.defaultTuition);
  writer.writeBool(offsets[6], object.isDeleted);
  writer.writeString(offsets[7], object.language);
  writer.writeString(offsets[8], object.level);
  writer.writeLong(offsets[9], object.syncVersion);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeString(offsets[11], object.uuid);
}

NgoaiNguCourse _ngoaiNguCourseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguCourse();
  object.branchId = reader.readStringOrNull(offsets[0]);
  object.centerId = reader.readStringOrNull(offsets[1]);
  object.courseCode = reader.readStringOrNull(offsets[2]);
  object.courseName = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTimeOrNull(offsets[4]);
  object.defaultTuition = reader.readDoubleOrNull(offsets[5]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[6]);
  object.language = reader.readStringOrNull(offsets[7]);
  object.level = reader.readStringOrNull(offsets[8]);
  object.syncVersion = reader.readLong(offsets[9]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[10]);
  object.uuid = reader.readStringOrNull(offsets[11]);
  return object;
}

P _ngoaiNguCourseDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguCourseGetId(NgoaiNguCourse object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguCourseGetLinks(NgoaiNguCourse object) {
  return [];
}

void _ngoaiNguCourseAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguCourse object) {
  object.id = id;
}

extension NgoaiNguCourseByIndex on IsarCollection<NgoaiNguCourse> {
  Future<NgoaiNguCourse?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguCourse? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguCourse?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguCourse?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguCourse object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguCourse object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguCourse> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguCourse> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguCourseQueryWhereSort
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QWhere> {
  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguCourseQueryWhere
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QWhereClause> {
  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterWhereClause>
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

extension NgoaiNguCourseQueryFilter
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QFilterCondition> {
  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courseCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courseCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courseCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'courseCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'courseCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'courseCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'courseCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'courseCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseName',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseName',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'courseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      courseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'courseName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      defaultTuitionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defaultTuition',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      defaultTuitionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defaultTuition',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      defaultTuitionEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultTuition',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      defaultTuitionGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultTuition',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      defaultTuitionLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultTuition',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      defaultTuitionBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultTuition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'level',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'level',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'level',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguCourseQueryObject
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QFilterCondition> {}

extension NgoaiNguCourseQueryLinks
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QFilterCondition> {}

extension NgoaiNguCourseQuerySortBy
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QSortBy> {
  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByCourseCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByCourseCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByCourseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByCourseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByDefaultTuition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultTuition', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByDefaultTuitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultTuition', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguCourseQuerySortThenBy
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QSortThenBy> {
  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByCourseCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByCourseCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByCourseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByCourseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByDefaultTuition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultTuition', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByDefaultTuitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultTuition', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguCourseQueryWhereDistinct
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> {
  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> distinctByBranchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> distinctByCenterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> distinctByCourseCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> distinctByCourseName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct>
      distinctByDefaultTuition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultTuition');
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> distinctByLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> distinctByLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguCourseQueryProperty
    on QueryBuilder<NgoaiNguCourse, NgoaiNguCourse, QQueryProperty> {
  QueryBuilder<NgoaiNguCourse, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguCourse, String?, QQueryOperations> branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguCourse, String?, QQueryOperations> centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguCourse, String?, QQueryOperations> courseCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseCode');
    });
  }

  QueryBuilder<NgoaiNguCourse, String?, QQueryOperations> courseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseName');
    });
  }

  QueryBuilder<NgoaiNguCourse, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguCourse, double?, QQueryOperations>
      defaultTuitionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultTuition');
    });
  }

  QueryBuilder<NgoaiNguCourse, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguCourse, String?, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<NgoaiNguCourse, String?, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<NgoaiNguCourse, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguCourse, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguCourse, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguClassCollection on Isar {
  IsarCollection<NgoaiNguClass> get ngoaiNguClass => this.collection();
}

const NgoaiNguClassSchema = CollectionSchema(
  name: r'NgoaiNguClass',
  id: -6270496971913804270,
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
    r'classCode': PropertySchema(
      id: 2,
      name: r'classCode',
      type: IsarType.string,
    ),
    r'className': PropertySchema(
      id: 3,
      name: r'className',
      type: IsarType.string,
    ),
    r'courseUuid': PropertySchema(
      id: 4,
      name: r'courseUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endDate': PropertySchema(
      id: 6,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 7,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'maxStudents': PropertySchema(
      id: 8,
      name: r'maxStudents',
      type: IsarType.long,
    ),
    r'roomUuid': PropertySchema(
      id: 9,
      name: r'roomUuid',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 10,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.byte,
      enumMap: _NgoaiNguClassstatusEnumValueMap,
    ),
    r'syncVersion': PropertySchema(
      id: 12,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'teacherUuid': PropertySchema(
      id: 13,
      name: r'teacherUuid',
      type: IsarType.string,
    ),
    r'tuition': PropertySchema(
      id: 14,
      name: r'tuition',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 16,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguClassEstimateSize,
  serialize: _ngoaiNguClassSerialize,
  deserialize: _ngoaiNguClassDeserialize,
  deserializeProp: _ngoaiNguClassDeserializeProp,
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
  getId: _ngoaiNguClassGetId,
  getLinks: _ngoaiNguClassGetLinks,
  attach: _ngoaiNguClassAttach,
  version: '3.1.0+1',
);

int _ngoaiNguClassEstimateSize(
  NgoaiNguClass object,
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
    final value = object.classCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.className;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.courseUuid;
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

void _ngoaiNguClassSerialize(
  NgoaiNguClass object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.branchId);
  writer.writeString(offsets[1], object.centerId);
  writer.writeString(offsets[2], object.classCode);
  writer.writeString(offsets[3], object.className);
  writer.writeString(offsets[4], object.courseUuid);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeDateTime(offsets[6], object.endDate);
  writer.writeBool(offsets[7], object.isDeleted);
  writer.writeLong(offsets[8], object.maxStudents);
  writer.writeString(offsets[9], object.roomUuid);
  writer.writeDateTime(offsets[10], object.startDate);
  writer.writeByte(offsets[11], object.status.index);
  writer.writeLong(offsets[12], object.syncVersion);
  writer.writeString(offsets[13], object.teacherUuid);
  writer.writeDouble(offsets[14], object.tuition);
  writer.writeDateTime(offsets[15], object.updatedAt);
  writer.writeString(offsets[16], object.uuid);
}

NgoaiNguClass _ngoaiNguClassDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguClass();
  object.branchId = reader.readStringOrNull(offsets[0]);
  object.centerId = reader.readStringOrNull(offsets[1]);
  object.classCode = reader.readStringOrNull(offsets[2]);
  object.className = reader.readStringOrNull(offsets[3]);
  object.courseUuid = reader.readStringOrNull(offsets[4]);
  object.createdAt = reader.readDateTimeOrNull(offsets[5]);
  object.endDate = reader.readDateTimeOrNull(offsets[6]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[7]);
  object.maxStudents = reader.readLongOrNull(offsets[8]);
  object.roomUuid = reader.readStringOrNull(offsets[9]);
  object.startDate = reader.readDateTimeOrNull(offsets[10]);
  object.status =
      _NgoaiNguClassstatusValueEnumMap[reader.readByteOrNull(offsets[11])] ??
          ClassStatus.planning;
  object.syncVersion = reader.readLong(offsets[12]);
  object.teacherUuid = reader.readStringOrNull(offsets[13]);
  object.tuition = reader.readDoubleOrNull(offsets[14]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[15]);
  object.uuid = reader.readStringOrNull(offsets[16]);
  return object;
}

P _ngoaiNguClassDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (_NgoaiNguClassstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          ClassStatus.planning) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguClassstatusEnumValueMap = {
  'planning': 0,
  'active': 1,
  'completed': 2,
  'cancelled': 3,
};
const _NgoaiNguClassstatusValueEnumMap = {
  0: ClassStatus.planning,
  1: ClassStatus.active,
  2: ClassStatus.completed,
  3: ClassStatus.cancelled,
};

Id _ngoaiNguClassGetId(NgoaiNguClass object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguClassGetLinks(NgoaiNguClass object) {
  return [];
}

void _ngoaiNguClassAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguClass object) {
  object.id = id;
}

extension NgoaiNguClassByIndex on IsarCollection<NgoaiNguClass> {
  Future<NgoaiNguClass?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguClass? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguClass?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguClass?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguClass object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguClass object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguClass> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguClass> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguClassQueryWhereSort
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QWhere> {
  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguClassQueryWhere
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QWhereClause> {
  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterWhereClause> uuidNotEqualTo(
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
}

extension NgoaiNguClassQueryFilter
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QFilterCondition> {
  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'classCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'classCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'classCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'classCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'className',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'className',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'className',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'className',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'className',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      classNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'className',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courseUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'courseUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      courseUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'courseUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      endDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      maxStudentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxStudents',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      maxStudentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxStudents',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      maxStudentsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      maxStudentsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      maxStudentsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxStudents',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      maxStudentsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxStudents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      roomUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      roomUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      roomUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      roomUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      roomUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      roomUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      statusEqualTo(ClassStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      statusGreaterThan(
    ClassStatus value, {
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      statusLessThan(
    ClassStatus value, {
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      statusBetween(
    ClassStatus lower,
    ClassStatus upper, {
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      teacherUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teacherUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      teacherUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teacherUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      teacherUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      teacherUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teacherUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      teacherUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      teacherUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teacherUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      tuitionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tuition',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      tuitionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tuition',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      tuitionEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tuition',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      tuitionGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tuition',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      tuitionLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tuition',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      tuitionBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tuition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguClassQueryObject
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QFilterCondition> {}

extension NgoaiNguClassQueryLinks
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QFilterCondition> {}

extension NgoaiNguClassQuerySortBy
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QSortBy> {
  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByClassCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByClassCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByCourseUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByCourseUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByMaxStudents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStudents', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByMaxStudentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStudents', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByTeacherUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByTeacherUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByTuition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tuition', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByTuitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tuition', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguClassQuerySortThenBy
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QSortThenBy> {
  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByClassCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByClassCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByCourseUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByCourseUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByMaxStudents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStudents', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByMaxStudentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStudents', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByTeacherUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByTeacherUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByTuition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tuition', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByTuitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tuition', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguClassQueryWhereDistinct
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> {
  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByBranchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByCenterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByClassCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByClassName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'className', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByCourseUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct>
      distinctByMaxStudents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxStudents');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByRoomUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByTeacherUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teacherUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByTuition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tuition');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguClass, NgoaiNguClass, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguClassQueryProperty
    on QueryBuilder<NgoaiNguClass, NgoaiNguClass, QQueryProperty> {
  QueryBuilder<NgoaiNguClass, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> classCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classCode');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> classNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'className');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> courseUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseUuid');
    });
  }

  QueryBuilder<NgoaiNguClass, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguClass, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<NgoaiNguClass, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguClass, int?, QQueryOperations> maxStudentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxStudents');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> roomUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomUuid');
    });
  }

  QueryBuilder<NgoaiNguClass, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<NgoaiNguClass, ClassStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NgoaiNguClass, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> teacherUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teacherUuid');
    });
  }

  QueryBuilder<NgoaiNguClass, double?, QQueryOperations> tuitionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tuition');
    });
  }

  QueryBuilder<NgoaiNguClass, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguClass, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguRoomCollection on Isar {
  IsarCollection<NgoaiNguRoom> get ngoaiNguRooms => this.collection();
}

const NgoaiNguRoomSchema = CollectionSchema(
  name: r'NgoaiNguRoom',
  id: 3524700527472315104,
  properties: {
    r'branchId': PropertySchema(
      id: 0,
      name: r'branchId',
      type: IsarType.string,
    ),
    r'capacity': PropertySchema(
      id: 1,
      name: r'capacity',
      type: IsarType.long,
    ),
    r'centerId': PropertySchema(
      id: 2,
      name: r'centerId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 4,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'meetingUrl': PropertySchema(
      id: 5,
      name: r'meetingUrl',
      type: IsarType.string,
    ),
    r'roomCode': PropertySchema(
      id: 6,
      name: r'roomCode',
      type: IsarType.string,
    ),
    r'roomName': PropertySchema(
      id: 7,
      name: r'roomName',
      type: IsarType.string,
    ),
    r'syncVersion': PropertySchema(
      id: 8,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 9,
      name: r'type',
      type: IsarType.byte,
      enumMap: _NgoaiNguRoomtypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 11,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguRoomEstimateSize,
  serialize: _ngoaiNguRoomSerialize,
  deserialize: _ngoaiNguRoomDeserialize,
  deserializeProp: _ngoaiNguRoomDeserializeProp,
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
  getId: _ngoaiNguRoomGetId,
  getLinks: _ngoaiNguRoomGetLinks,
  attach: _ngoaiNguRoomAttach,
  version: '3.1.0+1',
);

int _ngoaiNguRoomEstimateSize(
  NgoaiNguRoom object,
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
    final value = object.meetingUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.roomCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.roomName;
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

void _ngoaiNguRoomSerialize(
  NgoaiNguRoom object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.branchId);
  writer.writeLong(offsets[1], object.capacity);
  writer.writeString(offsets[2], object.centerId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeBool(offsets[4], object.isDeleted);
  writer.writeString(offsets[5], object.meetingUrl);
  writer.writeString(offsets[6], object.roomCode);
  writer.writeString(offsets[7], object.roomName);
  writer.writeLong(offsets[8], object.syncVersion);
  writer.writeByte(offsets[9], object.type.index);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeString(offsets[11], object.uuid);
}

NgoaiNguRoom _ngoaiNguRoomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguRoom();
  object.branchId = reader.readStringOrNull(offsets[0]);
  object.capacity = reader.readLongOrNull(offsets[1]);
  object.centerId = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[4]);
  object.meetingUrl = reader.readStringOrNull(offsets[5]);
  object.roomCode = reader.readStringOrNull(offsets[6]);
  object.roomName = reader.readStringOrNull(offsets[7]);
  object.syncVersion = reader.readLong(offsets[8]);
  object.type =
      _NgoaiNguRoomtypeValueEnumMap[reader.readByteOrNull(offsets[9])] ??
          RoomType.physical;
  object.updatedAt = reader.readDateTimeOrNull(offsets[10]);
  object.uuid = reader.readStringOrNull(offsets[11]);
  return object;
}

P _ngoaiNguRoomDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (_NgoaiNguRoomtypeValueEnumMap[reader.readByteOrNull(offset)] ??
          RoomType.physical) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguRoomtypeEnumValueMap = {
  'physical': 0,
  'online': 1,
  'oneToOne': 2,
  'aiRoom': 3,
};
const _NgoaiNguRoomtypeValueEnumMap = {
  0: RoomType.physical,
  1: RoomType.online,
  2: RoomType.oneToOne,
  3: RoomType.aiRoom,
};

Id _ngoaiNguRoomGetId(NgoaiNguRoom object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguRoomGetLinks(NgoaiNguRoom object) {
  return [];
}

void _ngoaiNguRoomAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguRoom object) {
  object.id = id;
}

extension NgoaiNguRoomByIndex on IsarCollection<NgoaiNguRoom> {
  Future<NgoaiNguRoom?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguRoom? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguRoom?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguRoom?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguRoom object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguRoom object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguRoom> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguRoom> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguRoomQueryWhereSort
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QWhere> {
  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguRoomQueryWhere
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QWhereClause> {
  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterWhereClause> uuidNotEqualTo(
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
}

extension NgoaiNguRoomQueryFilter
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QFilterCondition> {
  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      capacityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capacity',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      capacityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capacity',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      capacityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      capacityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      capacityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      capacityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'meetingUrl',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'meetingUrl',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetingUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meetingUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meetingUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meetingUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'meetingUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'meetingUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'meetingUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'meetingUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meetingUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      meetingUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'meetingUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomName',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomName',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      roomNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> typeEqualTo(
      RoomType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      typeGreaterThan(
    RoomType value, {
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> typeLessThan(
    RoomType value, {
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> typeBetween(
    RoomType lower,
    RoomType upper, {
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguRoomQueryObject
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QFilterCondition> {}

extension NgoaiNguRoomQueryLinks
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QFilterCondition> {}

extension NgoaiNguRoomQuerySortBy
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QSortBy> {
  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByMeetingUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingUrl', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy>
      sortByMeetingUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingUrl', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByRoomCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByRoomCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByRoomName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByRoomNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguRoomQuerySortThenBy
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QSortThenBy> {
  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByMeetingUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingUrl', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy>
      thenByMeetingUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meetingUrl', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByRoomCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByRoomCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByRoomName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByRoomNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguRoomQueryWhereDistinct
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> {
  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByBranchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacity');
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByCenterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByMeetingUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meetingUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByRoomCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByRoomName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguRoomQueryProperty
    on QueryBuilder<NgoaiNguRoom, NgoaiNguRoom, QQueryProperty> {
  QueryBuilder<NgoaiNguRoom, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguRoom, String?, QQueryOperations> branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguRoom, int?, QQueryOperations> capacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacity');
    });
  }

  QueryBuilder<NgoaiNguRoom, String?, QQueryOperations> centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguRoom, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguRoom, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguRoom, String?, QQueryOperations> meetingUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meetingUrl');
    });
  }

  QueryBuilder<NgoaiNguRoom, String?, QQueryOperations> roomCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomCode');
    });
  }

  QueryBuilder<NgoaiNguRoom, String?, QQueryOperations> roomNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomName');
    });
  }

  QueryBuilder<NgoaiNguRoom, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguRoom, RoomType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<NgoaiNguRoom, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguRoom, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
