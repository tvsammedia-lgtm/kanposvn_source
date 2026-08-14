// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguStudentCollection on Isar {
  IsarCollection<NgoaiNguStudent> get ngoaiNguStudents => this.collection();
}

const NgoaiNguStudentSchema = CollectionSchema(
  name: r'NgoaiNguStudent',
  id: -8247017945146867697,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'avatar': PropertySchema(
      id: 1,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'branchId': PropertySchema(
      id: 2,
      name: r'branchId',
      type: IsarType.string,
    ),
    r'centerId': PropertySchema(
      id: 3,
      name: r'centerId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentLevel': PropertySchema(
      id: 5,
      name: r'currentLevel',
      type: IsarType.string,
    ),
    r'currentScore': PropertySchema(
      id: 6,
      name: r'currentScore',
      type: IsarType.double,
    ),
    r'dateOfBirth': PropertySchema(
      id: 7,
      name: r'dateOfBirth',
      type: IsarType.dateTime,
    ),
    r'email': PropertySchema(
      id: 8,
      name: r'email',
      type: IsarType.string,
    ),
    r'enrollmentDate': PropertySchema(
      id: 9,
      name: r'enrollmentDate',
      type: IsarType.dateTime,
    ),
    r'entryScore': PropertySchema(
      id: 10,
      name: r'entryScore',
      type: IsarType.double,
    ),
    r'fullName': PropertySchema(
      id: 11,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 12,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'learningLanguage': PropertySchema(
      id: 13,
      name: r'learningLanguage',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 14,
      name: r'phone',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 15,
      name: r'status',
      type: IsarType.byte,
      enumMap: _NgoaiNguStudentstatusEnumValueMap,
    ),
    r'studentCode': PropertySchema(
      id: 16,
      name: r'studentCode',
      type: IsarType.string,
    ),
    r'syncVersion': PropertySchema(
      id: 17,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'targetGoal': PropertySchema(
      id: 18,
      name: r'targetGoal',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 20,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguStudentEstimateSize,
  serialize: _ngoaiNguStudentSerialize,
  deserialize: _ngoaiNguStudentDeserialize,
  deserializeProp: _ngoaiNguStudentDeserializeProp,
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
  getId: _ngoaiNguStudentGetId,
  getLinks: _ngoaiNguStudentGetLinks,
  attach: _ngoaiNguStudentAttach,
  version: '3.1.0+1',
);

int _ngoaiNguStudentEstimateSize(
  NgoaiNguStudent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.currentLevel;
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
    final value = object.learningLanguage;
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
    final value = object.studentCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.targetGoal;
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

void _ngoaiNguStudentSerialize(
  NgoaiNguStudent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.avatar);
  writer.writeString(offsets[2], object.branchId);
  writer.writeString(offsets[3], object.centerId);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.currentLevel);
  writer.writeDouble(offsets[6], object.currentScore);
  writer.writeDateTime(offsets[7], object.dateOfBirth);
  writer.writeString(offsets[8], object.email);
  writer.writeDateTime(offsets[9], object.enrollmentDate);
  writer.writeDouble(offsets[10], object.entryScore);
  writer.writeString(offsets[11], object.fullName);
  writer.writeBool(offsets[12], object.isDeleted);
  writer.writeString(offsets[13], object.learningLanguage);
  writer.writeString(offsets[14], object.phone);
  writer.writeByte(offsets[15], object.status.index);
  writer.writeString(offsets[16], object.studentCode);
  writer.writeLong(offsets[17], object.syncVersion);
  writer.writeString(offsets[18], object.targetGoal);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeString(offsets[20], object.uuid);
}

NgoaiNguStudent _ngoaiNguStudentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguStudent();
  object.address = reader.readStringOrNull(offsets[0]);
  object.avatar = reader.readStringOrNull(offsets[1]);
  object.branchId = reader.readStringOrNull(offsets[2]);
  object.centerId = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTimeOrNull(offsets[4]);
  object.currentLevel = reader.readStringOrNull(offsets[5]);
  object.currentScore = reader.readDoubleOrNull(offsets[6]);
  object.dateOfBirth = reader.readDateTimeOrNull(offsets[7]);
  object.email = reader.readStringOrNull(offsets[8]);
  object.enrollmentDate = reader.readDateTimeOrNull(offsets[9]);
  object.entryScore = reader.readDoubleOrNull(offsets[10]);
  object.fullName = reader.readStringOrNull(offsets[11]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[12]);
  object.learningLanguage = reader.readStringOrNull(offsets[13]);
  object.phone = reader.readStringOrNull(offsets[14]);
  object.status =
      _NgoaiNguStudentstatusValueEnumMap[reader.readByteOrNull(offsets[15])] ??
          StudentStatus.active;
  object.studentCode = reader.readStringOrNull(offsets[16]);
  object.syncVersion = reader.readLong(offsets[17]);
  object.targetGoal = reader.readStringOrNull(offsets[18]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[19]);
  object.uuid = reader.readStringOrNull(offsets[20]);
  return object;
}

P _ngoaiNguStudentDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (_NgoaiNguStudentstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          StudentStatus.active) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguStudentstatusEnumValueMap = {
  'active': 0,
  'inactive': 1,
  'graduated': 2,
  'droppedOut': 3,
};
const _NgoaiNguStudentstatusValueEnumMap = {
  0: StudentStatus.active,
  1: StudentStatus.inactive,
  2: StudentStatus.graduated,
  3: StudentStatus.droppedOut,
};

Id _ngoaiNguStudentGetId(NgoaiNguStudent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguStudentGetLinks(NgoaiNguStudent object) {
  return [];
}

void _ngoaiNguStudentAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguStudent object) {
  object.id = id;
}

extension NgoaiNguStudentByIndex on IsarCollection<NgoaiNguStudent> {
  Future<NgoaiNguStudent?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguStudent? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguStudent?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguStudent?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguStudent object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguStudent object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguStudent> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguStudent> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguStudentQueryWhereSort
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QWhere> {
  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguStudentQueryWhere
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QWhereClause> {
  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterWhereClause>
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

extension NgoaiNguStudentQueryFilter
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QFilterCondition> {
  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      avatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      avatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      avatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      avatarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLevel',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLevel',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      currentScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      dateOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      dateOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      dateOfBirthEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      dateOfBirthGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      dateOfBirthLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      dateOfBirthBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateOfBirth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      enrollmentDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enrollmentDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      enrollmentDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enrollmentDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      enrollmentDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrollmentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      enrollmentDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enrollmentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      enrollmentDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enrollmentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      enrollmentDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enrollmentDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      entryScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entryScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      entryScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entryScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      entryScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      entryScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      entryScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      entryScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'learningLanguage',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'learningLanguage',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'learningLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'learningLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'learningLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'learningLanguage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'learningLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'learningLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'learningLanguage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'learningLanguage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'learningLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      learningLanguageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'learningLanguage',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      statusEqualTo(StudentStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      statusGreaterThan(
    StudentStatus value, {
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      statusLessThan(
    StudentStatus value, {
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      statusBetween(
    StudentStatus lower,
    StudentStatus upper, {
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentCode',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'studentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'studentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      studentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetGoal',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetGoal',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetGoal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetGoal',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      targetGoalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetGoal',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguStudentQueryObject
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QFilterCondition> {}

extension NgoaiNguStudentQueryLinks
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QFilterCondition> {}

extension NgoaiNguStudentQuerySortBy
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QSortBy> {
  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByEnrollmentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrollmentDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByEnrollmentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrollmentDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByEntryScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByEntryScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByLearningLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningLanguage', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByLearningLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningLanguage', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByStudentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByStudentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByTargetGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetGoal', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByTargetGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetGoal', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguStudentQuerySortThenBy
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QSortThenBy> {
  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByEnrollmentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrollmentDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByEnrollmentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrollmentDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByEntryScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByEntryScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByLearningLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningLanguage', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByLearningLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningLanguage', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByStudentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByStudentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByTargetGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetGoal', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByTargetGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetGoal', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguStudentQueryWhereDistinct
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> {
  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByBranchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByCenterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByCurrentLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentScore');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfBirth');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByEnrollmentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enrollmentDate');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByEntryScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryScore');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByLearningLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'learningLanguage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByStudentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByTargetGoal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetGoal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguStudentQueryProperty
    on QueryBuilder<NgoaiNguStudent, NgoaiNguStudent, QQueryProperty> {
  QueryBuilder<NgoaiNguStudent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguStudent, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations>
      currentLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLevel');
    });
  }

  QueryBuilder<NgoaiNguStudent, double?, QQueryOperations>
      currentScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentScore');
    });
  }

  QueryBuilder<NgoaiNguStudent, DateTime?, QQueryOperations>
      dateOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfBirth');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<NgoaiNguStudent, DateTime?, QQueryOperations>
      enrollmentDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enrollmentDate');
    });
  }

  QueryBuilder<NgoaiNguStudent, double?, QQueryOperations>
      entryScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryScore');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<NgoaiNguStudent, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations>
      learningLanguageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'learningLanguage');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<NgoaiNguStudent, StudentStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations>
      studentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentCode');
    });
  }

  QueryBuilder<NgoaiNguStudent, int, QQueryOperations> syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations>
      targetGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetGoal');
    });
  }

  QueryBuilder<NgoaiNguStudent, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguStudent, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
