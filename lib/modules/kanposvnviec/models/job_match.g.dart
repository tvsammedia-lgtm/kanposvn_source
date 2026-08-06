// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_match.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViecJobMatchCollection on Isar {
  IsarCollection<ViecJobMatch> get viecJobMatchs => this.collection();
}

const ViecJobMatchSchema = CollectionSchema(
  name: r'ViecJobMatch',
  id: 4988078808524053450,
  properties: {
    r'candidateId': PropertySchema(
      id: 0,
      name: r'candidateId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'distanceKm': PropertySchema(
      id: 2,
      name: r'distanceKm',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'jobId': PropertySchema(
      id: 4,
      name: r'jobId',
      type: IsarType.string,
    ),
    r'matchId': PropertySchema(
      id: 5,
      name: r'matchId',
      type: IsarType.string,
    ),
    r'matchScore': PropertySchema(
      id: 6,
      name: r'matchScore',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
    )
  },
  estimateSize: _viecJobMatchEstimateSize,
  serialize: _viecJobMatchSerialize,
  deserialize: _viecJobMatchDeserialize,
  deserializeProp: _viecJobMatchDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'matchId': IndexSchema(
      id: -6517933327003962923,
      name: r'matchId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'matchId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _viecJobMatchGetId,
  getLinks: _viecJobMatchGetLinks,
  attach: _viecJobMatchAttach,
  version: '3.1.0+1',
);

int _viecJobMatchEstimateSize(
  ViecJobMatch object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.candidateId.length * 3;
  bytesCount += 3 + object.jobId.length * 3;
  bytesCount += 3 + object.matchId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _viecJobMatchSerialize(
  ViecJobMatch object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.candidateId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDouble(offsets[2], object.distanceKm);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.jobId);
  writer.writeString(offsets[5], object.matchId);
  writer.writeDouble(offsets[6], object.matchScore);
  writer.writeString(offsets[7], object.status);
}

ViecJobMatch _viecJobMatchDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViecJobMatch();
  object.candidateId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.distanceKm = reader.readDouble(offsets[2]);
  object.isSynced = reader.readBool(offsets[3]);
  object.isarId = id;
  object.jobId = reader.readString(offsets[4]);
  object.matchId = reader.readString(offsets[5]);
  object.matchScore = reader.readDouble(offsets[6]);
  object.status = reader.readString(offsets[7]);
  return object;
}

P _viecJobMatchDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _viecJobMatchGetId(ViecJobMatch object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _viecJobMatchGetLinks(ViecJobMatch object) {
  return [];
}

void _viecJobMatchAttach(
    IsarCollection<dynamic> col, Id id, ViecJobMatch object) {
  object.isarId = id;
}

extension ViecJobMatchByIndex on IsarCollection<ViecJobMatch> {
  Future<ViecJobMatch?> getByMatchId(String matchId) {
    return getByIndex(r'matchId', [matchId]);
  }

  ViecJobMatch? getByMatchIdSync(String matchId) {
    return getByIndexSync(r'matchId', [matchId]);
  }

  Future<bool> deleteByMatchId(String matchId) {
    return deleteByIndex(r'matchId', [matchId]);
  }

  bool deleteByMatchIdSync(String matchId) {
    return deleteByIndexSync(r'matchId', [matchId]);
  }

  Future<List<ViecJobMatch?>> getAllByMatchId(List<String> matchIdValues) {
    final values = matchIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'matchId', values);
  }

  List<ViecJobMatch?> getAllByMatchIdSync(List<String> matchIdValues) {
    final values = matchIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'matchId', values);
  }

  Future<int> deleteAllByMatchId(List<String> matchIdValues) {
    final values = matchIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'matchId', values);
  }

  int deleteAllByMatchIdSync(List<String> matchIdValues) {
    final values = matchIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'matchId', values);
  }

  Future<Id> putByMatchId(ViecJobMatch object) {
    return putByIndex(r'matchId', object);
  }

  Id putByMatchIdSync(ViecJobMatch object, {bool saveLinks = true}) {
    return putByIndexSync(r'matchId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMatchId(List<ViecJobMatch> objects) {
    return putAllByIndex(r'matchId', objects);
  }

  List<Id> putAllByMatchIdSync(List<ViecJobMatch> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'matchId', objects, saveLinks: saveLinks);
  }
}

extension ViecJobMatchQueryWhereSort
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QWhere> {
  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViecJobMatchQueryWhere
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QWhereClause> {
  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhereClause> matchIdEqualTo(
      String matchId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'matchId',
        value: [matchId],
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterWhereClause> matchIdNotEqualTo(
      String matchId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchId',
              lower: [],
              upper: [matchId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchId',
              lower: [matchId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchId',
              lower: [matchId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchId',
              lower: [],
              upper: [matchId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ViecJobMatchQueryFilter
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QFilterCondition> {
  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      candidateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'candidateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      candidateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'candidateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      candidateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'candidateId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      candidateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'candidateId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      distanceKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      distanceKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      distanceKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      distanceKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distanceKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> jobIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      jobIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> jobIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> jobIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      jobIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> jobIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> jobIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> jobIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      jobIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      jobIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      matchScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
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

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension ViecJobMatchQueryObject
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QFilterCondition> {}

extension ViecJobMatchQueryLinks
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QFilterCondition> {}

extension ViecJobMatchQuerySortBy
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QSortBy> {
  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByCandidateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy>
      sortByCandidateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy>
      sortByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByJobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByMatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByMatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByMatchScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchScore', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy>
      sortByMatchScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchScore', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension ViecJobMatchQuerySortThenBy
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QSortThenBy> {
  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByCandidateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy>
      thenByCandidateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidateId', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy>
      thenByDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceKm', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByJobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByJobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobId', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByMatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByMatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByMatchScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchScore', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy>
      thenByMatchScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchScore', Sort.desc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension ViecJobMatchQueryWhereDistinct
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> {
  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByCandidateId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'candidateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceKm');
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByJobId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByMatchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByMatchScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchScore');
    });
  }

  QueryBuilder<ViecJobMatch, ViecJobMatch, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension ViecJobMatchQueryProperty
    on QueryBuilder<ViecJobMatch, ViecJobMatch, QQueryProperty> {
  QueryBuilder<ViecJobMatch, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ViecJobMatch, String, QQueryOperations> candidateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'candidateId');
    });
  }

  QueryBuilder<ViecJobMatch, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ViecJobMatch, double, QQueryOperations> distanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceKm');
    });
  }

  QueryBuilder<ViecJobMatch, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ViecJobMatch, String, QQueryOperations> jobIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobId');
    });
  }

  QueryBuilder<ViecJobMatch, String, QQueryOperations> matchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchId');
    });
  }

  QueryBuilder<ViecJobMatch, double, QQueryOperations> matchScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchScore');
    });
  }

  QueryBuilder<ViecJobMatch, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
