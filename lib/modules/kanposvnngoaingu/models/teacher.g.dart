// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguTeacherCollection on Isar {
  IsarCollection<NgoaiNguTeacher> get ngoaiNguTeachers => this.collection();
}

const NgoaiNguTeacherSchema = CollectionSchema(
  name: r'NgoaiNguTeacher',
  id: -615126240915850851,
  properties: {
    r'avatar': PropertySchema(
      id: 0,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'branchId': PropertySchema(
      id: 1,
      name: r'branchId',
      type: IsarType.string,
    ),
    r'centerId': PropertySchema(
      id: 2,
      name: r'centerId',
      type: IsarType.string,
    ),
    r'certificates': PropertySchema(
      id: 3,
      name: r'certificates',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'degreeLevel': PropertySchema(
      id: 5,
      name: r'degreeLevel',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 6,
      name: r'email',
      type: IsarType.string,
    ),
    r'experienceYears': PropertySchema(
      id: 7,
      name: r'experienceYears',
      type: IsarType.long,
    ),
    r'fullName': PropertySchema(
      id: 8,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'hourlyRate': PropertySchema(
      id: 9,
      name: r'hourlyRate',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 10,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'phone': PropertySchema(
      id: 11,
      name: r'phone',
      type: IsarType.string,
    ),
    r'specialization': PropertySchema(
      id: 12,
      name: r'specialization',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 13,
      name: r'status',
      type: IsarType.byte,
      enumMap: _NgoaiNguTeacherstatusEnumValueMap,
    ),
    r'syncVersion': PropertySchema(
      id: 14,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'teacherCode': PropertySchema(
      id: 15,
      name: r'teacherCode',
      type: IsarType.string,
    ),
    r'teachingLanguage': PropertySchema(
      id: 16,
      name: r'teachingLanguage',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 18,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguTeacherEstimateSize,
  serialize: _ngoaiNguTeacherSerialize,
  deserialize: _ngoaiNguTeacherDeserialize,
  deserializeProp: _ngoaiNguTeacherDeserializeProp,
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
  getId: _ngoaiNguTeacherGetId,
  getLinks: _ngoaiNguTeacherGetLinks,
  attach: _ngoaiNguTeacherAttach,
  version: '3.1.0+1',
);

int _ngoaiNguTeacherEstimateSize(
  NgoaiNguTeacher object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.certificates;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.degreeLevel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.specialization;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.teacherCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.teachingLanguage;
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

void _ngoaiNguTeacherSerialize(
  NgoaiNguTeacher object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatar);
  writer.writeString(offsets[1], object.branchId);
  writer.writeString(offsets[2], object.centerId);
  writer.writeString(offsets[3], object.certificates);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.degreeLevel);
  writer.writeString(offsets[6], object.email);
  writer.writeLong(offsets[7], object.experienceYears);
  writer.writeString(offsets[8], object.fullName);
  writer.writeDouble(offsets[9], object.hourlyRate);
  writer.writeBool(offsets[10], object.isDeleted);
  writer.writeString(offsets[11], object.phone);
  writer.writeString(offsets[12], object.specialization);
  writer.writeByte(offsets[13], object.status.index);
  writer.writeLong(offsets[14], object.syncVersion);
  writer.writeString(offsets[15], object.teacherCode);
  writer.writeString(offsets[16], object.teachingLanguage);
  writer.writeDateTime(offsets[17], object.updatedAt);
  writer.writeString(offsets[18], object.uuid);
}

NgoaiNguTeacher _ngoaiNguTeacherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguTeacher();
  object.avatar = reader.readStringOrNull(offsets[0]);
  object.branchId = reader.readStringOrNull(offsets[1]);
  object.centerId = reader.readStringOrNull(offsets[2]);
  object.certificates = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTimeOrNull(offsets[4]);
  object.degreeLevel = reader.readStringOrNull(offsets[5]);
  object.email = reader.readStringOrNull(offsets[6]);
  object.experienceYears = reader.readLongOrNull(offsets[7]);
  object.fullName = reader.readStringOrNull(offsets[8]);
  object.hourlyRate = reader.readDoubleOrNull(offsets[9]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[10]);
  object.phone = reader.readStringOrNull(offsets[11]);
  object.specialization = reader.readStringOrNull(offsets[12]);
  object.status =
      _NgoaiNguTeacherstatusValueEnumMap[reader.readByteOrNull(offsets[13])] ??
          TeacherStatus.active;
  object.syncVersion = reader.readLong(offsets[14]);
  object.teacherCode = reader.readStringOrNull(offsets[15]);
  object.teachingLanguage = reader.readStringOrNull(offsets[16]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[17]);
  object.uuid = reader.readStringOrNull(offsets[18]);
  return object;
}

P _ngoaiNguTeacherDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (_NgoaiNguTeacherstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TeacherStatus.active) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguTeacherstatusEnumValueMap = {
  'active': 0,
  'inactive': 1,
  'onLeave': 2,
};
const _NgoaiNguTeacherstatusValueEnumMap = {
  0: TeacherStatus.active,
  1: TeacherStatus.inactive,
  2: TeacherStatus.onLeave,
};

Id _ngoaiNguTeacherGetId(NgoaiNguTeacher object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguTeacherGetLinks(NgoaiNguTeacher object) {
  return [];
}

void _ngoaiNguTeacherAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguTeacher object) {
  object.id = id;
}

extension NgoaiNguTeacherByIndex on IsarCollection<NgoaiNguTeacher> {
  Future<NgoaiNguTeacher?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguTeacher? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguTeacher?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguTeacher?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguTeacher object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguTeacher object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguTeacher> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguTeacher> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguTeacherQueryWhereSort
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QWhere> {
  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguTeacherQueryWhere
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QWhereClause> {
  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterWhereClause>
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

extension NgoaiNguTeacherQueryFilter
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QFilterCondition> {
  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'certificates',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'certificates',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certificates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'certificates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'certificates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'certificates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'certificates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'certificates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'certificates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'certificates',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certificates',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      certificatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'certificates',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'degreeLevel',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'degreeLevel',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'degreeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'degreeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'degreeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'degreeLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'degreeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'degreeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'degreeLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'degreeLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'degreeLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      degreeLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'degreeLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      experienceYearsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'experienceYears',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      experienceYearsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'experienceYears',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      experienceYearsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'experienceYears',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      experienceYearsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'experienceYears',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      experienceYearsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'experienceYears',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      experienceYearsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'experienceYears',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      hourlyRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hourlyRate',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      hourlyRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hourlyRate',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      hourlyRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hourlyRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      hourlyRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hourlyRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      hourlyRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hourlyRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      hourlyRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hourlyRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'specialization',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'specialization',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'specialization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'specialization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'specialization',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'specialization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'specialization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'specialization',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'specialization',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialization',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      specializationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'specialization',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      statusEqualTo(TeacherStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      statusGreaterThan(
    TeacherStatus value, {
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      statusLessThan(
    TeacherStatus value, {
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      statusBetween(
    TeacherStatus lower,
    TeacherStatus upper, {
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teacherCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teacherCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teacherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teacherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teacherCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teacherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teacherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teacherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teacherCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teacherCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teacherCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teachingLanguage',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teachingLanguage',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teachingLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teachingLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teachingLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teachingLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teachingLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teachingLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teachingLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teachingLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teachingLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      teachingLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teachingLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguTeacherQueryObject
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QFilterCondition> {}

extension NgoaiNguTeacherQueryLinks
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QFilterCondition> {}

extension NgoaiNguTeacherQuerySortBy
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QSortBy> {
  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByCertificates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificates', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByCertificatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificates', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByDegreeLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degreeLevel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByDegreeLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degreeLevel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByExperienceYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByHourlyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyRate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByHourlyRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyRate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortBySpecialization() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialization', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortBySpecializationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialization', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByTeacherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByTeacherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByTeachingLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingLanguage', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByTeachingLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingLanguage', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguTeacherQuerySortThenBy
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QSortThenBy> {
  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByCertificates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificates', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByCertificatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificates', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByDegreeLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degreeLevel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByDegreeLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'degreeLevel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByExperienceYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByHourlyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyRate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByHourlyRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyRate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenBySpecialization() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialization', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenBySpecializationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialization', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByTeacherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByTeacherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByTeachingLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingLanguage', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByTeachingLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teachingLanguage', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguTeacherQueryWhereDistinct
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> {
  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByBranchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByCenterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByCertificates({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'certificates', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByDegreeLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'degreeLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'experienceYears');
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByHourlyRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hourlyRate');
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctBySpecialization({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'specialization',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByTeacherCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teacherCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByTeachingLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teachingLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguTeacherQueryProperty
    on QueryBuilder<NgoaiNguTeacher, NgoaiNguTeacher, QQueryProperty> {
  QueryBuilder<NgoaiNguTeacher, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations> branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations> centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations>
      certificatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'certificates');
    });
  }

  QueryBuilder<NgoaiNguTeacher, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations>
      degreeLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'degreeLevel');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<NgoaiNguTeacher, int?, QQueryOperations>
      experienceYearsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'experienceYears');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<NgoaiNguTeacher, double?, QQueryOperations>
      hourlyRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hourlyRate');
    });
  }

  QueryBuilder<NgoaiNguTeacher, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations>
      specializationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'specialization');
    });
  }

  QueryBuilder<NgoaiNguTeacher, TeacherStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NgoaiNguTeacher, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations>
      teacherCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teacherCode');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations>
      teachingLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teachingLanguage');
    });
  }

  QueryBuilder<NgoaiNguTeacher, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguTeacher, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
