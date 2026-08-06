// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetViecContractCollection on Isar {
  IsarCollection<ViecContract> get viecContracts => this.collection();
}

const ViecContractSchema = CollectionSchema(
  name: r'ViecContract',
  id: 1524586161662103784,
  properties: {
    r'agreedSalary': PropertySchema(
      id: 0,
      name: r'agreedSalary',
      type: IsarType.double,
    ),
    r'contractId': PropertySchema(
      id: 1,
      name: r'contractId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endDate': PropertySchema(
      id: 3,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'matchId': PropertySchema(
      id: 5,
      name: r'matchId',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 6,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
    ),
    r'terms': PropertySchema(
      id: 8,
      name: r'terms',
      type: IsarType.string,
    )
  },
  estimateSize: _viecContractEstimateSize,
  serialize: _viecContractSerialize,
  deserialize: _viecContractDeserialize,
  deserializeProp: _viecContractDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'contractId': IndexSchema(
      id: -7493569918305731036,
      name: r'contractId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'contractId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _viecContractGetId,
  getLinks: _viecContractGetLinks,
  attach: _viecContractAttach,
  version: '3.1.0+1',
);

int _viecContractEstimateSize(
  ViecContract object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.contractId.length * 3;
  bytesCount += 3 + object.matchId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.terms.length * 3;
  return bytesCount;
}

void _viecContractSerialize(
  ViecContract object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.agreedSalary);
  writer.writeString(offsets[1], object.contractId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.endDate);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.matchId);
  writer.writeDateTime(offsets[6], object.startDate);
  writer.writeString(offsets[7], object.status);
  writer.writeString(offsets[8], object.terms);
}

ViecContract _viecContractDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ViecContract();
  object.agreedSalary = reader.readDouble(offsets[0]);
  object.contractId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.endDate = reader.readDateTimeOrNull(offsets[3]);
  object.isSynced = reader.readBool(offsets[4]);
  object.isarId = id;
  object.matchId = reader.readString(offsets[5]);
  object.startDate = reader.readDateTime(offsets[6]);
  object.status = reader.readString(offsets[7]);
  object.terms = reader.readString(offsets[8]);
  return object;
}

P _viecContractDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _viecContractGetId(ViecContract object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _viecContractGetLinks(ViecContract object) {
  return [];
}

void _viecContractAttach(
    IsarCollection<dynamic> col, Id id, ViecContract object) {
  object.isarId = id;
}

extension ViecContractByIndex on IsarCollection<ViecContract> {
  Future<ViecContract?> getByContractId(String contractId) {
    return getByIndex(r'contractId', [contractId]);
  }

  ViecContract? getByContractIdSync(String contractId) {
    return getByIndexSync(r'contractId', [contractId]);
  }

  Future<bool> deleteByContractId(String contractId) {
    return deleteByIndex(r'contractId', [contractId]);
  }

  bool deleteByContractIdSync(String contractId) {
    return deleteByIndexSync(r'contractId', [contractId]);
  }

  Future<List<ViecContract?>> getAllByContractId(
      List<String> contractIdValues) {
    final values = contractIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'contractId', values);
  }

  List<ViecContract?> getAllByContractIdSync(List<String> contractIdValues) {
    final values = contractIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'contractId', values);
  }

  Future<int> deleteAllByContractId(List<String> contractIdValues) {
    final values = contractIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'contractId', values);
  }

  int deleteAllByContractIdSync(List<String> contractIdValues) {
    final values = contractIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'contractId', values);
  }

  Future<Id> putByContractId(ViecContract object) {
    return putByIndex(r'contractId', object);
  }

  Id putByContractIdSync(ViecContract object, {bool saveLinks = true}) {
    return putByIndexSync(r'contractId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByContractId(List<ViecContract> objects) {
    return putAllByIndex(r'contractId', objects);
  }

  List<Id> putAllByContractIdSync(List<ViecContract> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'contractId', objects, saveLinks: saveLinks);
  }
}

extension ViecContractQueryWhereSort
    on QueryBuilder<ViecContract, ViecContract, QWhere> {
  QueryBuilder<ViecContract, ViecContract, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ViecContractQueryWhere
    on QueryBuilder<ViecContract, ViecContract, QWhereClause> {
  QueryBuilder<ViecContract, ViecContract, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<ViecContract, ViecContract, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ViecContract, ViecContract, QAfterWhereClause> contractIdEqualTo(
      String contractId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'contractId',
        value: [contractId],
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterWhereClause>
      contractIdNotEqualTo(String contractId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contractId',
              lower: [],
              upper: [contractId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contractId',
              lower: [contractId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contractId',
              lower: [contractId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'contractId',
              lower: [],
              upper: [contractId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ViecContractQueryFilter
    on QueryBuilder<ViecContract, ViecContract, QFilterCondition> {
  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      agreedSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'agreedSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      agreedSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'agreedSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      agreedSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'agreedSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      agreedSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'agreedSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      contractIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      endDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      matchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      matchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      matchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      matchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime value, {
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      startDateLessThan(
    DateTime value, {
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      startDateBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> termsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      termsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> termsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> termsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'terms',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      termsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> termsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> termsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition> termsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'terms',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      termsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'terms',
        value: '',
      ));
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterFilterCondition>
      termsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'terms',
        value: '',
      ));
    });
  }
}

extension ViecContractQueryObject
    on QueryBuilder<ViecContract, ViecContract, QFilterCondition> {}

extension ViecContractQueryLinks
    on QueryBuilder<ViecContract, ViecContract, QFilterCondition> {}

extension ViecContractQuerySortBy
    on QueryBuilder<ViecContract, ViecContract, QSortBy> {
  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByAgreedSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedSalary', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy>
      sortByAgreedSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedSalary', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByContractId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractId', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy>
      sortByContractIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractId', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByMatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByMatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> sortByTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.desc);
    });
  }
}

extension ViecContractQuerySortThenBy
    on QueryBuilder<ViecContract, ViecContract, QSortThenBy> {
  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByAgreedSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedSalary', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy>
      thenByAgreedSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agreedSalary', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByContractId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractId', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy>
      thenByContractIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractId', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByMatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByMatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.asc);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QAfterSortBy> thenByTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.desc);
    });
  }
}

extension ViecContractQueryWhereDistinct
    on QueryBuilder<ViecContract, ViecContract, QDistinct> {
  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByAgreedSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'agreedSalary');
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByContractId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByMatchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ViecContract, ViecContract, QDistinct> distinctByTerms(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'terms', caseSensitive: caseSensitive);
    });
  }
}

extension ViecContractQueryProperty
    on QueryBuilder<ViecContract, ViecContract, QQueryProperty> {
  QueryBuilder<ViecContract, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ViecContract, double, QQueryOperations> agreedSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'agreedSalary');
    });
  }

  QueryBuilder<ViecContract, String, QQueryOperations> contractIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractId');
    });
  }

  QueryBuilder<ViecContract, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ViecContract, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<ViecContract, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ViecContract, String, QQueryOperations> matchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchId');
    });
  }

  QueryBuilder<ViecContract, DateTime, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<ViecContract, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ViecContract, String, QQueryOperations> termsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'terms');
    });
  }
}
