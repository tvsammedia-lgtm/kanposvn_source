// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhProjectCollection on Isar {
  IsarCollection<CongTrinhProject> get congTrinhProjects => this.collection();
}

const CongTrinhProjectSchema = CollectionSchema(
  name: r'CongTrinhProject',
  id: 4794088202432476682,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'buildingGrade': PropertySchema(
      id: 1,
      name: r'buildingGrade',
      type: IsarType.string,
    ),
    r'constructionArea': PropertySchema(
      id: 2,
      name: r'constructionArea',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerName': PropertySchema(
      id: 4,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 5,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 6,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 7,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'district': PropertySchema(
      id: 8,
      name: r'district',
      type: IsarType.string,
    ),
    r'expectedEndDate': PropertySchema(
      id: 9,
      name: r'expectedEndDate',
      type: IsarType.dateTime,
    ),
    r'finishLevel': PropertySchema(
      id: 10,
      name: r'finishLevel',
      type: IsarType.string,
    ),
    r'foundationType': PropertySchema(
      id: 11,
      name: r'foundationType',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 12,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 13,
      name: r'notes',
      type: IsarType.string,
    ),
    r'numberOfFloors': PropertySchema(
      id: 14,
      name: r'numberOfFloors',
      type: IsarType.long,
    ),
    r'projectCode': PropertySchema(
      id: 15,
      name: r'projectCode',
      type: IsarType.string,
    ),
    r'projectId': PropertySchema(
      id: 16,
      name: r'projectId',
      type: IsarType.string,
    ),
    r'projectName': PropertySchema(
      id: 17,
      name: r'projectName',
      type: IsarType.string,
    ),
    r'province': PropertySchema(
      id: 18,
      name: r'province',
      type: IsarType.string,
    ),
    r'roofArea': PropertySchema(
      id: 19,
      name: r'roofArea',
      type: IsarType.double,
    ),
    r'startDate': PropertySchema(
      id: 20,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'structureType': PropertySchema(
      id: 21,
      name: r'structureType',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 22,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 23,
      name: r'version',
      type: IsarType.long,
    ),
    r'ward': PropertySchema(
      id: 24,
      name: r'ward',
      type: IsarType.string,
    )
  },
  estimateSize: _congTrinhProjectEstimateSize,
  serialize: _congTrinhProjectSerialize,
  deserialize: _congTrinhProjectDeserialize,
  deserializeProp: _congTrinhProjectDeserializeProp,
  idName: r'id',
  indexes: {
    r'projectId': IndexSchema(
      id: 3305656282123791113,
      name: r'projectId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'projectId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhProjectGetId,
  getLinks: _congTrinhProjectGetLinks,
  attach: _congTrinhProjectAttach,
  version: '3.1.0+1',
);

int _congTrinhProjectEstimateSize(
  CongTrinhProject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.buildingGrade.length * 3;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.customerPhone.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.district.length * 3;
  bytesCount += 3 + object.finishLevel.length * 3;
  bytesCount += 3 + object.foundationType.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.projectCode.length * 3;
  bytesCount += 3 + object.projectId.length * 3;
  bytesCount += 3 + object.projectName.length * 3;
  bytesCount += 3 + object.province.length * 3;
  bytesCount += 3 + object.structureType.length * 3;
  bytesCount += 3 + object.ward.length * 3;
  return bytesCount;
}

void _congTrinhProjectSerialize(
  CongTrinhProject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.buildingGrade);
  writer.writeDouble(offsets[2], object.constructionArea);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.customerName);
  writer.writeString(offsets[5], object.customerPhone);
  writer.writeDateTime(offsets[6], object.deletedAt);
  writer.writeString(offsets[7], object.deviceId);
  writer.writeString(offsets[8], object.district);
  writer.writeDateTime(offsets[9], object.expectedEndDate);
  writer.writeString(offsets[10], object.finishLevel);
  writer.writeString(offsets[11], object.foundationType);
  writer.writeBool(offsets[12], object.isSynced);
  writer.writeString(offsets[13], object.notes);
  writer.writeLong(offsets[14], object.numberOfFloors);
  writer.writeString(offsets[15], object.projectCode);
  writer.writeString(offsets[16], object.projectId);
  writer.writeString(offsets[17], object.projectName);
  writer.writeString(offsets[18], object.province);
  writer.writeDouble(offsets[19], object.roofArea);
  writer.writeDateTime(offsets[20], object.startDate);
  writer.writeString(offsets[21], object.structureType);
  writer.writeDateTime(offsets[22], object.updatedAt);
  writer.writeLong(offsets[23], object.version);
  writer.writeString(offsets[24], object.ward);
}

CongTrinhProject _congTrinhProjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhProject();
  object.address = reader.readString(offsets[0]);
  object.buildingGrade = reader.readString(offsets[1]);
  object.constructionArea = reader.readDouble(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.customerName = reader.readString(offsets[4]);
  object.customerPhone = reader.readString(offsets[5]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[6]);
  object.deviceId = reader.readString(offsets[7]);
  object.district = reader.readString(offsets[8]);
  object.expectedEndDate = reader.readDateTimeOrNull(offsets[9]);
  object.finishLevel = reader.readString(offsets[10]);
  object.foundationType = reader.readString(offsets[11]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[12]);
  object.notes = reader.readString(offsets[13]);
  object.numberOfFloors = reader.readLong(offsets[14]);
  object.projectCode = reader.readString(offsets[15]);
  object.projectId = reader.readString(offsets[16]);
  object.projectName = reader.readString(offsets[17]);
  object.province = reader.readString(offsets[18]);
  object.roofArea = reader.readDouble(offsets[19]);
  object.startDate = reader.readDateTimeOrNull(offsets[20]);
  object.structureType = reader.readString(offsets[21]);
  object.updatedAt = reader.readDateTime(offsets[22]);
  object.version = reader.readLong(offsets[23]);
  object.ward = reader.readString(offsets[24]);
  return object;
}

P _congTrinhProjectDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readDateTime(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhProjectGetId(CongTrinhProject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhProjectGetLinks(CongTrinhProject object) {
  return [];
}

void _congTrinhProjectAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhProject object) {
  object.id = id;
}

extension CongTrinhProjectByIndex on IsarCollection<CongTrinhProject> {
  Future<CongTrinhProject?> getByProjectId(String projectId) {
    return getByIndex(r'projectId', [projectId]);
  }

  CongTrinhProject? getByProjectIdSync(String projectId) {
    return getByIndexSync(r'projectId', [projectId]);
  }

  Future<bool> deleteByProjectId(String projectId) {
    return deleteByIndex(r'projectId', [projectId]);
  }

  bool deleteByProjectIdSync(String projectId) {
    return deleteByIndexSync(r'projectId', [projectId]);
  }

  Future<List<CongTrinhProject?>> getAllByProjectId(
      List<String> projectIdValues) {
    final values = projectIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'projectId', values);
  }

  List<CongTrinhProject?> getAllByProjectIdSync(List<String> projectIdValues) {
    final values = projectIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'projectId', values);
  }

  Future<int> deleteAllByProjectId(List<String> projectIdValues) {
    final values = projectIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'projectId', values);
  }

  int deleteAllByProjectIdSync(List<String> projectIdValues) {
    final values = projectIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'projectId', values);
  }

  Future<Id> putByProjectId(CongTrinhProject object) {
    return putByIndex(r'projectId', object);
  }

  Id putByProjectIdSync(CongTrinhProject object, {bool saveLinks = true}) {
    return putByIndexSync(r'projectId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByProjectId(List<CongTrinhProject> objects) {
    return putAllByIndex(r'projectId', objects);
  }

  List<Id> putAllByProjectIdSync(List<CongTrinhProject> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'projectId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhProjectQueryWhereSort
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QWhere> {
  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhProjectQueryWhere
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QWhereClause> {
  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhereClause>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhereClause> idBetween(
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhereClause>
      projectIdEqualTo(String projectId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'projectId',
        value: [projectId],
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterWhereClause>
      projectIdNotEqualTo(String projectId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'projectId',
              lower: [],
              upper: [projectId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'projectId',
              lower: [projectId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'projectId',
              lower: [projectId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'projectId',
              lower: [],
              upper: [projectId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhProjectQueryFilter
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QFilterCondition> {
  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressEqualTo(
    String value, {
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressGreaterThan(
    String value, {
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressLessThan(
    String value, {
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressBetween(
    String lower,
    String upper, {
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buildingGrade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'buildingGrade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'buildingGrade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      buildingGradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'buildingGrade',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      constructionAreaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'constructionArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      constructionAreaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'constructionArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      constructionAreaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'constructionArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      constructionAreaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'constructionArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      expectedEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedEndDate',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      expectedEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedEndDate',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      expectedEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      expectedEndDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      expectedEndDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      expectedEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedEndDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finishLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'finishLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'finishLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      finishLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'finishLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foundationType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foundationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foundationType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foundationType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      foundationTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foundationType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      numberOfFloorsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberOfFloors',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      numberOfFloorsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberOfFloors',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      numberOfFloorsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberOfFloors',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      numberOfFloorsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberOfFloors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectName',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      projectNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectName',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'province',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'province',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      provinceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      roofAreaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roofArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      roofAreaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roofArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      roofAreaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roofArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      roofAreaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roofArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'structureType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'structureType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'structureType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structureType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      structureTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'structureType',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      updatedAtBetween(
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

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ward',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ward',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ward',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterFilterCondition>
      wardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ward',
        value: '',
      ));
    });
  }
}

extension CongTrinhProjectQueryObject
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QFilterCondition> {}

extension CongTrinhProjectQueryLinks
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QFilterCondition> {}

extension CongTrinhProjectQuerySortBy
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QSortBy> {
  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByBuildingGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByBuildingGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByConstructionArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionArea', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByConstructionAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionArea', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByExpectedEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedEndDate', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByExpectedEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedEndDate', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByFinishLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByFinishLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByFoundationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByFoundationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByNumberOfFloors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfFloors', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByNumberOfFloorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfFloors', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByRoofArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roofArea', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByRoofAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roofArea', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByStructureType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByStructureTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy> sortByWard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ward', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      sortByWardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ward', Sort.desc);
    });
  }
}

extension CongTrinhProjectQuerySortThenBy
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QSortThenBy> {
  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByBuildingGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByBuildingGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingGrade', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByConstructionArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionArea', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByConstructionAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constructionArea', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByExpectedEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedEndDate', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByExpectedEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedEndDate', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByFinishLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByFinishLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finishLevel', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByFoundationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByFoundationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foundationType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByNumberOfFloors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfFloors', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByNumberOfFloorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfFloors', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByRoofArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roofArea', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByRoofAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roofArea', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByStructureType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByStructureTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureType', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy> thenByWard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ward', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QAfterSortBy>
      thenByWardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ward', Sort.desc);
    });
  }
}

extension CongTrinhProjectQueryWhereDistinct
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct> {
  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByBuildingGrade({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildingGrade',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByConstructionArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'constructionArea');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByCustomerPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByDistrict({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByExpectedEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedEndDate');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByFinishLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finishLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByFoundationType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foundationType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByNumberOfFloors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberOfFloors');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByProjectCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByProjectId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByProjectName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByProvince({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'province', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByRoofArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roofArea');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByStructureType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'structureType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<CongTrinhProject, CongTrinhProject, QDistinct> distinctByWard(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ward', caseSensitive: caseSensitive);
    });
  }
}

extension CongTrinhProjectQueryProperty
    on QueryBuilder<CongTrinhProject, CongTrinhProject, QQueryProperty> {
  QueryBuilder<CongTrinhProject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      buildingGradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildingGrade');
    });
  }

  QueryBuilder<CongTrinhProject, double, QQueryOperations>
      constructionAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'constructionArea');
    });
  }

  QueryBuilder<CongTrinhProject, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<CongTrinhProject, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations> districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'district');
    });
  }

  QueryBuilder<CongTrinhProject, DateTime?, QQueryOperations>
      expectedEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedEndDate');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      finishLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finishLevel');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      foundationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foundationType');
    });
  }

  QueryBuilder<CongTrinhProject, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<CongTrinhProject, int, QQueryOperations>
      numberOfFloorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberOfFloors');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      projectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectCode');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations> projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectId');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      projectNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectName');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations> provinceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'province');
    });
  }

  QueryBuilder<CongTrinhProject, double, QQueryOperations> roofAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roofArea');
    });
  }

  QueryBuilder<CongTrinhProject, DateTime?, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations>
      structureTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'structureType');
    });
  }

  QueryBuilder<CongTrinhProject, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhProject, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<CongTrinhProject, String, QQueryOperations> wardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ward');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhEstimateCollection on Isar {
  IsarCollection<CongTrinhEstimate> get congTrinhEstimates => this.collection();
}

const CongTrinhEstimateSchema = CollectionSchema(
  name: r'CongTrinhEstimate',
  id: -3825755688214060468,
  properties: {
    r'area': PropertySchema(
      id: 0,
      name: r'area',
      type: IsarType.double,
    ),
    r'contingency': PropertySchema(
      id: 1,
      name: r'contingency',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 3,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 4,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'estimateCode': PropertySchema(
      id: 5,
      name: r'estimateCode',
      type: IsarType.string,
    ),
    r'estimateId': PropertySchema(
      id: 6,
      name: r'estimateId',
      type: IsarType.string,
    ),
    r'estimateVersion': PropertySchema(
      id: 7,
      name: r'estimateVersion',
      type: IsarType.long,
    ),
    r'grandTotal': PropertySchema(
      id: 8,
      name: r'grandTotal',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 9,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'projectId': PropertySchema(
      id: 10,
      name: r'projectId',
      type: IsarType.string,
    ),
    r'subtotal': PropertySchema(
      id: 11,
      name: r'subtotal',
      type: IsarType.double,
    ),
    r'totalLabor': PropertySchema(
      id: 12,
      name: r'totalLabor',
      type: IsarType.double,
    ),
    r'totalMaterial': PropertySchema(
      id: 13,
      name: r'totalMaterial',
      type: IsarType.double,
    ),
    r'totalOther': PropertySchema(
      id: 14,
      name: r'totalOther',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vat': PropertySchema(
      id: 16,
      name: r'vat',
      type: IsarType.double,
    ),
    r'version': PropertySchema(
      id: 17,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _congTrinhEstimateEstimateSize,
  serialize: _congTrinhEstimateSerialize,
  deserialize: _congTrinhEstimateDeserialize,
  deserializeProp: _congTrinhEstimateDeserializeProp,
  idName: r'id',
  indexes: {
    r'estimateId': IndexSchema(
      id: -3078338057966701889,
      name: r'estimateId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'estimateId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhEstimateGetId,
  getLinks: _congTrinhEstimateGetLinks,
  attach: _congTrinhEstimateAttach,
  version: '3.1.0+1',
);

int _congTrinhEstimateEstimateSize(
  CongTrinhEstimate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.estimateCode.length * 3;
  bytesCount += 3 + object.estimateId.length * 3;
  bytesCount += 3 + object.projectId.length * 3;
  return bytesCount;
}

void _congTrinhEstimateSerialize(
  CongTrinhEstimate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.area);
  writer.writeDouble(offsets[1], object.contingency);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.deletedAt);
  writer.writeString(offsets[4], object.deviceId);
  writer.writeString(offsets[5], object.estimateCode);
  writer.writeString(offsets[6], object.estimateId);
  writer.writeLong(offsets[7], object.estimateVersion);
  writer.writeDouble(offsets[8], object.grandTotal);
  writer.writeBool(offsets[9], object.isSynced);
  writer.writeString(offsets[10], object.projectId);
  writer.writeDouble(offsets[11], object.subtotal);
  writer.writeDouble(offsets[12], object.totalLabor);
  writer.writeDouble(offsets[13], object.totalMaterial);
  writer.writeDouble(offsets[14], object.totalOther);
  writer.writeDateTime(offsets[15], object.updatedAt);
  writer.writeDouble(offsets[16], object.vat);
  writer.writeLong(offsets[17], object.version);
}

CongTrinhEstimate _congTrinhEstimateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhEstimate();
  object.area = reader.readDouble(offsets[0]);
  object.contingency = reader.readDouble(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.deviceId = reader.readString(offsets[4]);
  object.estimateCode = reader.readString(offsets[5]);
  object.estimateId = reader.readString(offsets[6]);
  object.estimateVersion = reader.readLong(offsets[7]);
  object.grandTotal = reader.readDouble(offsets[8]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[9]);
  object.projectId = reader.readString(offsets[10]);
  object.subtotal = reader.readDouble(offsets[11]);
  object.totalLabor = reader.readDouble(offsets[12]);
  object.totalMaterial = reader.readDouble(offsets[13]);
  object.totalOther = reader.readDouble(offsets[14]);
  object.updatedAt = reader.readDateTime(offsets[15]);
  object.vat = reader.readDouble(offsets[16]);
  object.version = reader.readLong(offsets[17]);
  return object;
}

P _congTrinhEstimateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhEstimateGetId(CongTrinhEstimate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhEstimateGetLinks(
    CongTrinhEstimate object) {
  return [];
}

void _congTrinhEstimateAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhEstimate object) {
  object.id = id;
}

extension CongTrinhEstimateByIndex on IsarCollection<CongTrinhEstimate> {
  Future<CongTrinhEstimate?> getByEstimateId(String estimateId) {
    return getByIndex(r'estimateId', [estimateId]);
  }

  CongTrinhEstimate? getByEstimateIdSync(String estimateId) {
    return getByIndexSync(r'estimateId', [estimateId]);
  }

  Future<bool> deleteByEstimateId(String estimateId) {
    return deleteByIndex(r'estimateId', [estimateId]);
  }

  bool deleteByEstimateIdSync(String estimateId) {
    return deleteByIndexSync(r'estimateId', [estimateId]);
  }

  Future<List<CongTrinhEstimate?>> getAllByEstimateId(
      List<String> estimateIdValues) {
    final values = estimateIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'estimateId', values);
  }

  List<CongTrinhEstimate?> getAllByEstimateIdSync(
      List<String> estimateIdValues) {
    final values = estimateIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'estimateId', values);
  }

  Future<int> deleteAllByEstimateId(List<String> estimateIdValues) {
    final values = estimateIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'estimateId', values);
  }

  int deleteAllByEstimateIdSync(List<String> estimateIdValues) {
    final values = estimateIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'estimateId', values);
  }

  Future<Id> putByEstimateId(CongTrinhEstimate object) {
    return putByIndex(r'estimateId', object);
  }

  Id putByEstimateIdSync(CongTrinhEstimate object, {bool saveLinks = true}) {
    return putByIndexSync(r'estimateId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEstimateId(List<CongTrinhEstimate> objects) {
    return putAllByIndex(r'estimateId', objects);
  }

  List<Id> putAllByEstimateIdSync(List<CongTrinhEstimate> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'estimateId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhEstimateQueryWhereSort
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QWhere> {
  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhEstimateQueryWhere
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QWhereClause> {
  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhereClause>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhereClause>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhereClause>
      estimateIdEqualTo(String estimateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'estimateId',
        value: [estimateId],
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterWhereClause>
      estimateIdNotEqualTo(String estimateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateId',
              lower: [],
              upper: [estimateId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateId',
              lower: [estimateId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateId',
              lower: [estimateId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateId',
              lower: [],
              upper: [estimateId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhEstimateQueryFilter
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QFilterCondition> {
  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      areaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'area',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      areaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'area',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      areaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'area',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      areaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'area',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      contingencyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contingency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      contingencyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contingency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      contingencyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contingency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      contingencyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contingency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimateCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estimateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estimateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estimateCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estimateCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estimateCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estimateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estimateId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimateVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimateVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      estimateVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimateVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      grandTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grandTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      grandTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grandTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      grandTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grandTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      grandTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grandTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      projectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      subtotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      subtotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      subtotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      subtotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalLaborEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalLabor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalLaborGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalLabor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalLaborLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalLabor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalLaborBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalLabor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalMaterialEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalMaterial',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalMaterialGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalMaterial',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalMaterialLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalMaterial',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalMaterialBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalMaterial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalOtherEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalOther',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalOtherGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalOther',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalOtherLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalOther',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      totalOtherBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalOther',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      updatedAtBetween(
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

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      vatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      vatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      vatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      vatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CongTrinhEstimateQueryObject
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QFilterCondition> {}

extension CongTrinhEstimateQueryLinks
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QFilterCondition> {}

extension CongTrinhEstimateQuerySortBy
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QSortBy> {
  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByContingency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contingency', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByContingencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contingency', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByEstimateCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateCode', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByEstimateCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateCode', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByEstimateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByEstimateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByEstimateVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateVersion', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByEstimateVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateVersion', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByGrandTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByGrandTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByTotalLabor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLabor', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByTotalLaborDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLabor', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByTotalMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMaterial', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByTotalMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMaterial', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByTotalOther() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOther', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByTotalOtherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOther', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy> sortByVat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vat', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByVatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vat', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhEstimateQuerySortThenBy
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QSortThenBy> {
  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'area', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByContingency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contingency', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByContingencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contingency', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByEstimateCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateCode', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByEstimateCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateCode', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByEstimateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByEstimateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByEstimateVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateVersion', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByEstimateVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateVersion', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByGrandTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByGrandTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grandTotal', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByTotalLabor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLabor', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByTotalLaborDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLabor', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByTotalMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMaterial', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByTotalMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMaterial', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByTotalOther() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOther', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByTotalOtherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalOther', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy> thenByVat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vat', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByVatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vat', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CongTrinhEstimateQueryWhereDistinct
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct> {
  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'area');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByContingency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contingency');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByEstimateCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimateCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByEstimateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByEstimateVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimateVersion');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByGrandTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grandTotal');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByProjectId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtotal');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByTotalLabor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalLabor');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByTotalMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMaterial');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByTotalOther() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalOther');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByVat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vat');
    });
  }

  QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CongTrinhEstimateQueryProperty
    on QueryBuilder<CongTrinhEstimate, CongTrinhEstimate, QQueryProperty> {
  QueryBuilder<CongTrinhEstimate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations> areaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'area');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations>
      contingencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contingency');
    });
  }

  QueryBuilder<CongTrinhEstimate, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhEstimate, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhEstimate, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhEstimate, String, QQueryOperations>
      estimateCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimateCode');
    });
  }

  QueryBuilder<CongTrinhEstimate, String, QQueryOperations>
      estimateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimateId');
    });
  }

  QueryBuilder<CongTrinhEstimate, int, QQueryOperations>
      estimateVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimateVersion');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations>
      grandTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grandTotal');
    });
  }

  QueryBuilder<CongTrinhEstimate, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhEstimate, String, QQueryOperations>
      projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectId');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations> subtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtotal');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations>
      totalLaborProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalLabor');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations>
      totalMaterialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMaterial');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations>
      totalOtherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalOther');
    });
  }

  QueryBuilder<CongTrinhEstimate, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhEstimate, double, QQueryOperations> vatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vat');
    });
  }

  QueryBuilder<CongTrinhEstimate, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCongTrinhEstimateItemCollection on Isar {
  IsarCollection<CongTrinhEstimateItem> get congTrinhEstimateItems =>
      this.collection();
}

const CongTrinhEstimateItemSchema = CollectionSchema(
  name: r'CongTrinhEstimateItem',
  id: 464581950293790950,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'calculationMode': PropertySchema(
      id: 1,
      name: r'calculationMode',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 4,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 6,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'estimateId': PropertySchema(
      id: 7,
      name: r'estimateId',
      type: IsarType.string,
    ),
    r'estimateItemId': PropertySchema(
      id: 8,
      name: r'estimateItemId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 9,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'laborTypeId': PropertySchema(
      id: 10,
      name: r'laborTypeId',
      type: IsarType.string,
    ),
    r'materialId': PropertySchema(
      id: 11,
      name: r'materialId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 12,
      name: r'notes',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 13,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 14,
      name: r'unit',
      type: IsarType.string,
    ),
    r'unitPrice': PropertySchema(
      id: 15,
      name: r'unitPrice',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 17,
      name: r'version',
      type: IsarType.long,
    ),
    r'wastePercent': PropertySchema(
      id: 18,
      name: r'wastePercent',
      type: IsarType.double,
    )
  },
  estimateSize: _congTrinhEstimateItemEstimateSize,
  serialize: _congTrinhEstimateItemSerialize,
  deserialize: _congTrinhEstimateItemDeserialize,
  deserializeProp: _congTrinhEstimateItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'estimateItemId': IndexSchema(
      id: 5496263295078023867,
      name: r'estimateItemId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'estimateItemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _congTrinhEstimateItemGetId,
  getLinks: _congTrinhEstimateItemGetLinks,
  attach: _congTrinhEstimateItemAttach,
  version: '3.1.0+1',
);

int _congTrinhEstimateItemEstimateSize(
  CongTrinhEstimateItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.calculationMode.length * 3;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.estimateId.length * 3;
  bytesCount += 3 + object.estimateItemId.length * 3;
  {
    final value = object.laborTypeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.materialId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _congTrinhEstimateItemSerialize(
  CongTrinhEstimateItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.calculationMode);
  writer.writeString(offsets[2], object.category);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeString(offsets[5], object.description);
  writer.writeString(offsets[6], object.deviceId);
  writer.writeString(offsets[7], object.estimateId);
  writer.writeString(offsets[8], object.estimateItemId);
  writer.writeBool(offsets[9], object.isSynced);
  writer.writeString(offsets[10], object.laborTypeId);
  writer.writeString(offsets[11], object.materialId);
  writer.writeString(offsets[12], object.notes);
  writer.writeDouble(offsets[13], object.quantity);
  writer.writeString(offsets[14], object.unit);
  writer.writeDouble(offsets[15], object.unitPrice);
  writer.writeDateTime(offsets[16], object.updatedAt);
  writer.writeLong(offsets[17], object.version);
  writer.writeDouble(offsets[18], object.wastePercent);
}

CongTrinhEstimateItem _congTrinhEstimateItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CongTrinhEstimateItem();
  object.amount = reader.readDouble(offsets[0]);
  object.calculationMode = reader.readString(offsets[1]);
  object.category = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.description = reader.readString(offsets[5]);
  object.deviceId = reader.readString(offsets[6]);
  object.estimateId = reader.readString(offsets[7]);
  object.estimateItemId = reader.readString(offsets[8]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[9]);
  object.laborTypeId = reader.readStringOrNull(offsets[10]);
  object.materialId = reader.readStringOrNull(offsets[11]);
  object.notes = reader.readString(offsets[12]);
  object.quantity = reader.readDouble(offsets[13]);
  object.unit = reader.readString(offsets[14]);
  object.unitPrice = reader.readDouble(offsets[15]);
  object.updatedAt = reader.readDateTime(offsets[16]);
  object.version = reader.readLong(offsets[17]);
  object.wastePercent = reader.readDouble(offsets[18]);
  return object;
}

P _congTrinhEstimateItemDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _congTrinhEstimateItemGetId(CongTrinhEstimateItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _congTrinhEstimateItemGetLinks(
    CongTrinhEstimateItem object) {
  return [];
}

void _congTrinhEstimateItemAttach(
    IsarCollection<dynamic> col, Id id, CongTrinhEstimateItem object) {
  object.id = id;
}

extension CongTrinhEstimateItemByIndex
    on IsarCollection<CongTrinhEstimateItem> {
  Future<CongTrinhEstimateItem?> getByEstimateItemId(String estimateItemId) {
    return getByIndex(r'estimateItemId', [estimateItemId]);
  }

  CongTrinhEstimateItem? getByEstimateItemIdSync(String estimateItemId) {
    return getByIndexSync(r'estimateItemId', [estimateItemId]);
  }

  Future<bool> deleteByEstimateItemId(String estimateItemId) {
    return deleteByIndex(r'estimateItemId', [estimateItemId]);
  }

  bool deleteByEstimateItemIdSync(String estimateItemId) {
    return deleteByIndexSync(r'estimateItemId', [estimateItemId]);
  }

  Future<List<CongTrinhEstimateItem?>> getAllByEstimateItemId(
      List<String> estimateItemIdValues) {
    final values = estimateItemIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'estimateItemId', values);
  }

  List<CongTrinhEstimateItem?> getAllByEstimateItemIdSync(
      List<String> estimateItemIdValues) {
    final values = estimateItemIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'estimateItemId', values);
  }

  Future<int> deleteAllByEstimateItemId(List<String> estimateItemIdValues) {
    final values = estimateItemIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'estimateItemId', values);
  }

  int deleteAllByEstimateItemIdSync(List<String> estimateItemIdValues) {
    final values = estimateItemIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'estimateItemId', values);
  }

  Future<Id> putByEstimateItemId(CongTrinhEstimateItem object) {
    return putByIndex(r'estimateItemId', object);
  }

  Id putByEstimateItemIdSync(CongTrinhEstimateItem object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'estimateItemId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEstimateItemId(List<CongTrinhEstimateItem> objects) {
    return putAllByIndex(r'estimateItemId', objects);
  }

  List<Id> putAllByEstimateItemIdSync(List<CongTrinhEstimateItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'estimateItemId', objects, saveLinks: saveLinks);
  }
}

extension CongTrinhEstimateItemQueryWhereSort
    on QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QWhere> {
  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CongTrinhEstimateItemQueryWhere on QueryBuilder<CongTrinhEstimateItem,
    CongTrinhEstimateItem, QWhereClause> {
  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhereClause>
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhereClause>
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhereClause>
      estimateItemIdEqualTo(String estimateItemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'estimateItemId',
        value: [estimateItemId],
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterWhereClause>
      estimateItemIdNotEqualTo(String estimateItemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateItemId',
              lower: [],
              upper: [estimateItemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateItemId',
              lower: [estimateItemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateItemId',
              lower: [estimateItemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estimateItemId',
              lower: [],
              upper: [estimateItemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CongTrinhEstimateItemQueryFilter on QueryBuilder<
    CongTrinhEstimateItem, CongTrinhEstimateItem, QFilterCondition> {
  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculationMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calculationMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calculationMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calculationMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calculationMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calculationMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      calculationModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calculationMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      calculationModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calculationMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculationMode',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> calculationModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calculationMode',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionEqualTo(
    String value, {
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionGreaterThan(
    String value, {
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionLessThan(
    String value, {
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      estimateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estimateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      estimateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estimateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estimateId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimateItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimateItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimateItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estimateItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estimateItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      estimateItemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estimateItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      estimateItemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estimateItemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> estimateItemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estimateItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'laborTypeId',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'laborTypeId',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'laborTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      laborTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'laborTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      laborTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'laborTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'laborTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> laborTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'laborTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'materialId',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'materialId',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'materialId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      materialIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'materialId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      materialIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'materialId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> materialIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'materialId',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
          QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> unitPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
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

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> wastePercentEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wastePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> wastePercentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wastePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> wastePercentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wastePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem,
      QAfterFilterCondition> wastePercentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wastePercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CongTrinhEstimateItemQueryObject on QueryBuilder<
    CongTrinhEstimateItem, CongTrinhEstimateItem, QFilterCondition> {}

extension CongTrinhEstimateItemQueryLinks on QueryBuilder<CongTrinhEstimateItem,
    CongTrinhEstimateItem, QFilterCondition> {}

extension CongTrinhEstimateItemQuerySortBy
    on QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QSortBy> {
  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByCalculationMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMode', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByCalculationModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMode', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByEstimateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByEstimateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByEstimateItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateItemId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByEstimateItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateItemId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByLaborTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByLaborTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByWastePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      sortByWastePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.desc);
    });
  }
}

extension CongTrinhEstimateItemQuerySortThenBy
    on QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QSortThenBy> {
  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByCalculationMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMode', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByCalculationModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculationMode', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByEstimateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByEstimateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByEstimateItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateItemId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByEstimateItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateItemId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByLaborTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByLaborTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'laborTypeId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByMaterialId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByMaterialIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialId', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByWastePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.asc);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QAfterSortBy>
      thenByWastePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wastePercent', Sort.desc);
    });
  }
}

extension CongTrinhEstimateItemQueryWhereDistinct
    on QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct> {
  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByCalculationMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculationMode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByEstimateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByEstimateItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimateItemId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByLaborTypeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'laborTypeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByMaterialId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'materialId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, CongTrinhEstimateItem, QDistinct>
      distinctByWastePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wastePercent');
    });
  }
}

extension CongTrinhEstimateItemQueryProperty on QueryBuilder<
    CongTrinhEstimateItem, CongTrinhEstimateItem, QQueryProperty> {
  QueryBuilder<CongTrinhEstimateItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, double, QQueryOperations>
      amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations>
      calculationModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculationMode');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations>
      estimateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimateId');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations>
      estimateItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimateItemId');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String?, QQueryOperations>
      laborTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'laborTypeId');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String?, QQueryOperations>
      materialIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialId');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<CongTrinhEstimateItem, double, QQueryOperations>
      wastePercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wastePercent');
    });
  }
}
