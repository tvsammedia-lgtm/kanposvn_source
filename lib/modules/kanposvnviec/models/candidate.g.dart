// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViecCandidateCollection on Isar {
  IsarCollection<ViecCandidate> get viecCandidates => this.collection();
}

const ViecCandidateSchema = CollectionSchema(
  name: r'ViecCandidate',
  id: -1607780388820344887,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'candidateId': PropertySchema(
      id: 1,
      name: r'candidateId',
      type: IsarType.string,
    ),
    r'categoryIds': PropertySchema(
      id: 2,
      name: r'categoryIds',
      type: IsarType.stringList,
    ),
    r'cccd': PropertySchema(
      id: 3,
      name: r'cccd',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dateOfBirth': PropertySchema(
      id: 5,
      name: r'dateOfBirth',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 6,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'desiredSalary': PropertySchema(
      id: 7,
      name: r'desiredSalary',
      type: IsarType.double,
    ),
    r'experienceYears': PropertySchema(
      id: 8,
      name: r'experienceYears',
      type: IsarType.long,
    ),
    r'fullName': PropertySchema(
      id: 9,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 10,
      name: r'gender',
      type: IsarType.string,
    ),
    r'hasCar': PropertySchema(
      id: 11,
      name: r'hasCar',
      type: IsarType.bool,
    ),
    r'hasDrivingLicense': PropertySchema(
      id: 12,
      name: r'hasDrivingLicense',
      type: IsarType.bool,
    ),
    r'hasMotorbike': PropertySchema(
      id: 13,
      name: r'hasMotorbike',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 14,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lat': PropertySchema(
      id: 15,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lng': PropertySchema(
      id: 16,
      name: r'lng',
      type: IsarType.double,
    ),
    r'phone': PropertySchema(
      id: 17,
      name: r'phone',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 18,
      name: r'status',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'workRadiusKm': PropertySchema(
      id: 20,
      name: r'workRadiusKm',
      type: IsarType.double,
    )
  },
  estimateSize: _viecCandidateEstimateSize,
  serialize: _viecCandidateSerialize,
  deserialize: _viecCandidateDeserialize,
  deserializeProp: _viecCandidateDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'candidateId': IndexSchema(
      id: -1229288301780806762,
      name: r'candidateId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'candidateId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _viecCandidateGetId,
  getLinks: _viecCandidateGetLinks,
  attach: _viecCandidateAttach,
  version: '3.1.0+1',
);

int _viecCandidateEstimateSize(
  ViecCandidate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.candidateId.length * 3;
  bytesCount += 3 + object.categoryIds.length * 3;
  {
    for (var i = 0; i < object.categoryIds.length; i++) {
      final value = object.categoryIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.cccd.length * 3;
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.gender.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _viecCandidateSerialize(
  ViecCandidate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.candidateId);
  writer.writeStringList(offsets[2], object.categoryIds);
  writer.writeString(offsets[3], object.cccd);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDateTime(offsets[5], object.dateOfBirth);
  writer.writeDateTime(offsets[6], object.deletedAt);
  writer.writeDouble(offsets[7], object.desiredSalary);
  writer.writeLong(offsets[8], object.experienceYears);
  writer.writeString(offsets[9], object.fullName);
  writer.writeString(offsets[10], object.gender);
  writer.writeBool(offsets[11], object.hasCar);
  writer.writeBool(offsets[12], object.hasDrivingLicense);
  writer.writeBool(offsets[13], object.hasMotorbike);
  writer.writeBool(offsets[14], object.isSynced);
  writer.writeDouble(offsets[15], object.lat);
  writer.writeDouble(offsets[16], object.lng);
  writer.writeString(offsets[17], object.phone);
  writer.writeString(offsets[18], object.status);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeDouble(offsets[20], object.workRadiusKm);
}

ViecCandidate _viecCandidateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViecCandidate();
  object.address = reader.readString(offsets[0]);
  object.candidateId = reader.readString(offsets[1]);
  object.categoryIds = reader.readStringList(offsets[2]) ?? [];
  object.cccd = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.dateOfBirth = reader.readDateTimeOrNull(offsets[5]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[6]);
  object.desiredSalary = reader.readDouble(offsets[7]);
  object.experienceYears = reader.readLong(offsets[8]);
  object.fullName = reader.readString(offsets[9]);
  object.gender = reader.readString(offsets[10]);
  object.hasCar = reader.readBool(offsets[11]);
  object.hasDrivingLicense = reader.readBool(offsets[12]);
  object.hasMotorbike = reader.readBool(offsets[13]);
  object.isSynced = reader.readBool(offsets[14]);
  object.isarId = id;
  object.lat = reader.readDoubleOrNull(offsets[15]);
  object.lng = reader.readDoubleOrNull(offsets[16]);
  object.phone = reader.readString(offsets[17]);
  object.status = reader.readString(offsets[18]);
  object.updatedAt = reader.readDateTime(offsets[19]);
  object.workRadiusKm = reader.readDouble(offsets[20]);
  return object;
}

P _viecCandidateDeserializeProp<P>(
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
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _viecCandidateGetId(ViecCandidate object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _viecCandidateGetLinks(ViecCandidate object) {
  return [];
}

void _viecCandidateAttach(
    IsarCollection<dynamic> col, Id id, ViecCandidate object) {
  object.isarId = id;
}

extension ViecCandidateByIndex on IsarCollection<ViecCandidate> {
  Future<ViecCandidate?> getByCandidateId(String candidateId) {
    return getByIndex(r'candidateId', [candidateId]);
  }

  ViecCandidate? getByCandidateIdSync(String candidateId) {
    return getByIndexSync(r'candidateId', [candidateId]);
  }

  Future<bool> deleteByCandidateId(String candidateId) {
    return deleteByIndex(r'candidateId', [candidateId]);
  }

  bool deleteByCandidateIdSync(String candidateId) {
    return deleteByIndexSync(r'candidateId', [candidateId]);
  }

  Future<List<ViecCandidate?>> getAllByCandidateId(
      List<String> candidateIdValues) {
    final values = candidateIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'candidateId', values);
  }

  List<ViecCandidate?> getAllByCandidateIdSync(List<String> candidateIdValues) {
    final values = candidateIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'candidateId', values);
  }

  Future<int> deleteAllByCandidateId(List<String> candidateIdValues) {
    final values = candidateIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'candidateId', values);
  }

  int deleteAllByCandidateIdSync(List<String> candidateIdValues) {
    final values = candidateIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'candidateId', values);
  }

  Future<Id> putByCandidateId(ViecCandidate object) {
    return putByIndex(r'candidateId', object);
  }

  Id putByCandidateIdSync(ViecCandidate object, {bool saveLinks = true}) {
    return putByIndexSync(r'candidateId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCandidateId(List<ViecCandidate> objects) {
    return putAllByIndex(r'candidateId', objects);
  }

  List<Id> putAllByCandidateIdSync(List<ViecCandidate> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'candidateId', objects, saveLinks: saveLinks);
  }
}

extension ViecCandidateQueryWhereSort
    on QueryBuilder<ViecCandidate, ViecCandidate, QWhere> {
  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViecCandidateQueryWhere
    on QueryBuilder<ViecCandidate, ViecCandidate, QWhereClause> {
  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhereClause>
      candidateIdEqualTo(String candidateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'candidateId',
        value: [candidateId],
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterWhereClause>
      candidateIdNotEqualTo(String candidateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'candidateId',
              lower: [],
              upper: [candidateId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'candidateId',
              lower: [candidateId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'candidateId',
              lower: [candidateId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'candidateId',
              lower: [],
              upper: [candidateId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ViecCandidateQueryFilter
    on QueryBuilder<ViecCandidate, ViecCandidate, QFilterCondition> {
  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'candidateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'candidateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'candidateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'candidateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'candidateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'candidateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'candidateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'candidateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'candidateId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      candidateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'candidateId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      categoryIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> cccdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      cccdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      cccdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> cccdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      cccdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      cccdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      cccdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> cccdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cccd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      cccdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccd',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      cccdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cccd',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      dateOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      dateOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      dateOfBirthEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfBirth',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      desiredSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desiredSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      desiredSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desiredSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      desiredSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desiredSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      desiredSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desiredSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      experienceYearsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'experienceYears',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      experienceYearsGreaterThan(
    int value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      experienceYearsLessThan(
    int value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      experienceYearsBetween(
    int lower,
    int upper, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameEqualTo(
    String value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameGreaterThan(
    String value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameLessThan(
    String value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      hasCarEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCar',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      hasDrivingLicenseEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasDrivingLicense',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      hasMotorbikeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasMotorbike',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> latBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      lngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      lngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lng',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> lngEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      lngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> lngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition> lngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneEqualTo(
    String value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneGreaterThan(
    String value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneLessThan(
    String value, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
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

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      workRadiusKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workRadiusKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      workRadiusKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workRadiusKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      workRadiusKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workRadiusKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterFilterCondition>
      workRadiusKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workRadiusKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ViecCandidateQueryObject
    on QueryBuilder<ViecCandidate, ViecCandidate, QFilterCondition> {}

extension ViecCandidateQueryLinks
    on QueryBuilder<ViecCandidate, ViecCandidate, QFilterCondition> {}

extension ViecCandidateQuerySortBy
    on QueryBuilder<ViecCandidate, ViecCandidate, QSortBy> {
  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByCandidateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByCandidateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByDesiredSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredSalary', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByDesiredSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredSalary', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByExperienceYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByHasCar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCar', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByHasCarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCar', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByHasDrivingLicense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrivingLicense', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByHasDrivingLicenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrivingLicense', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByHasMotorbike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorbike', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByHasMotorbikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorbike', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByWorkRadiusKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workRadiusKm', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      sortByWorkRadiusKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workRadiusKm', Sort.desc);
    });
  }
}

extension ViecCandidateQuerySortThenBy
    on QueryBuilder<ViecCandidate, ViecCandidate, QSortThenBy> {
  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByCandidateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByCandidateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByDesiredSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredSalary', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByDesiredSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredSalary', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByExperienceYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByHasCar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCar', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByHasCarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCar', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByHasDrivingLicense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrivingLicense', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByHasDrivingLicenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDrivingLicense', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByHasMotorbike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorbike', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByHasMotorbikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMotorbike', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByWorkRadiusKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workRadiusKm', Sort.asc);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QAfterSortBy>
      thenByWorkRadiusKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workRadiusKm', Sort.desc);
    });
  }
}

extension ViecCandidateQueryWhereDistinct
    on QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> {
  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByCandidateId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'candidateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct>
      distinctByCategoryIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryIds');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByCccd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct>
      distinctByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfBirth');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct>
      distinctByDesiredSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desiredSalary');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct>
      distinctByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'experienceYears');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByHasCar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasCar');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct>
      distinctByHasDrivingLicense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasDrivingLicense');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct>
      distinctByHasMotorbike() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasMotorbike');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lng');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ViecCandidate, ViecCandidate, QDistinct>
      distinctByWorkRadiusKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workRadiusKm');
    });
  }
}

extension ViecCandidateQueryProperty
    on QueryBuilder<ViecCandidate, ViecCandidate, QQueryProperty> {
  QueryBuilder<ViecCandidate, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ViecCandidate, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<ViecCandidate, String, QQueryOperations> candidateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'candidateId');
    });
  }

  QueryBuilder<ViecCandidate, List<String>, QQueryOperations>
      categoryIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryIds');
    });
  }

  QueryBuilder<ViecCandidate, String, QQueryOperations> cccdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccd');
    });
  }

  QueryBuilder<ViecCandidate, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ViecCandidate, DateTime?, QQueryOperations>
      dateOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfBirth');
    });
  }

  QueryBuilder<ViecCandidate, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<ViecCandidate, double, QQueryOperations>
      desiredSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desiredSalary');
    });
  }

  QueryBuilder<ViecCandidate, int, QQueryOperations> experienceYearsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'experienceYears');
    });
  }

  QueryBuilder<ViecCandidate, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<ViecCandidate, String, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<ViecCandidate, bool, QQueryOperations> hasCarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasCar');
    });
  }

  QueryBuilder<ViecCandidate, bool, QQueryOperations>
      hasDrivingLicenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasDrivingLicense');
    });
  }

  QueryBuilder<ViecCandidate, bool, QQueryOperations> hasMotorbikeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasMotorbike');
    });
  }

  QueryBuilder<ViecCandidate, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ViecCandidate, double?, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<ViecCandidate, double?, QQueryOperations> lngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lng');
    });
  }

  QueryBuilder<ViecCandidate, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<ViecCandidate, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ViecCandidate, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ViecCandidate, double, QQueryOperations> workRadiusKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workRadiusKm');
    });
  }
}
