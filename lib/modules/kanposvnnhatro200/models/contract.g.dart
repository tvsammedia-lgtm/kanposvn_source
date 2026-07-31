// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetContractCollection on Isar {
  IsarCollection<Contract> get contracts => this.collection();
}

const ContractSchema = CollectionSchema(
  name: r'Contract',
  id: 6075293080182411034,
  properties: {
    r'contractNumber': PropertySchema(
      id: 0,
      name: r'contractNumber',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deleted': PropertySchema(
      id: 2,
      name: r'deleted',
      type: IsarType.bool,
    ),
    r'depositAmount': PropertySchema(
      id: 3,
      name: r'depositAmount',
      type: IsarType.double,
    ),
    r'endDate': PropertySchema(
      id: 4,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'paymentCycleMonths': PropertySchema(
      id: 5,
      name: r'paymentCycleMonths',
      type: IsarType.long,
    ),
    r'rentPrice': PropertySchema(
      id: 6,
      name: r'rentPrice',
      type: IsarType.double,
    ),
    r'roomUuid': PropertySchema(
      id: 7,
      name: r'roomUuid',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 8,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'syncStatus': PropertySchema(
      id: 9,
      name: r'syncStatus',
      type: IsarType.string,
      enumMap: _ContractsyncStatusEnumValueMap,
    ),
    r'tenantUuid': PropertySchema(
      id: 10,
      name: r'tenantUuid',
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
  estimateSize: _contractEstimateSize,
  serialize: _contractSerialize,
  deserialize: _contractDeserialize,
  deserializeProp: _contractDeserializeProp,
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
  getId: _contractGetId,
  getLinks: _contractGetLinks,
  attach: _contractAttach,
  version: '3.1.0+1',
);

int _contractEstimateSize(
  Contract object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contractNumber;
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
  bytesCount += 3 + object.syncStatus.name.length * 3;
  {
    final value = object.tenantUuid;
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

void _contractSerialize(
  Contract object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contractNumber);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.deleted);
  writer.writeDouble(offsets[3], object.depositAmount);
  writer.writeDateTime(offsets[4], object.endDate);
  writer.writeLong(offsets[5], object.paymentCycleMonths);
  writer.writeDouble(offsets[6], object.rentPrice);
  writer.writeString(offsets[7], object.roomUuid);
  writer.writeDateTime(offsets[8], object.startDate);
  writer.writeString(offsets[9], object.syncStatus.name);
  writer.writeString(offsets[10], object.tenantUuid);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeString(offsets[12], object.uuid);
}

Contract _contractDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Contract();
  object.contractNumber = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.deleted = reader.readBool(offsets[2]);
  object.depositAmount = reader.readDoubleOrNull(offsets[3]);
  object.endDate = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.paymentCycleMonths = reader.readLongOrNull(offsets[5]);
  object.rentPrice = reader.readDoubleOrNull(offsets[6]);
  object.roomUuid = reader.readStringOrNull(offsets[7]);
  object.startDate = reader.readDateTimeOrNull(offsets[8]);
  object.syncStatus =
      _ContractsyncStatusValueEnumMap[reader.readStringOrNull(offsets[9])] ??
          SyncStatus.pending;
  object.tenantUuid = reader.readStringOrNull(offsets[10]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[11]);
  object.uuid = reader.readStringOrNull(offsets[12]);
  return object;
}

P _contractDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (_ContractsyncStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          SyncStatus.pending) as P;
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

const _ContractsyncStatusEnumValueMap = {
  r'pending': r'pending',
  r'synced': r'synced',
  r'error': r'error',
};
const _ContractsyncStatusValueEnumMap = {
  r'pending': SyncStatus.pending,
  r'synced': SyncStatus.synced,
  r'error': SyncStatus.error,
};

Id _contractGetId(Contract object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _contractGetLinks(Contract object) {
  return [];
}

void _contractAttach(IsarCollection<dynamic> col, Id id, Contract object) {
  object.id = id;
}

extension ContractByIndex on IsarCollection<Contract> {
  Future<Contract?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  Contract? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<Contract?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<Contract?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(Contract object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(Contract object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<Contract> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<Contract> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension ContractQueryWhereSort on QueryBuilder<Contract, Contract, QWhere> {
  QueryBuilder<Contract, Contract, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ContractQueryWhere on QueryBuilder<Contract, Contract, QWhereClause> {
  QueryBuilder<Contract, Contract, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Contract, Contract, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Contract, Contract, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Contract, Contract, QAfterWhereClause> idBetween(
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

  QueryBuilder<Contract, Contract, QAfterWhereClause> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterWhereClause> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterWhereClause> uuidEqualTo(
      String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterWhereClause> uuidNotEqualTo(
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

extension ContractQueryFilter
    on QueryBuilder<Contract, Contract, QFilterCondition> {
  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractNumber',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractNumber',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> contractNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> contractNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> contractNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      contractNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> deletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      depositAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'depositAmount',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      depositAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'depositAmount',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> depositAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      depositAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> depositAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> depositAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'depositAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> endDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> endDateGreaterThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> endDateLessThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> endDateBetween(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      paymentCycleMonthsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentCycleMonths',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      paymentCycleMonthsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentCycleMonths',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      paymentCycleMonthsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentCycleMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      paymentCycleMonthsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentCycleMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      paymentCycleMonthsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentCycleMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      paymentCycleMonthsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentCycleMonths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> rentPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rentPrice',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> rentPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rentPrice',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> rentPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> rentPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> rentPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> rentPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomUuid',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidEqualTo(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidGreaterThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidLessThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidBetween(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidStartsWith(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidEndsWith(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> roomUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> startDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> startDateGreaterThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> startDateLessThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> startDateBetween(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusEqualTo(
    SyncStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusGreaterThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusLessThan(
    SyncStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenantUuid',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      tenantUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenantUuid',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tenantUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenantUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenantUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> tenantUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition>
      tenantUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenantUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidContains(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Contract, Contract, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension ContractQueryObject
    on QueryBuilder<Contract, Contract, QFilterCondition> {}

extension ContractQueryLinks
    on QueryBuilder<Contract, Contract, QFilterCondition> {}

extension ContractQuerySortBy on QueryBuilder<Contract, Contract, QSortBy> {
  QueryBuilder<Contract, Contract, QAfterSortBy> sortByContractNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByContractNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByPaymentCycleMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentCycleMonths', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy>
      sortByPaymentCycleMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentCycleMonths', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPrice', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByRentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPrice', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByTenantUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByTenantUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension ContractQuerySortThenBy
    on QueryBuilder<Contract, Contract, QSortThenBy> {
  QueryBuilder<Contract, Contract, QAfterSortBy> thenByContractNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByContractNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deleted', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByPaymentCycleMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentCycleMonths', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy>
      thenByPaymentCycleMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentCycleMonths', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPrice', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByRentPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentPrice', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByRoomUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByRoomUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomUuid', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByTenantUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByTenantUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantUuid', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Contract, Contract, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension ContractQueryWhereDistinct
    on QueryBuilder<Contract, Contract, QDistinct> {
  QueryBuilder<Contract, Contract, QDistinct> distinctByContractNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deleted');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depositAmount');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByPaymentCycleMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentCycleMonths');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByRentPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentPrice');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByRoomUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctBySyncStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByTenantUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenantUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Contract, Contract, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension ContractQueryProperty
    on QueryBuilder<Contract, Contract, QQueryProperty> {
  QueryBuilder<Contract, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Contract, String?, QQueryOperations> contractNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractNumber');
    });
  }

  QueryBuilder<Contract, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Contract, bool, QQueryOperations> deletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deleted');
    });
  }

  QueryBuilder<Contract, double?, QQueryOperations> depositAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depositAmount');
    });
  }

  QueryBuilder<Contract, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<Contract, int?, QQueryOperations> paymentCycleMonthsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentCycleMonths');
    });
  }

  QueryBuilder<Contract, double?, QQueryOperations> rentPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentPrice');
    });
  }

  QueryBuilder<Contract, String?, QQueryOperations> roomUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomUuid');
    });
  }

  QueryBuilder<Contract, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<Contract, SyncStatus, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<Contract, String?, QQueryOperations> tenantUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenantUuid');
    });
  }

  QueryBuilder<Contract, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Contract, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
