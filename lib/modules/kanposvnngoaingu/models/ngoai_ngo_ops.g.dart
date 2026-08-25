// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ngoai_ngo_ops.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguClassStudentCollection on Isar {
  IsarCollection<NgoaiNguClassStudent> get ngoaiNguClassStudents =>
      this.collection();
}

const NgoaiNguClassStudentSchema = CollectionSchema(
  name: r'NgoaiNguClassStudent',
  id: -7564555724177776898,
  properties: {
    r'classUuid': PropertySchema(
      id: 0,
      name: r'classUuid',
      type: IsarType.string,
    ),
    r'enrolledAt': PropertySchema(
      id: 1,
      name: r'enrolledAt',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 2,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'studentUuid': PropertySchema(
      id: 3,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 4,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguClassStudentEstimateSize,
  serialize: _ngoaiNguClassStudentSerialize,
  deserialize: _ngoaiNguClassStudentDeserialize,
  deserializeProp: _ngoaiNguClassStudentDeserializeProp,
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
    r'classUuid': IndexSchema(
      id: 7332907024957507734,
      name: r'classUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'classUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'studentUuid': IndexSchema(
      id: -1911763875425566110,
      name: r'studentUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studentUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguClassStudentGetId,
  getLinks: _ngoaiNguClassStudentGetLinks,
  attach: _ngoaiNguClassStudentAttach,
  version: '3.1.0+1',
);

int _ngoaiNguClassStudentEstimateSize(
  NgoaiNguClassStudent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.classUuid;
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

void _ngoaiNguClassStudentSerialize(
  NgoaiNguClassStudent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.classUuid);
  writer.writeDateTime(offsets[1], object.enrolledAt);
  writer.writeBool(offsets[2], object.isDeleted);
  writer.writeString(offsets[3], object.studentUuid);
  writer.writeString(offsets[4], object.uuid);
}

NgoaiNguClassStudent _ngoaiNguClassStudentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguClassStudent();
  object.classUuid = reader.readStringOrNull(offsets[0]);
  object.enrolledAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[2]);
  object.studentUuid = reader.readStringOrNull(offsets[3]);
  object.uuid = reader.readStringOrNull(offsets[4]);
  return object;
}

P _ngoaiNguClassStudentDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguClassStudentGetId(NgoaiNguClassStudent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguClassStudentGetLinks(
    NgoaiNguClassStudent object) {
  return [];
}

void _ngoaiNguClassStudentAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguClassStudent object) {
  object.id = id;
}

extension NgoaiNguClassStudentByIndex on IsarCollection<NgoaiNguClassStudent> {
  Future<NgoaiNguClassStudent?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguClassStudent? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguClassStudent?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguClassStudent?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguClassStudent object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguClassStudent object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguClassStudent> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguClassStudent> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguClassStudentQueryWhereSort
    on QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QWhere> {
  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguClassStudentQueryWhere
    on QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QWhereClause> {
  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      classUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'classUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      classUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'classUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      classUuidEqualTo(String? classUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'classUuid',
        value: [classUuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      classUuidNotEqualTo(String? classUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classUuid',
              lower: [],
              upper: [classUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classUuid',
              lower: [classUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classUuid',
              lower: [classUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classUuid',
              lower: [],
              upper: [classUuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      studentUuidEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [studentUuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterWhereClause>
      studentUuidNotEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguClassStudentQueryFilter on QueryBuilder<NgoaiNguClassStudent,
    NgoaiNguClassStudent, QFilterCondition> {
  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidEqualTo(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidGreaterThan(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidLessThan(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidBetween(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidStartsWith(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidEndsWith(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
          QAfterFilterCondition>
      classUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
          QAfterFilterCondition>
      classUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> classUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> enrolledAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enrolledAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> enrolledAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enrolledAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> enrolledAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> enrolledAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> enrolledAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> enrolledAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enrolledAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidEqualTo(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidGreaterThan(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidLessThan(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidBetween(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidStartsWith(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidEndsWith(
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
          QAfterFilterCondition>
      studentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
          QAfterFilterCondition>
      studentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
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

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent,
      QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguClassStudentQueryObject on QueryBuilder<NgoaiNguClassStudent,
    NgoaiNguClassStudent, QFilterCondition> {}

extension NgoaiNguClassStudentQueryLinks on QueryBuilder<NgoaiNguClassStudent,
    NgoaiNguClassStudent, QFilterCondition> {}

extension NgoaiNguClassStudentQuerySortBy
    on QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QSortBy> {
  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByEnrolledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguClassStudentQuerySortThenBy
    on QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QSortThenBy> {
  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByEnrolledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguClassStudentQueryWhereDistinct
    on QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QDistinct> {
  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QDistinct>
      distinctByClassUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QDistinct>
      distinctByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enrolledAt');
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QDistinct>
      distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguClassStudent, NgoaiNguClassStudent, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguClassStudentQueryProperty on QueryBuilder<
    NgoaiNguClassStudent, NgoaiNguClassStudent, QQueryProperty> {
  QueryBuilder<NgoaiNguClassStudent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguClassStudent, String?, QQueryOperations>
      classUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classUuid');
    });
  }

  QueryBuilder<NgoaiNguClassStudent, DateTime?, QQueryOperations>
      enrolledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enrolledAt');
    });
  }

  QueryBuilder<NgoaiNguClassStudent, bool, QQueryOperations>
      isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguClassStudent, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguClassStudent, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguQuestionCollection on Isar {
  IsarCollection<NgoaiNguQuestion> get ngoaiNguQuestions => this.collection();
}

const NgoaiNguQuestionSchema = CollectionSchema(
  name: r'NgoaiNguQuestion',
  id: -7206319431181795350,
  properties: {
    r'correctAnswer': PropertySchema(
      id: 0,
      name: r'correctAnswer',
      type: IsarType.string,
    ),
    r'difficulty': PropertySchema(
      id: 1,
      name: r'difficulty',
      type: IsarType.long,
    ),
    r'explanation': PropertySchema(
      id: 2,
      name: r'explanation',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 3,
      name: r'language',
      type: IsarType.byte,
      enumMap: _NgoaiNguQuestionlanguageEnumValueMap,
    ),
    r'level': PropertySchema(
      id: 4,
      name: r'level',
      type: IsarType.string,
    ),
    r'options': PropertySchema(
      id: 5,
      name: r'options',
      type: IsarType.string,
    ),
    r'points': PropertySchema(
      id: 6,
      name: r'points',
      type: IsarType.double,
    ),
    r'question': PropertySchema(
      id: 7,
      name: r'question',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 8,
      name: r'questionId',
      type: IsarType.string,
    ),
    r'skill': PropertySchema(
      id: 9,
      name: r'skill',
      type: IsarType.byte,
      enumMap: _NgoaiNguQuestionskillEnumValueMap,
    ),
    r'topic': PropertySchema(
      id: 10,
      name: r'topic',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.byte,
      enumMap: _NgoaiNguQuestiontypeEnumValueMap,
    )
  },
  estimateSize: _ngoaiNguQuestionEstimateSize,
  serialize: _ngoaiNguQuestionSerialize,
  deserialize: _ngoaiNguQuestionDeserialize,
  deserializeProp: _ngoaiNguQuestionDeserializeProp,
  idName: r'id',
  indexes: {
    r'questionId': IndexSchema(
      id: 5032123391997384121,
      name: r'questionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'questionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguQuestionGetId,
  getLinks: _ngoaiNguQuestionGetLinks,
  attach: _ngoaiNguQuestionAttach,
  version: '3.1.0+1',
);

int _ngoaiNguQuestionEstimateSize(
  NgoaiNguQuestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.correctAnswer.length * 3;
  bytesCount += 3 + object.explanation.length * 3;
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.options.length * 3;
  bytesCount += 3 + object.question.length * 3;
  {
    final value = object.questionId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.topic.length * 3;
  return bytesCount;
}

void _ngoaiNguQuestionSerialize(
  NgoaiNguQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correctAnswer);
  writer.writeLong(offsets[1], object.difficulty);
  writer.writeString(offsets[2], object.explanation);
  writer.writeByte(offsets[3], object.language.index);
  writer.writeString(offsets[4], object.level);
  writer.writeString(offsets[5], object.options);
  writer.writeDouble(offsets[6], object.points);
  writer.writeString(offsets[7], object.question);
  writer.writeString(offsets[8], object.questionId);
  writer.writeByte(offsets[9], object.skill.index);
  writer.writeString(offsets[10], object.topic);
  writer.writeByte(offsets[11], object.type.index);
}

NgoaiNguQuestion _ngoaiNguQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguQuestion();
  object.correctAnswer = reader.readString(offsets[0]);
  object.difficulty = reader.readLong(offsets[1]);
  object.explanation = reader.readString(offsets[2]);
  object.id = id;
  object.language = _NgoaiNguQuestionlanguageValueEnumMap[
          reader.readByteOrNull(offsets[3])] ??
      NNLanguage.english;
  object.level = reader.readString(offsets[4]);
  object.options = reader.readString(offsets[5]);
  object.points = reader.readDouble(offsets[6]);
  object.question = reader.readString(offsets[7]);
  object.questionId = reader.readStringOrNull(offsets[8]);
  object.skill =
      _NgoaiNguQuestionskillValueEnumMap[reader.readByteOrNull(offsets[9])] ??
          NNSkill.vocabulary;
  object.topic = reader.readString(offsets[10]);
  object.type =
      _NgoaiNguQuestiontypeValueEnumMap[reader.readByteOrNull(offsets[11])] ??
          NNQuestionType.multipleChoice;
  return object;
}

P _ngoaiNguQuestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_NgoaiNguQuestionlanguageValueEnumMap[
              reader.readByteOrNull(offset)] ??
          NNLanguage.english) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (_NgoaiNguQuestionskillValueEnumMap[
              reader.readByteOrNull(offset)] ??
          NNSkill.vocabulary) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (_NgoaiNguQuestiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          NNQuestionType.multipleChoice) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguQuestionlanguageEnumValueMap = {
  'english': 0,
  'japanese': 1,
  'vietnamese': 2,
};
const _NgoaiNguQuestionlanguageValueEnumMap = {
  0: NNLanguage.english,
  1: NNLanguage.japanese,
  2: NNLanguage.vietnamese,
};
const _NgoaiNguQuestionskillEnumValueMap = {
  'vocabulary': 0,
  'grammar': 1,
  'reading': 2,
  'listening': 3,
  'speaking': 4,
  'writing': 5,
};
const _NgoaiNguQuestionskillValueEnumMap = {
  0: NNSkill.vocabulary,
  1: NNSkill.grammar,
  2: NNSkill.reading,
  3: NNSkill.listening,
  4: NNSkill.speaking,
  5: NNSkill.writing,
};
const _NgoaiNguQuestiontypeEnumValueMap = {
  'multipleChoice': 0,
  'singleChoice': 1,
  'trueFalse': 2,
  'fillBlank': 3,
  'matching': 4,
  'listening': 5,
  'speaking': 6,
  'writing': 7,
  'reading': 8,
};
const _NgoaiNguQuestiontypeValueEnumMap = {
  0: NNQuestionType.multipleChoice,
  1: NNQuestionType.singleChoice,
  2: NNQuestionType.trueFalse,
  3: NNQuestionType.fillBlank,
  4: NNQuestionType.matching,
  5: NNQuestionType.listening,
  6: NNQuestionType.speaking,
  7: NNQuestionType.writing,
  8: NNQuestionType.reading,
};

Id _ngoaiNguQuestionGetId(NgoaiNguQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguQuestionGetLinks(NgoaiNguQuestion object) {
  return [];
}

void _ngoaiNguQuestionAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguQuestion object) {
  object.id = id;
}

extension NgoaiNguQuestionByIndex on IsarCollection<NgoaiNguQuestion> {
  Future<NgoaiNguQuestion?> getByQuestionId(String? questionId) {
    return getByIndex(r'questionId', [questionId]);
  }

  NgoaiNguQuestion? getByQuestionIdSync(String? questionId) {
    return getByIndexSync(r'questionId', [questionId]);
  }

  Future<bool> deleteByQuestionId(String? questionId) {
    return deleteByIndex(r'questionId', [questionId]);
  }

  bool deleteByQuestionIdSync(String? questionId) {
    return deleteByIndexSync(r'questionId', [questionId]);
  }

  Future<List<NgoaiNguQuestion?>> getAllByQuestionId(
      List<String?> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'questionId', values);
  }

  List<NgoaiNguQuestion?> getAllByQuestionIdSync(
      List<String?> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'questionId', values);
  }

  Future<int> deleteAllByQuestionId(List<String?> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'questionId', values);
  }

  int deleteAllByQuestionIdSync(List<String?> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'questionId', values);
  }

  Future<Id> putByQuestionId(NgoaiNguQuestion object) {
    return putByIndex(r'questionId', object);
  }

  Id putByQuestionIdSync(NgoaiNguQuestion object, {bool saveLinks = true}) {
    return putByIndexSync(r'questionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQuestionId(List<NgoaiNguQuestion> objects) {
    return putAllByIndex(r'questionId', objects);
  }

  List<Id> putAllByQuestionIdSync(List<NgoaiNguQuestion> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'questionId', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguQuestionQueryWhereSort
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QWhere> {
  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguQuestionQueryWhere
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QWhereClause> {
  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'questionId',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'questionId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause>
      questionIdEqualTo(String? questionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'questionId',
        value: [questionId],
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterWhereClause>
      questionIdNotEqualTo(String? questionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [],
              upper: [questionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [questionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [questionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [],
              upper: [questionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguQuestionQueryFilter
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QFilterCondition> {
  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      correctAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      difficultyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      difficultyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      difficultyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      difficultyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explanation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explanation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanation',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      explanationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explanation',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      languageEqualTo(NNLanguage value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      languageGreaterThan(
    NNLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      languageLessThan(
    NNLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      languageBetween(
    NNLanguage lower,
    NNLanguage upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelEqualTo(
    String value, {
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelGreaterThan(
    String value, {
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelLessThan(
    String value, {
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'level',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'options',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'options',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'options',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      optionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'options',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      pointsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'points',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      pointsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'points',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      pointsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'points',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      pointsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'points',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      questionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      skillEqualTo(NNSkill value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skill',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      skillGreaterThan(
    NNSkill value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skill',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      skillLessThan(
    NNSkill value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skill',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      skillBetween(
    NNSkill lower,
    NNSkill upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skill',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'topic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'topic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'topic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'topic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'topic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'topic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'topic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topic',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      topicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'topic',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      typeEqualTo(NNQuestionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      typeGreaterThan(
    NNQuestionType value, {
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      typeLessThan(
    NNQuestionType value, {
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

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterFilterCondition>
      typeBetween(
    NNQuestionType lower,
    NNQuestionType upper, {
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
}

extension NgoaiNguQuestionQueryObject
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QFilterCondition> {}

extension NgoaiNguQuestionQueryLinks
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QFilterCondition> {}

extension NgoaiNguQuestionQuerySortBy
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QSortBy> {
  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'options', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'options', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> sortBySkill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortBySkillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> sortByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension NgoaiNguQuestionQuerySortThenBy
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QSortThenBy> {
  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'options', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'options', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> thenBySkill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenBySkillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> thenByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension NgoaiNguQuestionQueryWhereDistinct
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct> {
  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctByCorrectAnswer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty');
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctByExplanation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explanation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language');
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct> distinctByLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct> distinctByOptions(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'options', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'points');
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctByQuestion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'question', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctByQuestionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct>
      distinctBySkill() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skill');
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct> distinctByTopic(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension NgoaiNguQuestionQueryProperty
    on QueryBuilder<NgoaiNguQuestion, NgoaiNguQuestion, QQueryProperty> {
  QueryBuilder<NgoaiNguQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguQuestion, String, QQueryOperations>
      correctAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswer');
    });
  }

  QueryBuilder<NgoaiNguQuestion, int, QQueryOperations> difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<NgoaiNguQuestion, String, QQueryOperations>
      explanationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanation');
    });
  }

  QueryBuilder<NgoaiNguQuestion, NNLanguage, QQueryOperations>
      languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<NgoaiNguQuestion, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<NgoaiNguQuestion, String, QQueryOperations> optionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'options');
    });
  }

  QueryBuilder<NgoaiNguQuestion, double, QQueryOperations> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'points');
    });
  }

  QueryBuilder<NgoaiNguQuestion, String, QQueryOperations> questionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question');
    });
  }

  QueryBuilder<NgoaiNguQuestion, String?, QQueryOperations>
      questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<NgoaiNguQuestion, NNSkill, QQueryOperations> skillProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skill');
    });
  }

  QueryBuilder<NgoaiNguQuestion, String, QQueryOperations> topicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topic');
    });
  }

  QueryBuilder<NgoaiNguQuestion, NNQuestionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguTestAttemptCollection on Isar {
  IsarCollection<NgoaiNguTestAttempt> get ngoaiNguTestAttempts =>
      this.collection();
}

const NgoaiNguTestAttemptSchema = CollectionSchema(
  name: r'NgoaiNguTestAttempt',
  id: -7965044432164005628,
  properties: {
    r'attemptId': PropertySchema(
      id: 0,
      name: r'attemptId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'gradeLabel': PropertySchema(
      id: 2,
      name: r'gradeLabel',
      type: IsarType.string,
    ),
    r'grammarScore': PropertySchema(
      id: 3,
      name: r'grammarScore',
      type: IsarType.double,
    ),
    r'language': PropertySchema(
      id: 4,
      name: r'language',
      type: IsarType.byte,
      enumMap: _NgoaiNguTestAttemptlanguageEnumValueMap,
    ),
    r'listeningScore': PropertySchema(
      id: 5,
      name: r'listeningScore',
      type: IsarType.double,
    ),
    r'overallScore': PropertySchema(
      id: 6,
      name: r'overallScore',
      type: IsarType.double,
    ),
    r'readingScore': PropertySchema(
      id: 7,
      name: r'readingScore',
      type: IsarType.double,
    ),
    r'resultLevel': PropertySchema(
      id: 8,
      name: r'resultLevel',
      type: IsarType.string,
    ),
    r'speakingScore': PropertySchema(
      id: 9,
      name: r'speakingScore',
      type: IsarType.double,
    ),
    r'studentUuid': PropertySchema(
      id: 10,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'vocabScore': PropertySchema(
      id: 11,
      name: r'vocabScore',
      type: IsarType.double,
    ),
    r'weightsUsed': PropertySchema(
      id: 12,
      name: r'weightsUsed',
      type: IsarType.string,
    ),
    r'writingScore': PropertySchema(
      id: 13,
      name: r'writingScore',
      type: IsarType.double,
    )
  },
  estimateSize: _ngoaiNguTestAttemptEstimateSize,
  serialize: _ngoaiNguTestAttemptSerialize,
  deserialize: _ngoaiNguTestAttemptDeserialize,
  deserializeProp: _ngoaiNguTestAttemptDeserializeProp,
  idName: r'id',
  indexes: {
    r'attemptId': IndexSchema(
      id: 3768995775447394589,
      name: r'attemptId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'attemptId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'studentUuid': IndexSchema(
      id: -1911763875425566110,
      name: r'studentUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studentUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguTestAttemptGetId,
  getLinks: _ngoaiNguTestAttemptGetLinks,
  attach: _ngoaiNguTestAttemptAttach,
  version: '3.1.0+1',
);

int _ngoaiNguTestAttemptEstimateSize(
  NgoaiNguTestAttempt object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.attemptId.length * 3;
  bytesCount += 3 + object.gradeLabel.length * 3;
  bytesCount += 3 + object.resultLevel.length * 3;
  {
    final value = object.studentUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.weightsUsed.length * 3;
  return bytesCount;
}

void _ngoaiNguTestAttemptSerialize(
  NgoaiNguTestAttempt object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.attemptId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.gradeLabel);
  writer.writeDouble(offsets[3], object.grammarScore);
  writer.writeByte(offsets[4], object.language.index);
  writer.writeDouble(offsets[5], object.listeningScore);
  writer.writeDouble(offsets[6], object.overallScore);
  writer.writeDouble(offsets[7], object.readingScore);
  writer.writeString(offsets[8], object.resultLevel);
  writer.writeDouble(offsets[9], object.speakingScore);
  writer.writeString(offsets[10], object.studentUuid);
  writer.writeDouble(offsets[11], object.vocabScore);
  writer.writeString(offsets[12], object.weightsUsed);
  writer.writeDouble(offsets[13], object.writingScore);
}

NgoaiNguTestAttempt _ngoaiNguTestAttemptDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguTestAttempt();
  object.attemptId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.gradeLabel = reader.readString(offsets[2]);
  object.grammarScore = reader.readDouble(offsets[3]);
  object.id = id;
  object.language = _NgoaiNguTestAttemptlanguageValueEnumMap[
          reader.readByteOrNull(offsets[4])] ??
      NNLanguage.english;
  object.listeningScore = reader.readDouble(offsets[5]);
  object.overallScore = reader.readDouble(offsets[6]);
  object.readingScore = reader.readDouble(offsets[7]);
  object.resultLevel = reader.readString(offsets[8]);
  object.speakingScore = reader.readDouble(offsets[9]);
  object.studentUuid = reader.readStringOrNull(offsets[10]);
  object.vocabScore = reader.readDouble(offsets[11]);
  object.weightsUsed = reader.readString(offsets[12]);
  object.writingScore = reader.readDouble(offsets[13]);
  return object;
}

P _ngoaiNguTestAttemptDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 4:
      return (_NgoaiNguTestAttemptlanguageValueEnumMap[
              reader.readByteOrNull(offset)] ??
          NNLanguage.english) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguTestAttemptlanguageEnumValueMap = {
  'english': 0,
  'japanese': 1,
  'vietnamese': 2,
};
const _NgoaiNguTestAttemptlanguageValueEnumMap = {
  0: NNLanguage.english,
  1: NNLanguage.japanese,
  2: NNLanguage.vietnamese,
};

Id _ngoaiNguTestAttemptGetId(NgoaiNguTestAttempt object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguTestAttemptGetLinks(
    NgoaiNguTestAttempt object) {
  return [];
}

void _ngoaiNguTestAttemptAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguTestAttempt object) {
  object.id = id;
}

extension NgoaiNguTestAttemptByIndex on IsarCollection<NgoaiNguTestAttempt> {
  Future<NgoaiNguTestAttempt?> getByAttemptId(String attemptId) {
    return getByIndex(r'attemptId', [attemptId]);
  }

  NgoaiNguTestAttempt? getByAttemptIdSync(String attemptId) {
    return getByIndexSync(r'attemptId', [attemptId]);
  }

  Future<bool> deleteByAttemptId(String attemptId) {
    return deleteByIndex(r'attemptId', [attemptId]);
  }

  bool deleteByAttemptIdSync(String attemptId) {
    return deleteByIndexSync(r'attemptId', [attemptId]);
  }

  Future<List<NgoaiNguTestAttempt?>> getAllByAttemptId(
      List<String> attemptIdValues) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'attemptId', values);
  }

  List<NgoaiNguTestAttempt?> getAllByAttemptIdSync(
      List<String> attemptIdValues) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'attemptId', values);
  }

  Future<int> deleteAllByAttemptId(List<String> attemptIdValues) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'attemptId', values);
  }

  int deleteAllByAttemptIdSync(List<String> attemptIdValues) {
    final values = attemptIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'attemptId', values);
  }

  Future<Id> putByAttemptId(NgoaiNguTestAttempt object) {
    return putByIndex(r'attemptId', object);
  }

  Id putByAttemptIdSync(NgoaiNguTestAttempt object, {bool saveLinks = true}) {
    return putByIndexSync(r'attemptId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAttemptId(List<NgoaiNguTestAttempt> objects) {
    return putAllByIndex(r'attemptId', objects);
  }

  List<Id> putAllByAttemptIdSync(List<NgoaiNguTestAttempt> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'attemptId', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguTestAttemptQueryWhereSort
    on QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QWhere> {
  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguTestAttemptQueryWhere
    on QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QWhereClause> {
  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      attemptIdEqualTo(String attemptId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'attemptId',
        value: [attemptId],
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      attemptIdNotEqualTo(String attemptId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'attemptId',
              lower: [],
              upper: [attemptId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'attemptId',
              lower: [attemptId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'attemptId',
              lower: [attemptId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'attemptId',
              lower: [],
              upper: [attemptId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      studentUuidEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [studentUuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterWhereClause>
      studentUuidNotEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguTestAttemptQueryFilter on QueryBuilder<NgoaiNguTestAttempt,
    NgoaiNguTestAttempt, QFilterCondition> {
  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attemptId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attemptId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attemptId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      attemptIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attemptId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gradeLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gradeLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gradeLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gradeLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gradeLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gradeLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gradeLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gradeLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gradeLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      gradeLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gradeLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      grammarScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      grammarScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      grammarScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      grammarScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grammarScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      languageEqualTo(NNLanguage value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      languageGreaterThan(
    NNLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      languageLessThan(
    NNLanguage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      languageBetween(
    NNLanguage lower,
    NNLanguage upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      listeningScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listeningScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      listeningScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'listeningScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      listeningScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'listeningScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      listeningScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'listeningScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      overallScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      overallScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      overallScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      overallScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      readingScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      readingScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      readingScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      readingScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resultLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resultLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resultLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resultLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'resultLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'resultLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resultLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resultLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resultLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      resultLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resultLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      speakingScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speakingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      speakingScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speakingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      speakingScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speakingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      speakingScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speakingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      studentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      studentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      vocabScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vocabScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      vocabScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vocabScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      vocabScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vocabScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      vocabScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vocabScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightsUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightsUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightsUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightsUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weightsUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weightsUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weightsUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weightsUsed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightsUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      weightsUsedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weightsUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      writingScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      writingScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'writingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      writingScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'writingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterFilterCondition>
      writingScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'writingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension NgoaiNguTestAttemptQueryObject on QueryBuilder<NgoaiNguTestAttempt,
    NgoaiNguTestAttempt, QFilterCondition> {}

extension NgoaiNguTestAttemptQueryLinks on QueryBuilder<NgoaiNguTestAttempt,
    NgoaiNguTestAttempt, QFilterCondition> {}

extension NgoaiNguTestAttemptQuerySortBy
    on QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QSortBy> {
  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByAttemptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByAttemptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByGradeLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLabel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByGradeLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLabel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByGrammarScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByListeningScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByListeningScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByReadingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByReadingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByResultLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultLevel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByResultLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultLevel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortBySpeakingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortBySpeakingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByVocabScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByVocabScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByWeightsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightsUsed', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByWeightsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightsUsed', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByWritingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      sortByWritingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.desc);
    });
  }
}

extension NgoaiNguTestAttemptQuerySortThenBy
    on QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QSortThenBy> {
  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByAttemptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByAttemptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByGradeLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLabel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByGradeLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradeLabel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByGrammarScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByListeningScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByListeningScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByReadingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByReadingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByResultLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultLevel', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByResultLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resultLevel', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenBySpeakingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenBySpeakingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByVocabScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByVocabScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByWeightsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightsUsed', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByWeightsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightsUsed', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByWritingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QAfterSortBy>
      thenByWritingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.desc);
    });
  }
}

extension NgoaiNguTestAttemptQueryWhereDistinct
    on QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct> {
  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByAttemptId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attemptId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByGradeLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gradeLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grammarScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByListeningScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listeningScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByReadingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readingScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByResultLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resultLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctBySpeakingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speakingScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByVocabScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vocabScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByWeightsUsed({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightsUsed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QDistinct>
      distinctByWritingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'writingScore');
    });
  }
}

extension NgoaiNguTestAttemptQueryProperty
    on QueryBuilder<NgoaiNguTestAttempt, NgoaiNguTestAttempt, QQueryProperty> {
  QueryBuilder<NgoaiNguTestAttempt, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, String, QQueryOperations>
      attemptIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attemptId');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, String, QQueryOperations>
      gradeLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gradeLabel');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, double, QQueryOperations>
      grammarScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grammarScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, NNLanguage, QQueryOperations>
      languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, double, QQueryOperations>
      listeningScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listeningScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, double, QQueryOperations>
      overallScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, double, QQueryOperations>
      readingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readingScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, String, QQueryOperations>
      resultLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resultLevel');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, double, QQueryOperations>
      speakingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speakingScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, double, QQueryOperations>
      vocabScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vocabScore');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, String, QQueryOperations>
      weightsUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightsUsed');
    });
  }

  QueryBuilder<NgoaiNguTestAttempt, double, QQueryOperations>
      writingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'writingScore');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguCertificateCollection on Isar {
  IsarCollection<NgoaiNguCertificate> get ngoaiNguCertificates =>
      this.collection();
}

const NgoaiNguCertificateSchema = CollectionSchema(
  name: r'NgoaiNguCertificate',
  id: -6744385104675935479,
  properties: {
    r'certCode': PropertySchema(
      id: 0,
      name: r'certCode',
      type: IsarType.string,
    ),
    r'courseUuid': PropertySchema(
      id: 1,
      name: r'courseUuid',
      type: IsarType.string,
    ),
    r'expiryDate': PropertySchema(
      id: 2,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 3,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'issueDate': PropertySchema(
      id: 4,
      name: r'issueDate',
      type: IsarType.dateTime,
    ),
    r'level': PropertySchema(
      id: 5,
      name: r'level',
      type: IsarType.string,
    ),
    r'score': PropertySchema(
      id: 6,
      name: r'score',
      type: IsarType.double,
    ),
    r'studentUuid': PropertySchema(
      id: 7,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'verificationCode': PropertySchema(
      id: 8,
      name: r'verificationCode',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguCertificateEstimateSize,
  serialize: _ngoaiNguCertificateSerialize,
  deserialize: _ngoaiNguCertificateDeserialize,
  deserializeProp: _ngoaiNguCertificateDeserializeProp,
  idName: r'id',
  indexes: {
    r'certCode': IndexSchema(
      id: -4151426781741398563,
      name: r'certCode',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'certCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'studentUuid': IndexSchema(
      id: -1911763875425566110,
      name: r'studentUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studentUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguCertificateGetId,
  getLinks: _ngoaiNguCertificateGetLinks,
  attach: _ngoaiNguCertificateAttach,
  version: '3.1.0+1',
);

int _ngoaiNguCertificateEstimateSize(
  NgoaiNguCertificate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.certCode.length * 3;
  {
    final value = object.courseUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.level.length * 3;
  {
    final value = object.studentUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.verificationCode.length * 3;
  return bytesCount;
}

void _ngoaiNguCertificateSerialize(
  NgoaiNguCertificate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.certCode);
  writer.writeString(offsets[1], object.courseUuid);
  writer.writeDateTime(offsets[2], object.expiryDate);
  writer.writeBool(offsets[3], object.isDeleted);
  writer.writeDateTime(offsets[4], object.issueDate);
  writer.writeString(offsets[5], object.level);
  writer.writeDouble(offsets[6], object.score);
  writer.writeString(offsets[7], object.studentUuid);
  writer.writeString(offsets[8], object.verificationCode);
}

NgoaiNguCertificate _ngoaiNguCertificateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguCertificate();
  object.certCode = reader.readString(offsets[0]);
  object.courseUuid = reader.readStringOrNull(offsets[1]);
  object.expiryDate = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[3]);
  object.issueDate = reader.readDateTime(offsets[4]);
  object.level = reader.readString(offsets[5]);
  object.score = reader.readDouble(offsets[6]);
  object.studentUuid = reader.readStringOrNull(offsets[7]);
  object.verificationCode = reader.readString(offsets[8]);
  return object;
}

P _ngoaiNguCertificateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguCertificateGetId(NgoaiNguCertificate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguCertificateGetLinks(
    NgoaiNguCertificate object) {
  return [];
}

void _ngoaiNguCertificateAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguCertificate object) {
  object.id = id;
}

extension NgoaiNguCertificateByIndex on IsarCollection<NgoaiNguCertificate> {
  Future<NgoaiNguCertificate?> getByCertCode(String certCode) {
    return getByIndex(r'certCode', [certCode]);
  }

  NgoaiNguCertificate? getByCertCodeSync(String certCode) {
    return getByIndexSync(r'certCode', [certCode]);
  }

  Future<bool> deleteByCertCode(String certCode) {
    return deleteByIndex(r'certCode', [certCode]);
  }

  bool deleteByCertCodeSync(String certCode) {
    return deleteByIndexSync(r'certCode', [certCode]);
  }

  Future<List<NgoaiNguCertificate?>> getAllByCertCode(
      List<String> certCodeValues) {
    final values = certCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'certCode', values);
  }

  List<NgoaiNguCertificate?> getAllByCertCodeSync(List<String> certCodeValues) {
    final values = certCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'certCode', values);
  }

  Future<int> deleteAllByCertCode(List<String> certCodeValues) {
    final values = certCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'certCode', values);
  }

  int deleteAllByCertCodeSync(List<String> certCodeValues) {
    final values = certCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'certCode', values);
  }

  Future<Id> putByCertCode(NgoaiNguCertificate object) {
    return putByIndex(r'certCode', object);
  }

  Id putByCertCodeSync(NgoaiNguCertificate object, {bool saveLinks = true}) {
    return putByIndexSync(r'certCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCertCode(List<NgoaiNguCertificate> objects) {
    return putAllByIndex(r'certCode', objects);
  }

  List<Id> putAllByCertCodeSync(List<NgoaiNguCertificate> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'certCode', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguCertificateQueryWhereSort
    on QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QWhere> {
  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguCertificateQueryWhere
    on QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QWhereClause> {
  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      certCodeEqualTo(String certCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'certCode',
        value: [certCode],
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      certCodeNotEqualTo(String certCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'certCode',
              lower: [],
              upper: [certCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'certCode',
              lower: [certCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'certCode',
              lower: [certCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'certCode',
              lower: [],
              upper: [certCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      studentUuidEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [studentUuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterWhereClause>
      studentUuidNotEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguCertificateQueryFilter on QueryBuilder<NgoaiNguCertificate,
    NgoaiNguCertificate, QFilterCondition> {
  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'certCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'certCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'certCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'certCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'certCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'certCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'certCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      certCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'certCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      courseUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      courseUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      courseUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      courseUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'courseUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      courseUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      courseUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'courseUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      expiryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      expiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      expiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      expiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      issueDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      issueDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      issueDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      issueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelEqualTo(
    String value, {
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelGreaterThan(
    String value, {
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelLessThan(
    String value, {
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'level',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      scoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      scoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      scoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      scoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      studentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      studentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verificationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verificationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verificationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verificationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'verificationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'verificationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'verificationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'verificationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verificationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterFilterCondition>
      verificationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'verificationCode',
        value: '',
      ));
    });
  }
}

extension NgoaiNguCertificateQueryObject on QueryBuilder<NgoaiNguCertificate,
    NgoaiNguCertificate, QFilterCondition> {}

extension NgoaiNguCertificateQueryLinks on QueryBuilder<NgoaiNguCertificate,
    NgoaiNguCertificate, QFilterCondition> {}

extension NgoaiNguCertificateQuerySortBy
    on QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QSortBy> {
  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByCertCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByCertCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByCourseUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByCourseUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByVerificationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      sortByVerificationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationCode', Sort.desc);
    });
  }
}

extension NgoaiNguCertificateQuerySortThenBy
    on QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QSortThenBy> {
  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByCertCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByCertCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByCourseUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByCourseUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByVerificationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QAfterSortBy>
      thenByVerificationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verificationCode', Sort.desc);
    });
  }
}

extension NgoaiNguCertificateQueryWhereDistinct
    on QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct> {
  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByCertCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'certCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByCourseUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueDate');
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QDistinct>
      distinctByVerificationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verificationCode',
          caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguCertificateQueryProperty
    on QueryBuilder<NgoaiNguCertificate, NgoaiNguCertificate, QQueryProperty> {
  QueryBuilder<NgoaiNguCertificate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguCertificate, String, QQueryOperations>
      certCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'certCode');
    });
  }

  QueryBuilder<NgoaiNguCertificate, String?, QQueryOperations>
      courseUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseUuid');
    });
  }

  QueryBuilder<NgoaiNguCertificate, DateTime?, QQueryOperations>
      expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<NgoaiNguCertificate, bool, QQueryOperations>
      isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguCertificate, DateTime, QQueryOperations>
      issueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueDate');
    });
  }

  QueryBuilder<NgoaiNguCertificate, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<NgoaiNguCertificate, double, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<NgoaiNguCertificate, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguCertificate, String, QQueryOperations>
      verificationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verificationCode');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguInvoiceCollection on Isar {
  IsarCollection<NgoaiNguInvoice> get ngoaiNguInvoices => this.collection();
}

const NgoaiNguInvoiceSchema = CollectionSchema(
  name: r'NgoaiNguInvoice',
  id: -5894249629333248498,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'classUuid': PropertySchema(
      id: 1,
      name: r'classUuid',
      type: IsarType.string,
    ),
    r'courseUuid': PropertySchema(
      id: 2,
      name: r'courseUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'discount': PropertySchema(
      id: 4,
      name: r'discount',
      type: IsarType.double,
    ),
    r'dueDate': PropertySchema(
      id: 5,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'invoiceCode': PropertySchema(
      id: 6,
      name: r'invoiceCode',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 7,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'outstanding': PropertySchema(
      id: 8,
      name: r'outstanding',
      type: IsarType.double,
    ),
    r'paidAmount': PropertySchema(
      id: 9,
      name: r'paidAmount',
      type: IsarType.double,
    ),
    r'paymentMethod': PropertySchema(
      id: 10,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
    ),
    r'studentUuid': PropertySchema(
      id: 12,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'voucherCode': PropertySchema(
      id: 13,
      name: r'voucherCode',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguInvoiceEstimateSize,
  serialize: _ngoaiNguInvoiceSerialize,
  deserialize: _ngoaiNguInvoiceDeserialize,
  deserializeProp: _ngoaiNguInvoiceDeserializeProp,
  idName: r'id',
  indexes: {
    r'invoiceCode': IndexSchema(
      id: -3549533218321745826,
      name: r'invoiceCode',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'invoiceCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'studentUuid': IndexSchema(
      id: -1911763875425566110,
      name: r'studentUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studentUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguInvoiceGetId,
  getLinks: _ngoaiNguInvoiceGetLinks,
  attach: _ngoaiNguInvoiceAttach,
  version: '3.1.0+1',
);

int _ngoaiNguInvoiceEstimateSize(
  NgoaiNguInvoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.classUuid;
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
  bytesCount += 3 + object.invoiceCode.length * 3;
  bytesCount += 3 + object.paymentMethod.length * 3;
  bytesCount += 3 + object.status.length * 3;
  {
    final value = object.studentUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.voucherCode.length * 3;
  return bytesCount;
}

void _ngoaiNguInvoiceSerialize(
  NgoaiNguInvoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.classUuid);
  writer.writeString(offsets[2], object.courseUuid);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDouble(offsets[4], object.discount);
  writer.writeDateTime(offsets[5], object.dueDate);
  writer.writeString(offsets[6], object.invoiceCode);
  writer.writeBool(offsets[7], object.isDeleted);
  writer.writeDouble(offsets[8], object.outstanding);
  writer.writeDouble(offsets[9], object.paidAmount);
  writer.writeString(offsets[10], object.paymentMethod);
  writer.writeString(offsets[11], object.status);
  writer.writeString(offsets[12], object.studentUuid);
  writer.writeString(offsets[13], object.voucherCode);
}

NgoaiNguInvoice _ngoaiNguInvoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguInvoice();
  object.amount = reader.readDouble(offsets[0]);
  object.classUuid = reader.readStringOrNull(offsets[1]);
  object.courseUuid = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.discount = reader.readDouble(offsets[4]);
  object.dueDate = reader.readDateTime(offsets[5]);
  object.id = id;
  object.invoiceCode = reader.readString(offsets[6]);
  object.isDeleted = reader.readBool(offsets[7]);
  object.paidAmount = reader.readDouble(offsets[9]);
  object.paymentMethod = reader.readString(offsets[10]);
  object.status = reader.readString(offsets[11]);
  object.studentUuid = reader.readStringOrNull(offsets[12]);
  object.voucherCode = reader.readString(offsets[13]);
  return object;
}

P _ngoaiNguInvoiceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguInvoiceGetId(NgoaiNguInvoice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguInvoiceGetLinks(NgoaiNguInvoice object) {
  return [];
}

void _ngoaiNguInvoiceAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguInvoice object) {
  object.id = id;
}

extension NgoaiNguInvoiceByIndex on IsarCollection<NgoaiNguInvoice> {
  Future<NgoaiNguInvoice?> getByInvoiceCode(String invoiceCode) {
    return getByIndex(r'invoiceCode', [invoiceCode]);
  }

  NgoaiNguInvoice? getByInvoiceCodeSync(String invoiceCode) {
    return getByIndexSync(r'invoiceCode', [invoiceCode]);
  }

  Future<bool> deleteByInvoiceCode(String invoiceCode) {
    return deleteByIndex(r'invoiceCode', [invoiceCode]);
  }

  bool deleteByInvoiceCodeSync(String invoiceCode) {
    return deleteByIndexSync(r'invoiceCode', [invoiceCode]);
  }

  Future<List<NgoaiNguInvoice?>> getAllByInvoiceCode(
      List<String> invoiceCodeValues) {
    final values = invoiceCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'invoiceCode', values);
  }

  List<NgoaiNguInvoice?> getAllByInvoiceCodeSync(
      List<String> invoiceCodeValues) {
    final values = invoiceCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'invoiceCode', values);
  }

  Future<int> deleteAllByInvoiceCode(List<String> invoiceCodeValues) {
    final values = invoiceCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'invoiceCode', values);
  }

  int deleteAllByInvoiceCodeSync(List<String> invoiceCodeValues) {
    final values = invoiceCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'invoiceCode', values);
  }

  Future<Id> putByInvoiceCode(NgoaiNguInvoice object) {
    return putByIndex(r'invoiceCode', object);
  }

  Id putByInvoiceCodeSync(NgoaiNguInvoice object, {bool saveLinks = true}) {
    return putByIndexSync(r'invoiceCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInvoiceCode(List<NgoaiNguInvoice> objects) {
    return putAllByIndex(r'invoiceCode', objects);
  }

  List<Id> putAllByInvoiceCodeSync(List<NgoaiNguInvoice> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'invoiceCode', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguInvoiceQueryWhereSort
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QWhere> {
  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguInvoiceQueryWhere
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QWhereClause> {
  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
      invoiceCodeEqualTo(String invoiceCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoiceCode',
        value: [invoiceCode],
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
      invoiceCodeNotEqualTo(String invoiceCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [],
              upper: [invoiceCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [invoiceCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [invoiceCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [],
              upper: [invoiceCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
      studentUuidEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [studentUuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterWhereClause>
      studentUuidNotEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguInvoiceQueryFilter
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QFilterCondition> {
  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      classUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      classUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      classUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      classUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      classUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      classUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      courseUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      courseUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      courseUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'courseUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      courseUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'courseUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      courseUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      courseUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'courseUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      discountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      discountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      discountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      discountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      dueDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      dueDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      dueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      invoiceCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      outstandingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outstanding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      outstandingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outstanding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      outstandingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outstanding',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      outstandingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outstanding',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paidAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paidAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paidAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paidAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusEqualTo(
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusGreaterThan(
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusLessThan(
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusBetween(
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      studentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      studentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voucherCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'voucherCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterFilterCondition>
      voucherCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'voucherCode',
        value: '',
      ));
    });
  }
}

extension NgoaiNguInvoiceQueryObject
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QFilterCondition> {}

extension NgoaiNguInvoiceQueryLinks
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QFilterCondition> {}

extension NgoaiNguInvoiceQuerySortBy
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QSortBy> {
  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByCourseUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByCourseUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByInvoiceCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByInvoiceCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByOutstanding() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outstanding', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByOutstandingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outstanding', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByVoucherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      sortByVoucherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.desc);
    });
  }
}

extension NgoaiNguInvoiceQuerySortThenBy
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QSortThenBy> {
  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByCourseUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByCourseUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByInvoiceCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByInvoiceCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByOutstanding() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outstanding', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByOutstandingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outstanding', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByVoucherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QAfterSortBy>
      thenByVoucherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.desc);
    });
  }
}

extension NgoaiNguInvoiceQueryWhereDistinct
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct> {
  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct> distinctByClassUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByCourseUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByInvoiceCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByOutstanding() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outstanding');
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAmount');
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByPaymentMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QDistinct>
      distinctByVoucherCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherCode', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguInvoiceQueryProperty
    on QueryBuilder<NgoaiNguInvoice, NgoaiNguInvoice, QQueryProperty> {
  QueryBuilder<NgoaiNguInvoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguInvoice, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<NgoaiNguInvoice, String?, QQueryOperations> classUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classUuid');
    });
  }

  QueryBuilder<NgoaiNguInvoice, String?, QQueryOperations>
      courseUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseUuid');
    });
  }

  QueryBuilder<NgoaiNguInvoice, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguInvoice, double, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<NgoaiNguInvoice, DateTime, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<NgoaiNguInvoice, String, QQueryOperations>
      invoiceCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceCode');
    });
  }

  QueryBuilder<NgoaiNguInvoice, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguInvoice, double, QQueryOperations>
      outstandingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outstanding');
    });
  }

  QueryBuilder<NgoaiNguInvoice, double, QQueryOperations> paidAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAmount');
    });
  }

  QueryBuilder<NgoaiNguInvoice, String, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<NgoaiNguInvoice, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NgoaiNguInvoice, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguInvoice, String, QQueryOperations>
      voucherCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherCode');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguPaymentRecordCollection on Isar {
  IsarCollection<NgoaiNguPaymentRecord> get ngoaiNguPaymentRecords =>
      this.collection();
}

const NgoaiNguPaymentRecordSchema = CollectionSchema(
  name: r'NgoaiNguPaymentRecord',
  id: -3149834101278929144,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'invoiceCode': PropertySchema(
      id: 1,
      name: r'invoiceCode',
      type: IsarType.string,
    ),
    r'method': PropertySchema(
      id: 2,
      name: r'method',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 3,
      name: r'note',
      type: IsarType.string,
    ),
    r'paidAt': PropertySchema(
      id: 4,
      name: r'paidAt',
      type: IsarType.dateTime,
    ),
    r'paymentId': PropertySchema(
      id: 5,
      name: r'paymentId',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguPaymentRecordEstimateSize,
  serialize: _ngoaiNguPaymentRecordSerialize,
  deserialize: _ngoaiNguPaymentRecordDeserialize,
  deserializeProp: _ngoaiNguPaymentRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'paymentId': IndexSchema(
      id: 7838699178157896428,
      name: r'paymentId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'paymentId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'invoiceCode': IndexSchema(
      id: -3549533218321745826,
      name: r'invoiceCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'invoiceCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguPaymentRecordGetId,
  getLinks: _ngoaiNguPaymentRecordGetLinks,
  attach: _ngoaiNguPaymentRecordAttach,
  version: '3.1.0+1',
);

int _ngoaiNguPaymentRecordEstimateSize(
  NgoaiNguPaymentRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.invoiceCode.length * 3;
  bytesCount += 3 + object.method.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.paymentId.length * 3;
  return bytesCount;
}

void _ngoaiNguPaymentRecordSerialize(
  NgoaiNguPaymentRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.invoiceCode);
  writer.writeString(offsets[2], object.method);
  writer.writeString(offsets[3], object.note);
  writer.writeDateTime(offsets[4], object.paidAt);
  writer.writeString(offsets[5], object.paymentId);
}

NgoaiNguPaymentRecord _ngoaiNguPaymentRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguPaymentRecord();
  object.amount = reader.readDouble(offsets[0]);
  object.id = id;
  object.invoiceCode = reader.readString(offsets[1]);
  object.method = reader.readString(offsets[2]);
  object.note = reader.readString(offsets[3]);
  object.paidAt = reader.readDateTime(offsets[4]);
  object.paymentId = reader.readString(offsets[5]);
  return object;
}

P _ngoaiNguPaymentRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguPaymentRecordGetId(NgoaiNguPaymentRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguPaymentRecordGetLinks(
    NgoaiNguPaymentRecord object) {
  return [];
}

void _ngoaiNguPaymentRecordAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguPaymentRecord object) {
  object.id = id;
}

extension NgoaiNguPaymentRecordByIndex
    on IsarCollection<NgoaiNguPaymentRecord> {
  Future<NgoaiNguPaymentRecord?> getByPaymentId(String paymentId) {
    return getByIndex(r'paymentId', [paymentId]);
  }

  NgoaiNguPaymentRecord? getByPaymentIdSync(String paymentId) {
    return getByIndexSync(r'paymentId', [paymentId]);
  }

  Future<bool> deleteByPaymentId(String paymentId) {
    return deleteByIndex(r'paymentId', [paymentId]);
  }

  bool deleteByPaymentIdSync(String paymentId) {
    return deleteByIndexSync(r'paymentId', [paymentId]);
  }

  Future<List<NgoaiNguPaymentRecord?>> getAllByPaymentId(
      List<String> paymentIdValues) {
    final values = paymentIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'paymentId', values);
  }

  List<NgoaiNguPaymentRecord?> getAllByPaymentIdSync(
      List<String> paymentIdValues) {
    final values = paymentIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'paymentId', values);
  }

  Future<int> deleteAllByPaymentId(List<String> paymentIdValues) {
    final values = paymentIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'paymentId', values);
  }

  int deleteAllByPaymentIdSync(List<String> paymentIdValues) {
    final values = paymentIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'paymentId', values);
  }

  Future<Id> putByPaymentId(NgoaiNguPaymentRecord object) {
    return putByIndex(r'paymentId', object);
  }

  Id putByPaymentIdSync(NgoaiNguPaymentRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'paymentId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPaymentId(List<NgoaiNguPaymentRecord> objects) {
    return putAllByIndex(r'paymentId', objects);
  }

  List<Id> putAllByPaymentIdSync(List<NgoaiNguPaymentRecord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'paymentId', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguPaymentRecordQueryWhereSort
    on QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QWhere> {
  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguPaymentRecordQueryWhere on QueryBuilder<NgoaiNguPaymentRecord,
    NgoaiNguPaymentRecord, QWhereClause> {
  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
      paymentIdEqualTo(String paymentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'paymentId',
        value: [paymentId],
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
      paymentIdNotEqualTo(String paymentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentId',
              lower: [],
              upper: [paymentId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentId',
              lower: [paymentId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentId',
              lower: [paymentId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paymentId',
              lower: [],
              upper: [paymentId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
      invoiceCodeEqualTo(String invoiceCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoiceCode',
        value: [invoiceCode],
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterWhereClause>
      invoiceCodeNotEqualTo(String invoiceCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [],
              upper: [invoiceCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [invoiceCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [invoiceCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoiceCode',
              lower: [],
              upper: [invoiceCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguPaymentRecordQueryFilter on QueryBuilder<
    NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QFilterCondition> {
  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      invoiceCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      invoiceCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> invoiceCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'method',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      methodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'method',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      methodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'method',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> methodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'method',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteEqualTo(
    String value, {
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteGreaterThan(
    String value, {
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteLessThan(
    String value, {
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteStartsWith(
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paidAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paidAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paidAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paidAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      paymentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
          QAfterFilterCondition>
      paymentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord,
      QAfterFilterCondition> paymentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentId',
        value: '',
      ));
    });
  }
}

extension NgoaiNguPaymentRecordQueryObject on QueryBuilder<
    NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QFilterCondition> {}

extension NgoaiNguPaymentRecordQueryLinks on QueryBuilder<NgoaiNguPaymentRecord,
    NgoaiNguPaymentRecord, QFilterCondition> {}

extension NgoaiNguPaymentRecordQuerySortBy
    on QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QSortBy> {
  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByInvoiceCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByInvoiceCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByPaidAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByPaymentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      sortByPaymentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.desc);
    });
  }
}

extension NgoaiNguPaymentRecordQuerySortThenBy
    on QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QSortThenBy> {
  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByInvoiceCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByInvoiceCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceCode', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByPaidAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByPaymentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QAfterSortBy>
      thenByPaymentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.desc);
    });
  }
}

extension NgoaiNguPaymentRecordQueryWhereDistinct
    on QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QDistinct> {
  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QDistinct>
      distinctByInvoiceCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QDistinct>
      distinctByMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'method', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QDistinct>
      distinctByPaidAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAt');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QDistinct>
      distinctByPaymentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentId', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguPaymentRecordQueryProperty on QueryBuilder<
    NgoaiNguPaymentRecord, NgoaiNguPaymentRecord, QQueryProperty> {
  QueryBuilder<NgoaiNguPaymentRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, String, QQueryOperations>
      invoiceCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceCode');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, String, QQueryOperations>
      methodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'method');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, DateTime, QQueryOperations>
      paidAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAt');
    });
  }

  QueryBuilder<NgoaiNguPaymentRecord, String, QQueryOperations>
      paymentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguVoucherCollection on Isar {
  IsarCollection<NgoaiNguVoucher> get ngoaiNguVouchers => this.collection();
}

const NgoaiNguVoucherSchema = CollectionSchema(
  name: r'NgoaiNguVoucher',
  id: 1759695011671330737,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'maxDiscount': PropertySchema(
      id: 2,
      name: r'maxDiscount',
      type: IsarType.double,
    ),
    r'minOrder': PropertySchema(
      id: 3,
      name: r'minOrder',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    ),
    r'usageCount': PropertySchema(
      id: 5,
      name: r'usageCount',
      type: IsarType.long,
    ),
    r'validTo': PropertySchema(
      id: 6,
      name: r'validTo',
      type: IsarType.dateTime,
    ),
    r'value': PropertySchema(
      id: 7,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _ngoaiNguVoucherEstimateSize,
  serialize: _ngoaiNguVoucherSerialize,
  deserialize: _ngoaiNguVoucherDeserialize,
  deserializeProp: _ngoaiNguVoucherDeserializeProp,
  idName: r'id',
  indexes: {
    r'code': IndexSchema(
      id: 329780482934683790,
      name: r'code',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'code',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguVoucherGetId,
  getLinks: _ngoaiNguVoucherGetLinks,
  attach: _ngoaiNguVoucherAttach,
  version: '3.1.0+1',
);

int _ngoaiNguVoucherEstimateSize(
  NgoaiNguVoucher object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _ngoaiNguVoucherSerialize(
  NgoaiNguVoucher object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeDouble(offsets[2], object.maxDiscount);
  writer.writeDouble(offsets[3], object.minOrder);
  writer.writeString(offsets[4], object.type);
  writer.writeLong(offsets[5], object.usageCount);
  writer.writeDateTime(offsets[6], object.validTo);
  writer.writeDouble(offsets[7], object.value);
}

NgoaiNguVoucher _ngoaiNguVoucherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguVoucher();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.id = id;
  object.maxDiscount = reader.readDouble(offsets[2]);
  object.minOrder = reader.readDouble(offsets[3]);
  object.type = reader.readString(offsets[4]);
  object.usageCount = reader.readLong(offsets[5]);
  object.validTo = reader.readDateTimeOrNull(offsets[6]);
  object.value = reader.readDouble(offsets[7]);
  return object;
}

P _ngoaiNguVoucherDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguVoucherGetId(NgoaiNguVoucher object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguVoucherGetLinks(NgoaiNguVoucher object) {
  return [];
}

void _ngoaiNguVoucherAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguVoucher object) {
  object.id = id;
}

extension NgoaiNguVoucherByIndex on IsarCollection<NgoaiNguVoucher> {
  Future<NgoaiNguVoucher?> getByCode(String code) {
    return getByIndex(r'code', [code]);
  }

  NgoaiNguVoucher? getByCodeSync(String code) {
    return getByIndexSync(r'code', [code]);
  }

  Future<bool> deleteByCode(String code) {
    return deleteByIndex(r'code', [code]);
  }

  bool deleteByCodeSync(String code) {
    return deleteByIndexSync(r'code', [code]);
  }

  Future<List<NgoaiNguVoucher?>> getAllByCode(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return getAllByIndex(r'code', values);
  }

  List<NgoaiNguVoucher?> getAllByCodeSync(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'code', values);
  }

  Future<int> deleteAllByCode(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'code', values);
  }

  int deleteAllByCodeSync(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'code', values);
  }

  Future<Id> putByCode(NgoaiNguVoucher object) {
    return putByIndex(r'code', object);
  }

  Id putByCodeSync(NgoaiNguVoucher object, {bool saveLinks = true}) {
    return putByIndexSync(r'code', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCode(List<NgoaiNguVoucher> objects) {
    return putAllByIndex(r'code', objects);
  }

  List<Id> putAllByCodeSync(List<NgoaiNguVoucher> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'code', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguVoucherQueryWhereSort
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QWhere> {
  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguVoucherQueryWhere
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QWhereClause> {
  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhereClause> codeEqualTo(
      String code) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'code',
        value: [code],
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterWhereClause>
      codeNotEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [],
              upper: [code],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [code],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [code],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [],
              upper: [code],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguVoucherQueryFilter
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QFilterCondition> {
  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      maxDiscountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      maxDiscountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      maxDiscountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      maxDiscountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      minOrderEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      minOrderGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      minOrderLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      minOrderBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      usageCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      usageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      usageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      usageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      validToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'validTo',
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      validToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'validTo',
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      validToEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      validToGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      validToLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      validToBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      valueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      valueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      valueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterFilterCondition>
      valueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension NgoaiNguVoucherQueryObject
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QFilterCondition> {}

extension NgoaiNguVoucherQueryLinks
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QFilterCondition> {}

extension NgoaiNguVoucherQuerySortBy
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QSortBy> {
  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByMaxDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByMaxDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByMinOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrder', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByMinOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrder', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> sortByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByValidToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension NgoaiNguVoucherQuerySortThenBy
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QSortThenBy> {
  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByMaxDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByMaxDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByMinOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrder', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByMinOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrder', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> thenByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByValidToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension NgoaiNguVoucherQueryWhereDistinct
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct> {
  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct> distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct>
      distinctByMaxDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxDiscount');
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct>
      distinctByMinOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minOrder');
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct>
      distinctByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageCount');
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct>
      distinctByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validTo');
    });
  }

  QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension NgoaiNguVoucherQueryProperty
    on QueryBuilder<NgoaiNguVoucher, NgoaiNguVoucher, QQueryProperty> {
  QueryBuilder<NgoaiNguVoucher, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguVoucher, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<NgoaiNguVoucher, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<NgoaiNguVoucher, double, QQueryOperations>
      maxDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxDiscount');
    });
  }

  QueryBuilder<NgoaiNguVoucher, double, QQueryOperations> minOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minOrder');
    });
  }

  QueryBuilder<NgoaiNguVoucher, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<NgoaiNguVoucher, int, QQueryOperations> usageCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageCount');
    });
  }

  QueryBuilder<NgoaiNguVoucher, DateTime?, QQueryOperations> validToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validTo');
    });
  }

  QueryBuilder<NgoaiNguVoucher, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguProgressEntryCollection on Isar {
  IsarCollection<NgoaiNguProgressEntry> get ngoaiNguProgressEntrys =>
      this.collection();
}

const NgoaiNguProgressEntrySchema = CollectionSchema(
  name: r'NgoaiNguProgressEntry',
  id: -7851161132224664849,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'entryId': PropertySchema(
      id: 1,
      name: r'entryId',
      type: IsarType.string,
    ),
    r'grammarScore': PropertySchema(
      id: 2,
      name: r'grammarScore',
      type: IsarType.double,
    ),
    r'hoursStudied': PropertySchema(
      id: 3,
      name: r'hoursStudied',
      type: IsarType.double,
    ),
    r'listeningScore': PropertySchema(
      id: 4,
      name: r'listeningScore',
      type: IsarType.double,
    ),
    r'readingScore': PropertySchema(
      id: 5,
      name: r'readingScore',
      type: IsarType.double,
    ),
    r'speakingScore': PropertySchema(
      id: 6,
      name: r'speakingScore',
      type: IsarType.double,
    ),
    r'studentUuid': PropertySchema(
      id: 7,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'vocabScore': PropertySchema(
      id: 8,
      name: r'vocabScore',
      type: IsarType.double,
    ),
    r'writingScore': PropertySchema(
      id: 9,
      name: r'writingScore',
      type: IsarType.double,
    )
  },
  estimateSize: _ngoaiNguProgressEntryEstimateSize,
  serialize: _ngoaiNguProgressEntrySerialize,
  deserialize: _ngoaiNguProgressEntryDeserialize,
  deserializeProp: _ngoaiNguProgressEntryDeserializeProp,
  idName: r'id',
  indexes: {
    r'entryId': IndexSchema(
      id: 3733379884318738402,
      name: r'entryId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'entryId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'studentUuid': IndexSchema(
      id: -1911763875425566110,
      name: r'studentUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studentUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguProgressEntryGetId,
  getLinks: _ngoaiNguProgressEntryGetLinks,
  attach: _ngoaiNguProgressEntryAttach,
  version: '3.1.0+1',
);

int _ngoaiNguProgressEntryEstimateSize(
  NgoaiNguProgressEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entryId.length * 3;
  {
    final value = object.studentUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ngoaiNguProgressEntrySerialize(
  NgoaiNguProgressEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.entryId);
  writer.writeDouble(offsets[2], object.grammarScore);
  writer.writeDouble(offsets[3], object.hoursStudied);
  writer.writeDouble(offsets[4], object.listeningScore);
  writer.writeDouble(offsets[5], object.readingScore);
  writer.writeDouble(offsets[6], object.speakingScore);
  writer.writeString(offsets[7], object.studentUuid);
  writer.writeDouble(offsets[8], object.vocabScore);
  writer.writeDouble(offsets[9], object.writingScore);
}

NgoaiNguProgressEntry _ngoaiNguProgressEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguProgressEntry();
  object.date = reader.readDateTime(offsets[0]);
  object.entryId = reader.readString(offsets[1]);
  object.grammarScore = reader.readDouble(offsets[2]);
  object.hoursStudied = reader.readDouble(offsets[3]);
  object.id = id;
  object.listeningScore = reader.readDouble(offsets[4]);
  object.readingScore = reader.readDouble(offsets[5]);
  object.speakingScore = reader.readDouble(offsets[6]);
  object.studentUuid = reader.readStringOrNull(offsets[7]);
  object.vocabScore = reader.readDouble(offsets[8]);
  object.writingScore = reader.readDouble(offsets[9]);
  return object;
}

P _ngoaiNguProgressEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguProgressEntryGetId(NgoaiNguProgressEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguProgressEntryGetLinks(
    NgoaiNguProgressEntry object) {
  return [];
}

void _ngoaiNguProgressEntryAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguProgressEntry object) {
  object.id = id;
}

extension NgoaiNguProgressEntryByIndex
    on IsarCollection<NgoaiNguProgressEntry> {
  Future<NgoaiNguProgressEntry?> getByEntryId(String entryId) {
    return getByIndex(r'entryId', [entryId]);
  }

  NgoaiNguProgressEntry? getByEntryIdSync(String entryId) {
    return getByIndexSync(r'entryId', [entryId]);
  }

  Future<bool> deleteByEntryId(String entryId) {
    return deleteByIndex(r'entryId', [entryId]);
  }

  bool deleteByEntryIdSync(String entryId) {
    return deleteByIndexSync(r'entryId', [entryId]);
  }

  Future<List<NgoaiNguProgressEntry?>> getAllByEntryId(
      List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'entryId', values);
  }

  List<NgoaiNguProgressEntry?> getAllByEntryIdSync(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'entryId', values);
  }

  Future<int> deleteAllByEntryId(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'entryId', values);
  }

  int deleteAllByEntryIdSync(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'entryId', values);
  }

  Future<Id> putByEntryId(NgoaiNguProgressEntry object) {
    return putByIndex(r'entryId', object);
  }

  Id putByEntryIdSync(NgoaiNguProgressEntry object, {bool saveLinks = true}) {
    return putByIndexSync(r'entryId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEntryId(List<NgoaiNguProgressEntry> objects) {
    return putAllByIndex(r'entryId', objects);
  }

  List<Id> putAllByEntryIdSync(List<NgoaiNguProgressEntry> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'entryId', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguProgressEntryQueryWhereSort
    on QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QWhere> {
  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguProgressEntryQueryWhere on QueryBuilder<NgoaiNguProgressEntry,
    NgoaiNguProgressEntry, QWhereClause> {
  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      entryIdEqualTo(String entryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'entryId',
        value: [entryId],
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      entryIdNotEqualTo(String entryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [],
              upper: [entryId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [entryId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [entryId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entryId',
              lower: [],
              upper: [entryId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      studentUuidEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentUuid',
        value: [studentUuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterWhereClause>
      studentUuidNotEqualTo(String? studentUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [studentUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentUuid',
              lower: [],
              upper: [studentUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguProgressEntryQueryFilter on QueryBuilder<
    NgoaiNguProgressEntry, NgoaiNguProgressEntry, QFilterCondition> {
  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
          QAfterFilterCondition>
      entryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
          QAfterFilterCondition>
      entryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> entryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entryId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> grammarScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> grammarScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> grammarScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> grammarScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grammarScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> hoursStudiedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hoursStudied',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> hoursStudiedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hoursStudied',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> hoursStudiedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hoursStudied',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> hoursStudiedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hoursStudied',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> listeningScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listeningScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> listeningScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'listeningScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> listeningScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'listeningScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> listeningScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'listeningScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> readingScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> readingScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> readingScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> readingScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> speakingScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speakingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> speakingScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speakingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> speakingScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speakingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> speakingScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speakingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidEqualTo(
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidGreaterThan(
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidLessThan(
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidBetween(
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidStartsWith(
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidEndsWith(
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

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
          QAfterFilterCondition>
      studentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
          QAfterFilterCondition>
      studentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> vocabScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vocabScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> vocabScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vocabScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> vocabScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vocabScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> vocabScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vocabScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> writingScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> writingScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'writingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> writingScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'writingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry,
      QAfterFilterCondition> writingScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'writingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension NgoaiNguProgressEntryQueryObject on QueryBuilder<
    NgoaiNguProgressEntry, NgoaiNguProgressEntry, QFilterCondition> {}

extension NgoaiNguProgressEntryQueryLinks on QueryBuilder<NgoaiNguProgressEntry,
    NgoaiNguProgressEntry, QFilterCondition> {}

extension NgoaiNguProgressEntryQuerySortBy
    on QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QSortBy> {
  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByGrammarScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByHoursStudied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursStudied', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByHoursStudiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursStudied', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByListeningScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByListeningScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByReadingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByReadingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortBySpeakingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortBySpeakingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByVocabScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByVocabScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByWritingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      sortByWritingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.desc);
    });
  }
}

extension NgoaiNguProgressEntryQuerySortThenBy
    on QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QSortThenBy> {
  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByGrammarScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByHoursStudied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursStudied', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByHoursStudiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursStudied', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByListeningScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByListeningScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listeningScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByReadingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByReadingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenBySpeakingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenBySpeakingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speakingScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByVocabScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByVocabScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByWritingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QAfterSortBy>
      thenByWritingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingScore', Sort.desc);
    });
  }
}

extension NgoaiNguProgressEntryQueryWhereDistinct
    on QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct> {
  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByEntryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grammarScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByHoursStudied() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hoursStudied');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByListeningScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listeningScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByReadingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readingScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctBySpeakingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speakingScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByVocabScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vocabScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, NgoaiNguProgressEntry, QDistinct>
      distinctByWritingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'writingScore');
    });
  }
}

extension NgoaiNguProgressEntryQueryProperty on QueryBuilder<
    NgoaiNguProgressEntry, NgoaiNguProgressEntry, QQueryProperty> {
  QueryBuilder<NgoaiNguProgressEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, String, QQueryOperations>
      entryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryId');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, double, QQueryOperations>
      grammarScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grammarScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, double, QQueryOperations>
      hoursStudiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hoursStudied');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, double, QQueryOperations>
      listeningScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listeningScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, double, QQueryOperations>
      readingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readingScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, double, QQueryOperations>
      speakingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speakingScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, double, QQueryOperations>
      vocabScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vocabScore');
    });
  }

  QueryBuilder<NgoaiNguProgressEntry, double, QQueryOperations>
      writingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'writingScore');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguSyncQueueItemCollection on Isar {
  IsarCollection<NgoaiNguSyncQueueItem> get ngoaiNguSyncQueueItems =>
      this.collection();
}

const NgoaiNguSyncQueueItemSchema = CollectionSchema(
  name: r'NgoaiNguSyncQueueItem',
  id: -3624979642721871738,
  properties: {
    r'entity': PropertySchema(
      id: 0,
      name: r'entity',
      type: IsarType.string,
    ),
    r'entityUuid': PropertySchema(
      id: 1,
      name: r'entityUuid',
      type: IsarType.string,
    ),
    r'operation': PropertySchema(
      id: 2,
      name: r'operation',
      type: IsarType.string,
    ),
    r'payloadJson': PropertySchema(
      id: 3,
      name: r'payloadJson',
      type: IsarType.string,
    ),
    r'retryCount': PropertySchema(
      id: 4,
      name: r'retryCount',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.string,
    ),
    r'syncId': PropertySchema(
      id: 6,
      name: r'syncId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _ngoaiNguSyncQueueItemEstimateSize,
  serialize: _ngoaiNguSyncQueueItemSerialize,
  deserialize: _ngoaiNguSyncQueueItemDeserialize,
  deserializeProp: _ngoaiNguSyncQueueItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'syncId': IndexSchema(
      id: 7538593479801827566,
      name: r'syncId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'syncId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguSyncQueueItemGetId,
  getLinks: _ngoaiNguSyncQueueItemGetLinks,
  attach: _ngoaiNguSyncQueueItemAttach,
  version: '3.1.0+1',
);

int _ngoaiNguSyncQueueItemEstimateSize(
  NgoaiNguSyncQueueItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entity.length * 3;
  bytesCount += 3 + object.entityUuid.length * 3;
  bytesCount += 3 + object.operation.length * 3;
  bytesCount += 3 + object.payloadJson.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.syncId.length * 3;
  return bytesCount;
}

void _ngoaiNguSyncQueueItemSerialize(
  NgoaiNguSyncQueueItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.entity);
  writer.writeString(offsets[1], object.entityUuid);
  writer.writeString(offsets[2], object.operation);
  writer.writeString(offsets[3], object.payloadJson);
  writer.writeLong(offsets[4], object.retryCount);
  writer.writeString(offsets[5], object.status);
  writer.writeString(offsets[6], object.syncId);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

NgoaiNguSyncQueueItem _ngoaiNguSyncQueueItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguSyncQueueItem();
  object.entity = reader.readString(offsets[0]);
  object.entityUuid = reader.readString(offsets[1]);
  object.id = id;
  object.operation = reader.readString(offsets[2]);
  object.payloadJson = reader.readString(offsets[3]);
  object.retryCount = reader.readLong(offsets[4]);
  object.status = reader.readString(offsets[5]);
  object.syncId = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _ngoaiNguSyncQueueItemDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguSyncQueueItemGetId(NgoaiNguSyncQueueItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguSyncQueueItemGetLinks(
    NgoaiNguSyncQueueItem object) {
  return [];
}

void _ngoaiNguSyncQueueItemAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguSyncQueueItem object) {
  object.id = id;
}

extension NgoaiNguSyncQueueItemByIndex
    on IsarCollection<NgoaiNguSyncQueueItem> {
  Future<NgoaiNguSyncQueueItem?> getBySyncId(String syncId) {
    return getByIndex(r'syncId', [syncId]);
  }

  NgoaiNguSyncQueueItem? getBySyncIdSync(String syncId) {
    return getByIndexSync(r'syncId', [syncId]);
  }

  Future<bool> deleteBySyncId(String syncId) {
    return deleteByIndex(r'syncId', [syncId]);
  }

  bool deleteBySyncIdSync(String syncId) {
    return deleteByIndexSync(r'syncId', [syncId]);
  }

  Future<List<NgoaiNguSyncQueueItem?>> getAllBySyncId(
      List<String> syncIdValues) {
    final values = syncIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'syncId', values);
  }

  List<NgoaiNguSyncQueueItem?> getAllBySyncIdSync(List<String> syncIdValues) {
    final values = syncIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'syncId', values);
  }

  Future<int> deleteAllBySyncId(List<String> syncIdValues) {
    final values = syncIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'syncId', values);
  }

  int deleteAllBySyncIdSync(List<String> syncIdValues) {
    final values = syncIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'syncId', values);
  }

  Future<Id> putBySyncId(NgoaiNguSyncQueueItem object) {
    return putByIndex(r'syncId', object);
  }

  Id putBySyncIdSync(NgoaiNguSyncQueueItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'syncId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySyncId(List<NgoaiNguSyncQueueItem> objects) {
    return putAllByIndex(r'syncId', objects);
  }

  List<Id> putAllBySyncIdSync(List<NgoaiNguSyncQueueItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'syncId', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguSyncQueueItemQueryWhereSort
    on QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QWhere> {
  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguSyncQueueItemQueryWhere on QueryBuilder<NgoaiNguSyncQueueItem,
    NgoaiNguSyncQueueItem, QWhereClause> {
  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhereClause>
      syncIdEqualTo(String syncId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncId',
        value: [syncId],
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterWhereClause>
      syncIdNotEqualTo(String syncId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncId',
              lower: [],
              upper: [syncId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncId',
              lower: [syncId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncId',
              lower: [syncId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncId',
              lower: [],
              upper: [syncId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NgoaiNguSyncQueueItemQueryFilter on QueryBuilder<
    NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QFilterCondition> {
  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
          QAfterFilterCondition>
      entityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
          QAfterFilterCondition>
      entityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entity',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entity',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> entityUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> operationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> operationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operation',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> payloadJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> payloadJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payloadJson',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
          QAfterFilterCondition>
      syncIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
          QAfterFilterCondition>
      syncIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> syncIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem,
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

extension NgoaiNguSyncQueueItemQueryObject on QueryBuilder<
    NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QFilterCondition> {}

extension NgoaiNguSyncQueueItemQueryLinks on QueryBuilder<NgoaiNguSyncQueueItem,
    NgoaiNguSyncQueueItem, QFilterCondition> {}

extension NgoaiNguSyncQueueItemQuerySortBy
    on QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QSortBy> {
  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByEntity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByEntityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByEntityUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByEntityUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortBySyncId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortBySyncIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NgoaiNguSyncQueueItemQuerySortThenBy
    on QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QSortThenBy> {
  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByEntity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByEntityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByEntityUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByEntityUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByOperation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByOperationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operation', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByPayloadJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByPayloadJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payloadJson', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenBySyncId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenBySyncIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NgoaiNguSyncQueueItemQueryWhereDistinct
    on QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct> {
  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctByEntity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctByEntityUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctByOperation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctByPayloadJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payloadJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctBySyncId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension NgoaiNguSyncQueueItemQueryProperty on QueryBuilder<
    NgoaiNguSyncQueueItem, NgoaiNguSyncQueueItem, QQueryProperty> {
  QueryBuilder<NgoaiNguSyncQueueItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, String, QQueryOperations>
      entityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entity');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, String, QQueryOperations>
      entityUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityUuid');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, String, QQueryOperations>
      operationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operation');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, String, QQueryOperations>
      payloadJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payloadJson');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, int, QQueryOperations>
      retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, String, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, String, QQueryOperations>
      syncIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncId');
    });
  }

  QueryBuilder<NgoaiNguSyncQueueItem, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguAuditLogCollection on Isar {
  IsarCollection<NgoaiNguAuditLog> get ngoaiNguAuditLogs => this.collection();
}

const NgoaiNguAuditLogSchema = CollectionSchema(
  name: r'NgoaiNguAuditLog',
  id: -5975525600290138833,
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
    r'detail': PropertySchema(
      id: 2,
      name: r'detail',
      type: IsarType.string,
    ),
    r'entity': PropertySchema(
      id: 3,
      name: r'entity',
      type: IsarType.string,
    ),
    r'entityId': PropertySchema(
      id: 4,
      name: r'entityId',
      type: IsarType.string,
    ),
    r'userUuid': PropertySchema(
      id: 5,
      name: r'userUuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguAuditLogEstimateSize,
  serialize: _ngoaiNguAuditLogSerialize,
  deserialize: _ngoaiNguAuditLogDeserialize,
  deserializeProp: _ngoaiNguAuditLogDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguAuditLogGetId,
  getLinks: _ngoaiNguAuditLogGetLinks,
  attach: _ngoaiNguAuditLogAttach,
  version: '3.1.0+1',
);

int _ngoaiNguAuditLogEstimateSize(
  NgoaiNguAuditLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.action.length * 3;
  bytesCount += 3 + object.detail.length * 3;
  bytesCount += 3 + object.entity.length * 3;
  bytesCount += 3 + object.entityId.length * 3;
  bytesCount += 3 + object.userUuid.length * 3;
  return bytesCount;
}

void _ngoaiNguAuditLogSerialize(
  NgoaiNguAuditLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.detail);
  writer.writeString(offsets[3], object.entity);
  writer.writeString(offsets[4], object.entityId);
  writer.writeString(offsets[5], object.userUuid);
}

NgoaiNguAuditLog _ngoaiNguAuditLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguAuditLog();
  object.action = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.detail = reader.readString(offsets[2]);
  object.entity = reader.readString(offsets[3]);
  object.entityId = reader.readString(offsets[4]);
  object.id = id;
  object.userUuid = reader.readString(offsets[5]);
  return object;
}

P _ngoaiNguAuditLogDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguAuditLogGetId(NgoaiNguAuditLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguAuditLogGetLinks(NgoaiNguAuditLog object) {
  return [];
}

void _ngoaiNguAuditLogAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguAuditLog object) {
  object.id = id;
}

extension NgoaiNguAuditLogQueryWhereSort
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QWhere> {
  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension NgoaiNguAuditLogQueryWhere
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QWhereClause> {
  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause> idBetween(
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NgoaiNguAuditLogQueryFilter
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QFilterCondition> {
  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionEqualTo(
    String value, {
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionGreaterThan(
    String value, {
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionLessThan(
    String value, {
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionStartsWith(
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionEndsWith(
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'action',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      detailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entity',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entity',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      entityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterFilterCondition>
      userUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userUuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguAuditLogQueryObject
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QFilterCondition> {}

extension NgoaiNguAuditLogQueryLinks
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QFilterCondition> {}

extension NgoaiNguAuditLogQuerySortBy
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QSortBy> {
  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByEntity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByEntityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      sortByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension NgoaiNguAuditLogQuerySortThenBy
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QSortThenBy> {
  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByEntity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByEntityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entity', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QAfterSortBy>
      thenByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension NgoaiNguAuditLogQueryWhereDistinct
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QDistinct> {
  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QDistinct> distinctByAction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QDistinct> distinctByDetail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QDistinct> distinctByEntity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QDistinct>
      distinctByEntityId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QDistinct>
      distinctByUserUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userUuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguAuditLogQueryProperty
    on QueryBuilder<NgoaiNguAuditLog, NgoaiNguAuditLog, QQueryProperty> {
  QueryBuilder<NgoaiNguAuditLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguAuditLog, String, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<NgoaiNguAuditLog, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguAuditLog, String, QQueryOperations> detailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detail');
    });
  }

  QueryBuilder<NgoaiNguAuditLog, String, QQueryOperations> entityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entity');
    });
  }

  QueryBuilder<NgoaiNguAuditLog, String, QQueryOperations> entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityId');
    });
  }

  QueryBuilder<NgoaiNguAuditLog, String, QQueryOperations> userUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userUuid');
    });
  }
}
