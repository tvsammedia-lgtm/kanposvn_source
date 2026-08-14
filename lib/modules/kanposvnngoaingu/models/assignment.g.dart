// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguAssignmentCollection on Isar {
  IsarCollection<NgoaiNguAssignment> get ngoaiNguAssignments =>
      this.collection();
}

const NgoaiNguAssignmentSchema = CollectionSchema(
  name: r'NgoaiNguAssignment',
  id: 1541008090300346131,
  properties: {
    r'attachmentUrl': PropertySchema(
      id: 0,
      name: r'attachmentUrl',
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
    r'classUuid': PropertySchema(
      id: 3,
      name: r'classUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 6,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 7,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'syncVersion': PropertySchema(
      id: 8,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'teacherUuid': PropertySchema(
      id: 9,
      name: r'teacherUuid',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 10,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 12,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguAssignmentEstimateSize,
  serialize: _ngoaiNguAssignmentSerialize,
  deserialize: _ngoaiNguAssignmentDeserialize,
  deserializeProp: _ngoaiNguAssignmentDeserializeProp,
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
  getId: _ngoaiNguAssignmentGetId,
  getLinks: _ngoaiNguAssignmentGetLinks,
  attach: _ngoaiNguAssignmentAttach,
  version: '3.1.0+1',
);

int _ngoaiNguAssignmentEstimateSize(
  NgoaiNguAssignment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attachmentUrl;
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
    final value = object.classUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
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
    final value = object.title;
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

void _ngoaiNguAssignmentSerialize(
  NgoaiNguAssignment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.attachmentUrl);
  writer.writeString(offsets[1], object.branchId);
  writer.writeString(offsets[2], object.centerId);
  writer.writeString(offsets[3], object.classUuid);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.description);
  writer.writeDateTime(offsets[6], object.dueDate);
  writer.writeBool(offsets[7], object.isDeleted);
  writer.writeLong(offsets[8], object.syncVersion);
  writer.writeString(offsets[9], object.teacherUuid);
  writer.writeString(offsets[10], object.title);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeString(offsets[12], object.uuid);
}

NgoaiNguAssignment _ngoaiNguAssignmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguAssignment();
  object.attachmentUrl = reader.readStringOrNull(offsets[0]);
  object.branchId = reader.readStringOrNull(offsets[1]);
  object.centerId = reader.readStringOrNull(offsets[2]);
  object.classUuid = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTimeOrNull(offsets[4]);
  object.description = reader.readStringOrNull(offsets[5]);
  object.dueDate = reader.readDateTimeOrNull(offsets[6]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[7]);
  object.syncVersion = reader.readLong(offsets[8]);
  object.teacherUuid = reader.readStringOrNull(offsets[9]);
  object.title = reader.readStringOrNull(offsets[10]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[11]);
  object.uuid = reader.readStringOrNull(offsets[12]);
  return object;
}

P _ngoaiNguAssignmentDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ngoaiNguAssignmentGetId(NgoaiNguAssignment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguAssignmentGetLinks(
    NgoaiNguAssignment object) {
  return [];
}

void _ngoaiNguAssignmentAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguAssignment object) {
  object.id = id;
}

extension NgoaiNguAssignmentByIndex on IsarCollection<NgoaiNguAssignment> {
  Future<NgoaiNguAssignment?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguAssignment? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguAssignment?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguAssignment?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguAssignment object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguAssignment object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguAssignment> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguAssignment> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguAssignmentQueryWhereSort
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QWhere> {
  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguAssignmentQueryWhere
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QWhereClause> {
  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterWhereClause>
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

extension NgoaiNguAssignmentQueryFilter
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QFilterCondition> {
  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      attachmentUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentUrl',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      attachmentUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentUrl',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      attachmentUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      attachmentUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      attachmentUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      attachmentUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      branchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      branchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'branchId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      branchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'branchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      branchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'branchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      branchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      branchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'branchId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      centerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      centerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'centerId',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      centerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'centerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      centerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'centerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      centerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      centerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'centerId',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      classUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      classUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'classUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      classUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      classUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      classUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      classUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      dueDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime? value, {
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      dueDateLessThan(
    DateTime? value, {
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      teacherUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teacherUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      teacherUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teacherUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      teacherUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teacherUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      teacherUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teacherUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      teacherUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      teacherUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teacherUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
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

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguAssignmentQueryObject
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QFilterCondition> {}

extension NgoaiNguAssignmentQueryLinks
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QFilterCondition> {}

extension NgoaiNguAssignmentQuerySortBy
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QSortBy> {
  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByAttachmentUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByAttachmentUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByTeacherUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByTeacherUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguAssignmentQuerySortThenBy
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QSortThenBy> {
  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByAttachmentUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByAttachmentUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByCenterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByCenterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerId', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByClassUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByClassUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByTeacherUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByTeacherUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguAssignmentQueryWhereDistinct
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct> {
  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByAttachmentUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByBranchId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByCenterId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByClassUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByTeacherUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teacherUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguAssignmentQueryProperty
    on QueryBuilder<NgoaiNguAssignment, NgoaiNguAssignment, QQueryProperty> {
  QueryBuilder<NgoaiNguAssignment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations>
      attachmentUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentUrl');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations>
      branchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchId');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations>
      centerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerId');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations>
      classUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classUuid');
    });
  }

  QueryBuilder<NgoaiNguAssignment, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<NgoaiNguAssignment, DateTime?, QQueryOperations>
      dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<NgoaiNguAssignment, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAssignment, int, QQueryOperations>
      syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations>
      teacherUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teacherUuid');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<NgoaiNguAssignment, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NgoaiNguAssignment, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguAssignmentSubmissionCollection on Isar {
  IsarCollection<NgoaiNguAssignmentSubmission>
      get ngoaiNguAssignmentSubmissions => this.collection();
}

const NgoaiNguAssignmentSubmissionSchema = CollectionSchema(
  name: r'NgoaiNguAssignmentSubmission',
  id: -4789443170732237287,
  properties: {
    r'assignmentUuid': PropertySchema(
      id: 0,
      name: r'assignmentUuid',
      type: IsarType.string,
    ),
    r'attachmentUrl': PropertySchema(
      id: 1,
      name: r'attachmentUrl',
      type: IsarType.string,
    ),
    r'gradedAt': PropertySchema(
      id: 2,
      name: r'gradedAt',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 3,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'score': PropertySchema(
      id: 4,
      name: r'score',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.byte,
      enumMap: _NgoaiNguAssignmentSubmissionstatusEnumValueMap,
    ),
    r'studentAnswer': PropertySchema(
      id: 6,
      name: r'studentAnswer',
      type: IsarType.string,
    ),
    r'studentUuid': PropertySchema(
      id: 7,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'submittedAt': PropertySchema(
      id: 8,
      name: r'submittedAt',
      type: IsarType.dateTime,
    ),
    r'syncVersion': PropertySchema(
      id: 9,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'teacherFeedback': PropertySchema(
      id: 10,
      name: r'teacherFeedback',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 11,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguAssignmentSubmissionEstimateSize,
  serialize: _ngoaiNguAssignmentSubmissionSerialize,
  deserialize: _ngoaiNguAssignmentSubmissionDeserialize,
  deserializeProp: _ngoaiNguAssignmentSubmissionDeserializeProp,
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
  getId: _ngoaiNguAssignmentSubmissionGetId,
  getLinks: _ngoaiNguAssignmentSubmissionGetLinks,
  attach: _ngoaiNguAssignmentSubmissionAttach,
  version: '3.1.0+1',
);

int _ngoaiNguAssignmentSubmissionEstimateSize(
  NgoaiNguAssignmentSubmission object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assignmentUuid;
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
    final value = object.studentAnswer;
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
    final value = object.teacherFeedback;
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

void _ngoaiNguAssignmentSubmissionSerialize(
  NgoaiNguAssignmentSubmission object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assignmentUuid);
  writer.writeString(offsets[1], object.attachmentUrl);
  writer.writeDateTime(offsets[2], object.gradedAt);
  writer.writeBool(offsets[3], object.isDeleted);
  writer.writeDouble(offsets[4], object.score);
  writer.writeByte(offsets[5], object.status.index);
  writer.writeString(offsets[6], object.studentAnswer);
  writer.writeString(offsets[7], object.studentUuid);
  writer.writeDateTime(offsets[8], object.submittedAt);
  writer.writeLong(offsets[9], object.syncVersion);
  writer.writeString(offsets[10], object.teacherFeedback);
  writer.writeString(offsets[11], object.uuid);
}

NgoaiNguAssignmentSubmission _ngoaiNguAssignmentSubmissionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguAssignmentSubmission();
  object.assignmentUuid = reader.readStringOrNull(offsets[0]);
  object.attachmentUrl = reader.readStringOrNull(offsets[1]);
  object.gradedAt = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[3]);
  object.score = reader.readDoubleOrNull(offsets[4]);
  object.status = _NgoaiNguAssignmentSubmissionstatusValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      SubmissionStatus.submitted;
  object.studentAnswer = reader.readStringOrNull(offsets[6]);
  object.studentUuid = reader.readStringOrNull(offsets[7]);
  object.submittedAt = reader.readDateTimeOrNull(offsets[8]);
  object.syncVersion = reader.readLong(offsets[9]);
  object.teacherFeedback = reader.readStringOrNull(offsets[10]);
  object.uuid = reader.readStringOrNull(offsets[11]);
  return object;
}

P _ngoaiNguAssignmentSubmissionDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (_NgoaiNguAssignmentSubmissionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SubmissionStatus.submitted) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguAssignmentSubmissionstatusEnumValueMap = {
  'submitted': 0,
  'graded': 1,
  'returned': 2,
  'late': 3,
};
const _NgoaiNguAssignmentSubmissionstatusValueEnumMap = {
  0: SubmissionStatus.submitted,
  1: SubmissionStatus.graded,
  2: SubmissionStatus.returned,
  3: SubmissionStatus.late,
};

Id _ngoaiNguAssignmentSubmissionGetId(NgoaiNguAssignmentSubmission object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguAssignmentSubmissionGetLinks(
    NgoaiNguAssignmentSubmission object) {
  return [];
}

void _ngoaiNguAssignmentSubmissionAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguAssignmentSubmission object) {
  object.id = id;
}

extension NgoaiNguAssignmentSubmissionByIndex
    on IsarCollection<NgoaiNguAssignmentSubmission> {
  Future<NgoaiNguAssignmentSubmission?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguAssignmentSubmission? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguAssignmentSubmission?>> getAllByUuid(
      List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguAssignmentSubmission?> getAllByUuidSync(
      List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguAssignmentSubmission object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguAssignmentSubmission object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguAssignmentSubmission> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguAssignmentSubmission> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguAssignmentSubmissionQueryWhereSort on QueryBuilder<
    NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission, QWhere> {
  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguAssignmentSubmissionQueryWhere on QueryBuilder<
    NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission, QWhereClause> {
  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhereClause> uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterWhereClause> uuidNotEqualTo(String? uuid) {
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

extension NgoaiNguAssignmentSubmissionQueryFilter on QueryBuilder<
    NgoaiNguAssignmentSubmission,
    NgoaiNguAssignmentSubmission,
    QFilterCondition> {
  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignmentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignmentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignmentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignmentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignmentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignmentUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assignmentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assignmentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      assignmentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignmentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      assignmentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignmentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignmentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> assignmentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignmentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentUrl',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentUrl',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlEqualTo(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlGreaterThan(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlLessThan(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlBetween(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlStartsWith(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlEndsWith(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      attachmentUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      attachmentUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> attachmentUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> gradedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gradedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> gradedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gradedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> gradedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gradedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> gradedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gradedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> gradedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gradedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> gradedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gradedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> scoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> scoreEqualTo(
    double? value, {
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> scoreGreaterThan(
    double? value, {
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> scoreLessThan(
    double? value, {
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> scoreBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> statusEqualTo(SubmissionStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> statusGreaterThan(
    SubmissionStatus value, {
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> statusLessThan(
    SubmissionStatus value, {
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> statusBetween(
    SubmissionStatus lower,
    SubmissionStatus upper, {
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentAnswer',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentAnswer',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'studentAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'studentAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      studentAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      studentAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> submittedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submittedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> submittedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submittedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> submittedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submittedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> submittedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submittedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> submittedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submittedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> submittedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submittedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> syncVersionGreaterThan(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> syncVersionLessThan(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> syncVersionBetween(
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teacherFeedback',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teacherFeedback',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teacherFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teacherFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teacherFeedback',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teacherFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teacherFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      teacherFeedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teacherFeedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
          QAfterFilterCondition>
      teacherFeedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teacherFeedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacherFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> teacherFeedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teacherFeedback',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
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

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension NgoaiNguAssignmentSubmissionQueryObject on QueryBuilder<
    NgoaiNguAssignmentSubmission,
    NgoaiNguAssignmentSubmission,
    QFilterCondition> {}

extension NgoaiNguAssignmentSubmissionQueryLinks on QueryBuilder<
    NgoaiNguAssignmentSubmission,
    NgoaiNguAssignmentSubmission,
    QFilterCondition> {}

extension NgoaiNguAssignmentSubmissionQuerySortBy on QueryBuilder<
    NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission, QSortBy> {
  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByAssignmentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignmentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByAssignmentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignmentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByAttachmentUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByAttachmentUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByGradedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByGradedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByStudentAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentAnswer', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByStudentAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentAnswer', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByTeacherFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherFeedback', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByTeacherFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherFeedback', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguAssignmentSubmissionQuerySortThenBy on QueryBuilder<
    NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission, QSortThenBy> {
  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByAssignmentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignmentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByAssignmentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignmentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByAttachmentUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByAttachmentUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentUrl', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByGradedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByGradedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByStudentAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentAnswer', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByStudentAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentAnswer', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenBySubmittedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByTeacherFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherFeedback', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByTeacherFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacherFeedback', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension NgoaiNguAssignmentSubmissionQueryWhereDistinct on QueryBuilder<
    NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission, QDistinct> {
  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByAssignmentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignmentUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByAttachmentUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByGradedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gradedAt');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByStudentAnswer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentAnswer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctBySubmittedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submittedAt');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByTeacherFeedback({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teacherFeedback',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, NgoaiNguAssignmentSubmission,
      QDistinct> distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguAssignmentSubmissionQueryProperty on QueryBuilder<
    NgoaiNguAssignmentSubmission,
    NgoaiNguAssignmentSubmission,
    QQueryProperty> {
  QueryBuilder<NgoaiNguAssignmentSubmission, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, String?, QQueryOperations>
      assignmentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignmentUuid');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, String?, QQueryOperations>
      attachmentUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentUrl');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, DateTime?, QQueryOperations>
      gradedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gradedAt');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, bool, QQueryOperations>
      isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, double?, QQueryOperations>
      scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, SubmissionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, String?, QQueryOperations>
      studentAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentAnswer');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, DateTime?, QQueryOperations>
      submittedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submittedAt');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, int, QQueryOperations>
      syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, String?, QQueryOperations>
      teacherFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teacherFeedback');
    });
  }

  QueryBuilder<NgoaiNguAssignmentSubmission, String?, QQueryOperations>
      uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
